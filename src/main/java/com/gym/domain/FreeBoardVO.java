package com.gym.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class FreeBoardVO {
//   create table f_board(
//         b_num int primary key auto_increment,
//          b_title varchar(1000) not null,   
//         b_writer varchar(300) not null,   
//         b_date datetime default now(),   
//         b_content text not null,   
//         b_like int,   
//         view_cnt int default 0
//      );
   
   private int b_num;
   private String b_title;
   private String b_writer;
   private Date b_date;
   private String b_content;
   private int b_like;
   private int view_cnt;

   public String getB_date(){
      SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm");
      String date= sdf.format(b_date);
      return date;
   } 
   
}