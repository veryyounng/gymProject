package com.gym.domain;

import java.util.Date;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int notice_num;
	private String notice_title;
	private String notice_contents;
	private Date notice_date;
	private int view_cnt;
	
	
}
