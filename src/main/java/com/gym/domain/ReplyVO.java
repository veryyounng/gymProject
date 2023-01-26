package com.gym.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private int c_num;
	private String c_writer;
	private String c_contents;
	private Date c_date;
	private int b_num;
}
