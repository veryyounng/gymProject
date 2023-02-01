package com.gym.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.domain.FreeBoardVO;

@Repository
public class ProfileDAOImpl implements ProfileDAO {

	@Autowired
	private SqlSession sql;

	private static String namespace = "com.gym.mappers.profile";

//	마이페이지(자게) 게시글 총 개수
	@Override
	public int getMyFreeCnt() throws Exception {
		return sql.selectOne(namespace + ".getMyFreeCnt");
	}

//	마이페이지(자게) 게시글 목록
	@Override
	public List<FreeBoardVO> getMyFreeList(String b_writer, int displayPost, int postNum) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("b_writer", b_writer);
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		return sql.selectList(namespace + ".getMyFreeList", data);
	}

//	마이페이지(자게) 게시글 조회

//	마이페이지(자게) 수정용 게시글 조회

//	마이페이지(자게) 게시글 작성

//	마이페이지(자게) 게시글 수정

//	마이페이지(자게) 게시글 삭제
	@Override
	public void myFreeDelete(int b_num) throws Exception {
		sql.delete(namespace + ".myFreeDelete", b_num);
	}

//	마이페이지(자게) 게시글 일괄 삭제
	@Override
	public void myFreeDeleteAll(String b_writer) throws Exception {
		sql.delete(namespace + ".myFreeDeleteAll", b_writer);
	}

//	마이페이지(자게) 댓글 조회

//	마이페이지(자게) 댓글 삭제

//	마이페이지(자게) 댓글 일괄 삭제	

}
