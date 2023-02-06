package com.gym.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MessageVO {
	private int msg_num;
	private String sender;
	private String title;
	private String contents;
	private String reception;
	private Date time;
	private String receiver;
}
