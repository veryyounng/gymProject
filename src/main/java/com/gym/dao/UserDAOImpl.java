package com.gym.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

   @Autowired
   private SqlSession sql;
   
   private static String namespace = "com.gym.mappers.user";
   
//   회원가입
   @Override
   public int join(UserVO vo) throws Exception {
      return sql.insert(namespace + ".join", vo);
   }
   
//   id 중복 체크
   @Override
   public int idchk(String userid) throws Exception {
      return sql.selectOne(namespace + ".idchk", userid);
   }
   
   @Override
	public void id() {
		// TODO Auto-generated method stub
		
	}
   @Override
	public void pw() {
		// TODO Auto-generated method stub
		
	}

}