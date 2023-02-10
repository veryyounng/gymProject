package com.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.dao.ProfileDAO;
import com.gym.domain.FreeBoardVO;
import com.gym.domain.ReplyVO;
import com.gym.domain.ReservationVO;
import com.gym.ex_board.vo.Ex_BoardVO;
import com.gym.ex_board.vo.Ex_ReplyVO;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileDAO pdao;

//	현재 예약 내역 개수
	@Override
	public int getMyReserveCnt(String userid) throws Exception {
		return pdao.getMyReserveCnt(userid);
	}
	
//	현재 예약 목록
	@Override
	public List<ReservationVO> getMyReserve(String userid, int displayPost, int postNum) throws Exception {
		return pdao.getMyReserve(userid, displayPost, postNum);
	}
	
//	예약 취소
	@Override
	public void my_reserve_delete(int rv_num) throws Exception {
		pdao.my_reserve_delete(rv_num);
	}
	
//	과거 예약 내역 개수
	@Override
	public int getMyReservePastCnt(String userid, String date_list, String lecture_list) throws Exception {
		return pdao.getMyReservePastCnt(userid, date_list, lecture_list);
	}
	
//	과거 예약 목록
	@Override
	public List<ReservationVO> getMyReservePast(String userid, String date_list,
			String lecture_list, int displayPost, int postNum) throws Exception {
		return pdao.getMyReservePast(userid, date_list, lecture_list, displayPost, postNum);
	}
	
	
	
//	마이페이지(자게) 게시글 총 개수
	@Override
	public int getMyFreeCnt(String b_writer) throws Exception {
		return pdao.getMyFreeCnt(b_writer);
	}

//	마이페이지(자게) 게시글 목록
	@Override
	public List<FreeBoardVO> getMyFreeList(String b_writer, int displayPost, int postNum) throws Exception {
		return pdao.getMyFreeList(b_writer, displayPost, postNum);
	}

//	마이페이지(자게) 게시글 조회
	@Override
	public FreeBoardVO getMyFreeDetail(int b_num) throws Exception {
		return pdao.getMyFreeDetail(b_num);
	}

//	마이페이지(자게) 게시글 삭제
	@Override
	public void myFreeDelete(int b_num) throws Exception {
		pdao.myFreeDelete(b_num);
	}

//	마이페이지(자게) 게시글 일괄 삭제
	@Override
	public void myFreeDeleteAll(String b_writer) throws Exception {
		pdao.myFreeDeleteAll(b_writer);
	}

//	마이페이지(자게) 댓글 총 개수
	@Override
	public int getMyFreeRepCnt(String c_writer) throws Exception {
		return pdao.getMyFreeRepCnt(c_writer);
	}
	
//	마이페이지(자게) 댓글 목록
	@Override
	public List<ReplyVO> getMyFreeRepList(String c_writer, int displayPost, int postNum) throws Exception {
		return pdao.getMyFreeRepList(c_writer, displayPost, postNum);
	}

//	마이페이지(자게) 댓글 삭제
	@Override
	public void myFreeRepDelete(int c_num) throws Exception {
		pdao.myFreeRepDelete(c_num);
	}

//	마이페이지(자게) 댓글 일괄 삭제	
	@Override
	public void myFreeRepDeleteAll(String c_writer) throws Exception {
		pdao.myFreeRepDeleteAll(c_writer);
	}
	
	
	
//	마이페이지(운지공) 게시글 총 개수
	@Override
	public int getMyExCnt(String ex_writer) throws Exception {
		return pdao.getMyExCnt(ex_writer);
	}
	
//	마이페이지(운지공) 게시글 목록
	@Override
	public List<Ex_BoardVO> getMyExList(String ex_writer, int displayPost, int postNum) throws Exception {
		return pdao.getMyExList(ex_writer, displayPost, postNum);
	}
	
//	마이페이지(운지공) 게시글 조회
	@Override
	public Ex_BoardVO getMyExDetail(int ex_num) throws Exception {
		return pdao.getMyExDetail(ex_num);
	}
	
//	마이페이지(운지공) 게시글 삭제
	@Override
	public void myExDelete(int ex_num) throws Exception {
		pdao.myExDelete(ex_num);
	}
	
//	마이페이지(운지공) 게시글 일괄 삭제
	@Override
	public void myExDeleteAll(String ex_writer) throws Exception {
		pdao.myExDeleteAll(ex_writer);
	}
	
//	마이페이지(운지공) 댓글 총 개수
	@Override
	public int getMyExRepCnt(String ex_writer) throws Exception {
		return pdao.getMyExRepCnt(ex_writer);
	}
	
//	마이페이지(운지공) 댓글 목록
	@Override
	public List<Ex_ReplyVO> getMyExRepList(String ex_writer, int displayPost, int postNum) throws Exception {
		return pdao.getMyExRepList(ex_writer, displayPost, postNum);
	}
	
//	마이페이지(운지공) 댓글 삭제
	@Override
	public void myExRepDelete(int ex_num) throws Exception {
		pdao.myExRepDelete(ex_num);
	}
	
//	마이페이지(운지공) 댓글 일괄 삭제	
	@Override
	public void myExRepDeleteAll(String ex_writer) throws Exception {
		pdao.myExRepDeleteAll(ex_writer);
	}
}
