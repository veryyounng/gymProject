package com.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.dao.UserDAO;
import com.gym.domain.UserVO;

@Service
public class UserServiceImpl implements UserService {

   @Autowired
   private UserDAO udao;
   
//   회원가입
   @Override
   public int join(UserVO vo) throws Exception {
      return udao.join(vo);
   }
   
//   id 중복 체크
   @Override
   public int idchk(String userid) throws Exception {
      return udao.idchk(userid);
   }
}