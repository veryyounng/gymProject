package com.gym.service;

import com.gym.domain.UserVO;

public interface UserService {

//   회원가입
   public int join(UserVO vo) throws Exception;
   
//   id 중복 체크
   public int idchk(String userid) throws Exception;
   
}