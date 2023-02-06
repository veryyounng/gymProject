package com.gym.domain;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayReadyVO {

	private String tid, next_redirect_pc_url;
	private Date created_at;
	
	private String proNum;
	private String orderId;
	private String userId;
	private String itemName;
	private String totalAmount;
	private String taxFree;
	private Integer month;
	
}
