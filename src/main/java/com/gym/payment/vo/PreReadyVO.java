package com.gym.payment.vo;

import lombok.Data;

@Data
public class PreReadyVO {
	
	/*
	create table product(
			pronum varchar(300) primary key,
		    orderid varchar(30) not null,
		    userid varchar(300),
		    itemname varchar(300) not null,
		    totalamount int,
		    taxfree int,
		    month int
		);
	*/
	
	private String proNum;
	private String orderId;
	private String userId;
	private String itemName;
	private String totalAmount;
	private String taxFree;
	private Integer month;

}
