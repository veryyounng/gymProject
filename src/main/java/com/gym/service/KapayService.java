package com.gym.service;

import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.gym.domain.KakaoPayApprovalVO;
import com.gym.domain.KakaoPayReadyVO;
import com.gym.domain.UserVO;
import com.gym.payment.DAO.PreReadyDAO;
import com.gym.payment.vo.PreReadyVO;

import lombok.extern.java.Log;

@Service
@Log
public class KapayService {
	
	private static final String HOST = "https://kapi.kakao.com";
	
	private KakaoPayReadyVO kakaoPayReadyVO;
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	
	@Autowired
	private PreReadyDAO pdao;
	
	public PreReadyVO testPreReady(String proNum) throws Exception {
		return pdao.getProduct(proNum);
	}
	
/*	
	public String kakaoPayReady() {
		
		RestTemplate restTemplate = new RestTemplate();
		
		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "cb1a3c37b02c9bee7ce2fcd19e970a22");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		//서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");	//CID값 테스트용
		params.add("partner_order_id", "1003"); //주문번호
		params.add("partner_user_id", "apple"); //id
		params.add("item_name", "6개월+6개월 회원권"); //아이템이름
		params.add("quantity", "1"); //수량
		params.add("total_amount", "330000"); //가격
		params.add("tax_free_amount", "100");
		params.add("approval_url", "http://localhost:9090/payment/kakaoPaySuccess");
		params.add("cancel_url", "http://localhost:9090/payment/kapayCancel");
		params.add("fail_url", "http://localhost:9090/payment/kapaySuccessFail");
		
			HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
			
		try {
			kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
		
			return kakaoPayReadyVO.getNext_redirect_pc_url();

		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return "kakaoPaySuccessFail";
	}
*/	

	public String kakaoPayReady01(PreReadyVO pr, HttpServletRequest req, String userId) {

		RestTemplate restTemplate = new RestTemplate();
		String file = "";
		String header_file = req.getScheme();
		file = req.getServerName();
		// 서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "cb1a3c37b02c9bee7ce2fcd19e970a22");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		//서버로 요청할 Body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");	//CID값 테스트용
		params.add("partner_order_id", pr.getOrderId()); //주문번호
		params.add("partner_user_id", userId); //id
		params.add("item_name", pr.getItemName()); //아이템이름
		params.add("quantity", "1"); //수량
		params.add("total_amount", pr.getTotalAmount()); //가격
		params.add("tax_free_amount", pr.getTaxFree());
		params.add("approval_url", header_file+"://"+file+"/payment/kakaoPaySuccess");
		params.add("cancel_url", header_file+"://"+file+"/payment/kapayCancel");
		params.add("fail_url", header_file+"://"+file+"/payment/kapaySuccessFail");
		
			HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
			
		try {
			kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
			kakaoPayReadyVO.setOrderId(pr.getOrderId());
			kakaoPayReadyVO.setUserId(userId);
			kakaoPayReadyVO.setTotalAmount(pr.getTotalAmount());
			kakaoPayReadyVO.setMonth(pr.getMonth());
			
			return kakaoPayReadyVO.getNext_redirect_pc_url();

		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return "kakaoPaySuccessFail";
	}
	
	
	public KakaoPayApprovalVO kakaoPayInfo(String pg_token) throws Exception {
		
		log.info("KakaoPayInfoVO............................................");
        
		
		// 유저 회원권 기간 업데이트
		String userId = kakaoPayReadyVO.getUserId();
		Integer month = kakaoPayReadyVO.getMonth();
		System.out.println("ID : " + userId + "\nMonth : " + month);

		pdao.upDate(userId, month);
		
		RestTemplate restTemplate = new RestTemplate();
		
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "cb1a3c37b02c9bee7ce2fcd19e970a22");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	
		//서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", kakaoPayReadyVO.getOrderId());
        params.add("partner_user_id", kakaoPayReadyVO.getUserId());
        params.add("pg_token", pg_token);
        params.add("total_amount", kakaoPayReadyVO.getTotalAmount());
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String,String>>(params, headers);
		
		try {
			kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
			
			log.info("SuccessApproval : " + kakaoPayApprovalVO);
			
			return kakaoPayApprovalVO;
			
		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public UserVO updateloginUser(String userid) {
		return pdao.updateloginUser(userid);
	}
}
