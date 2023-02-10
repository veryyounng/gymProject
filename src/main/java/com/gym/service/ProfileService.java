package com.gym.service;

import java.util.List;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.ReplyVO;
import com.gym.domain.ReservationVO;
import com.gym.ex_board.vo.Ex_BoardVO;
import com.gym.ex_board.vo.Ex_ReplyVO;

public interface ProfileService {

//	현재 예약 내역 개수
	public int getMyReserveCnt(String userid) throws Exception;
	
//	현재 예약 목록
	public List<ReservationVO> getMyReserve(String userid, int displayPost,	int postNum) throws Exception;

//	예약 취소
	public void my_reserve_delete(int rv_num) throws Exception;

//	과거 예약 내역 개수
	public int getMyReservePastCnt(String userid, String date_list, String lecture_list) throws Exception;
	
//	과거 예약 목록
	public List<ReservationVO> getMyReservePast(String userid, String date_list,
			String lecture_list, int displayPost, int postNum) throws Exception;

	
	
//	마이페이지(자게) 게시글 총 개수
	public int getMyFreeCnt(String b_writer) throws Exception;

//	마이페이지(자게) 게시글 목록
	public List<FreeBoardVO> getMyFreeList(String b_writer, int displayPost, int postNum) throws Exception;

//	마이페이지(자게) 게시글 조회
	public FreeBoardVO getMyFreeDetail(int b_num) throws Exception;

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
	
	
	
//	마이페이지(운지공) 게시글 총 개수
	public int getMyExCnt(String ex_writer) throws Exception;
	
//	마이페이지(운지공) 게시글 목록
	public List<Ex_BoardVO> getMyExList(String ex_writer, int displayPost, int postNum) throws Exception;
	
//	마이페이지(운지공) 게시글 조회
	public Ex_BoardVO getMyExDetail(int ex_num) throws Exception;
	
//	마이페이지(운지공) 게시글 삭제
	public void myExDelete(int ex_num) throws Exception;
	
//	마이페이지(운지공) 게시글 일괄 삭제
	public void myExDeleteAll(String ex_writer) throws Exception;
	
//	마이페이지(운지공) 댓글 총 개수
	public int getMyExRepCnt(String exc_writer) throws Exception;
	
//	마이페이지(운지공) 댓글 목록
	public List<Ex_ReplyVO> getMyExRepList(String exc_writer, int displayPost, int postNum) throws Exception;
	
//	마이페이지(운지공) 댓글 삭제
	public void myExRepDelete(int exc_num) throws Exception;
	
//	마이페이지(운지공) 댓글 일괄 삭제	
	public void myExRepDeleteAll(String exc_writer) throws Exception;
}
