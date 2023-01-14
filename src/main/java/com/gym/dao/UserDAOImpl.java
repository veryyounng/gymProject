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

//   회원정보 불러오기
	@Override
	public void userlist(String userid) throws Exception {
		sql.selectList(namespace + ".userlist", userid);
	}

//   회원정보 수정하기
	@Override
	public int profile_modify(UserVO vo) throws Exception {
		return sql.update(namespace + ".profile_modify", vo);
	}
	
//	비밀번호 수정
	@Override
	public int pw_modify(UserVO vo) throws Exception {
		return sql.update(namespace + ".pw_modify", vo);
	}
	
//	회원 탈퇴
	@Override
	public int delete_user(UserVO vo) throws Exception {
		return sql.delete(namespace + ".delete_user", vo);
	}
}
















