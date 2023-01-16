package com.gym.ex_board.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class Ex_BoardVO {
/*
	create table ex_board(
			ex_num int primary key auto_increment,	
			ex_title varchar(1000) not null,	
			ex_writer varchar(300) not null,	
			ex_date datetime default now(),	
			ex_content text not null,	
			ex_like int default 0,	
			view_cnt int default 0,
		    constraint foreign key(ex_writer) references user(userid)
		);	
*/

	private int ex_num;
	private String ex_title;
	private String ex_writer;
	private Date ex_date;
	private String ex_content;
	private int ex_like;
	private int view_cnt;
	private String userid;
	
//	public String getEx_date() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		String date= sdf.format(ex_date);
//		return date;
//	}

}
