package com.gym.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
   private String userid;
   private String userpw;
   private String userpw_re;
   private String username;
   private String usernick;
   private String zipcode;
   private String addr;
   private String addrdetail;
   private String addretc;
   private String email;
   private String phone;
   private Date duedate;
}