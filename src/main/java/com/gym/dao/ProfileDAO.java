package com.gym.dao;

import java.util.List;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.ReplyVO;

public interface ProfileDAO {

//	마이페이지(자게) 게시글 총 개수
	public int getMyFreeCnt(String b_writer) throws Exception;

//	마이페이지(자게) 게시글 조회
	public List<FreeBoardVO> getMyFreeList(String b_writer, int displayPost, int postNum) throws Exception;

//	마이페이지(자게) 게시글 조회

//	마이페이지(자게) 수정용 게시글 조회

//	마이페이지(자게) 게시글 작성

//	마이페이지(자게) 게시글 수정

//	마이페이지(자게) 게시글 삭제
	public void myFreeDelete(int b_num) throws Exception;

//	마이페이지(자게) 게시글 일괄 삭제
	public void myFreeDeleteAll(String b_writer) throws Exception;

//	마이페이지(자게) 댓글 총 개수
	public int getMyFreeRepCnt(String c_writer) throws Exception;
	
//	마이페이지(자게) 댓글 목록
	public List<ReplyVO> getMyFreeRepList(String c_writer, int displayPost, int postNum) throws Exception;

//	마이페이지(자게) 댓글 삭제
	public void myFreeRepDelete(int c_num) throws Exception;

//	마이페이지(자게) 댓글 일괄 삭제	
	public void myFreeRepDeleteAll(String c_writer) throws Exception;

}
