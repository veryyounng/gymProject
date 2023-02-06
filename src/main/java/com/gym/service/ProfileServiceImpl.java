package com.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.dao.ProfileDAO;
import com.gym.domain.FreeBoardVO;
import com.gym.domain.ReplyVO;
import com.gym.domain.ReservationVO;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileDAO pdao;

//	현재 예약 내역 개수
	@Override
	public int getMyReserveCnt(String userid) throws Exception {
		return pdao.getMyReserveCnt(userid);
	}
	
//	현재 예약 목록
	@Override
	public List<ReservationVO> getMyReserve(String userid, int displayPost, int postNum) throws Exception {
		return pdao.getMyReserve(userid, displayPost, postNum);
	}
	
//	예약 취소
	@Override
	public void my_reserve_delete(int rv_num) throws Exception {
		pdao.my_reserve_delete(rv_num);
	}
	
//	현재 예약 내역 개수
	@Override
	public int getMyReservePastCnt(String userid, String date_list, String lecture_list) throws Exception {
		return pdao.getMyReservePastCnt(userid, date_list, lecture_list);
	}
	
//	현재 예약 목록
	@Override
	public List<ReservationVO> getMyReservePast(String userid, String date_list,
			String lecture_list, int displayPost, int postNum) throws Exception {
		return pdao.getMyReservePast(userid, date_list, lecture_list, displayPost, postNum);
	}
	
//	마이페이지(자게) 게시글 총 개수
	@Override
	public int getMyFreeCnt(String b_writer) throws Exception {
		return pdao.getMyFreeCnt(b_writer);
	}

//	마이페이지(자게) 게시글 목록
	@Override
	public List<FreeBoardVO> getMyFreeList(String b_writer, int displayPost, int postNum) throws Exception {
		return pdao.getMyFreeList(b_writer, displayPost, postNum);
	}

//	마이페이지(자게) 게시글 조회
	@Override
	public FreeBoardVO getMyFreeDetail(int b_num) throws Exception {
		return pdao.getMyFreeDetail(b_num);
	}

//	마이페이지(자게) 게시글 삭제
	@Override
	public void myFreeDelete(int b_num) throws Exception {
		pdao.myFreeDelete(b_num);
	}

//	마이페이지(자게) 게시글 일괄 삭제
	@Override
	public void myFreeDeleteAll(String b_writer) throws Exception {
		pdao.myFreeDeleteAll(b_writer);
	}

//	마이페이지(자게) 댓글 총 개수
	@Override
	public int getMyFreeRepCnt(String c_writer) throws Exception {
		return pdao.getMyFreeRepCnt(c_writer);
	}
	
//	마이페이지(자게) 댓글 목록
	@Override
	public List<ReplyVO> getMyFreeRepList(String c_writer, int displayPost, int postNum) throws Exception {
		return pdao.getMyFreeRepList(c_writer, displayPost, postNum);
	}

//	마이페이지(자게) 댓글 삭제
	@Override
	public void myFreeRepDelete(int c_num) throws Exception {
		pdao.myFreeRepDelete(c_num);
	}

//	마이페이지(자게) 댓글 일괄 삭제	
	@Override
	public void myFreeRepDeleteAll(String c_writer) throws Exception {
		pdao.myFreeRepDeleteAll(c_writer);
	}
}
