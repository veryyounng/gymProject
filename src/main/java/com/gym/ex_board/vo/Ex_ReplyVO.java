package com.gym.ex_board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Ex_ReplyVO {

	/*
	create table exc_comment(
			exc_num int primary key auto_increment,
			exc_writer varchar(300) not null,
			exc_contents text not null,
			exc_date datetime default now(),
			exc_like int,
			ex_num int,
		    constraint foreign key(ex_num) references ex_board(ex_num) 
		);
	*/
	
	private int ex_num;
	private int exc_num;
	private String exc_writer;
	private String exc_contents;
	private Date exc_date;
	private int exc_like;
	private String ex_title;
	
	
	
}
