package com.gym.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.ReplyVO;
import com.gym.domain.ReservationVO;
import com.gym.ex_board.vo.Ex_BoardVO;
import com.gym.ex_board.vo.Ex_ReplyVO;

@Repository
public class ProfileDAOImpl implements ProfileDAO {

	@Autowired
	private SqlSession sql;

	private static String namespace = "com.gym.mappers.profile";

//	현재 예약 내역 개수
	@Override
	public int getMyReserveCnt(String userid) throws Exception {
		return sql.selectOne(namespace + ".getMyReserveCnt", userid);
	}
	
//	현재 예약 목록
	@Override
	public List<ReservationVO> getMyReserve(String userid, int displayPost, int postNum) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("userid", userid);
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".getMyReserve", data);
	}
	
//	예약 취소
	@Override
	public void my_reserve_delete(int rv_num) throws Exception {
		sql.delete(namespace + ".my_reserve_delete", rv_num);
	}
	
//	과거 예약 내역 개수
	@Override
	public int getMyReservePastCnt(String userid, String date_list, String lecture_list) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("userid", userid);
		data.put("date_list", date_list);
		data.put("lecture_list", lecture_list);
		
		return sql.selectOne(namespace + ".getMyReservePastCnt", data);
	}
	
//	과거 예약 목록
	@Override
	public List<ReservationVO> getMyReservePast(String userid, String date_list,
			String lecture_list, int displayPost, int postNum) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("userid", userid);
		data.put("date_list", date_list);
		data.put("lecture_list", lecture_list);
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".getMyReservePast", data);
	}
	
	
	
//	마이페이지(자게) 게시글 총 개수
	@Override
	public int getMyFreeCnt(String b_writer) throws Exception {
		return sql.selectOne(namespace + ".getMyFreeCnt", b_writer);
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
	@Override
	public FreeBoardVO getMyFreeDetail(int b_num) throws Exception{
		return sql.selectOne(namespace + ".getMyFreeDetail", b_num);
	}

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
	
//	마이페이지(자게) 게시글에서 댓글 작성
	@Override
	public void myFreeDetailReplyWrite(ReplyVO vo) throws Exception {
		sql.insert(namespace + ".myFreeDetailReplyWrite", vo);
	}
	
//	마이페이지(자게) 게시글에서 댓글 삭제
	@Override
	public void myFreeDetailReplyDelete(int c_num) throws Exception {
		sql.delete(namespace + ".myFreeDetailReplyDelete", c_num);
	}
	
//	마이페이지(자게) 게시글에서 댓글 수정 뷰
	@Override
	public ReplyVO myFreeDetailReplyDetail(int c_num) throws Exception {
		return sql.selectOne(namespace + ".myFreeDetailReplyDetail", c_num);
	}
	
//	마이페이지(자게) 게시글에서 댓글 수정 업데이트
	@Override
	public void myFreeDetailReplyModify(ReplyVO vo) throws Exception {
		sql.update(namespace + ".myFreeDetailReplyModify", vo);
	}

//	마이페이지(자게) 댓글 총 개수
	@Override
	public int getMyFreeRepCnt(String c_writer) throws Exception {
		return sql.selectOne(namespace + ".getMyFreeRepCnt", c_writer);
	}
	
//	마이페이지(자게) 댓글 목록
	@Override
	public List<ReplyVO> getMyFreeRepList(String c_writer, int displayPost, int postNum) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("c_writer", c_writer);
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".getMyFreeRepList", data);
	}

//	마이페이지(자게) 댓글 삭제
	@Override
	public void myFreeRepDelete(int c_num) throws Exception {
		sql.delete(namespace + ".myFreeRepDelete", c_num);
	}

//	마이페이지(자게) 댓글 일괄 삭제	
	@Override
	public void myFreeRepDeleteAll(String c_writer) throws Exception {
		sql.delete(namespace + ".myFreeRepDeleteAll", c_writer);
	}
	
	
	
//	마이페이지(운지공) 게시글 총 개수
	@Override
	public int getMyExCnt(String ex_writer) throws Exception {
		return sql.selectOne(namespace + ".getMyExCnt", ex_writer);
	}
	
//	마이페이지(운지공) 게시글 목록
	@Override
	public List<Ex_BoardVO> getMyExList(String ex_writer, int displayPost, int postNum) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("ex_writer", ex_writer);
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".getMyExList", data);
	}
	
//	마이페이지(운지공) 게시글 조회
	@Override
	public Ex_BoardVO getMyExDetail(int ex_num) throws Exception{
		return sql.selectOne(namespace + ".getMyExDetail", ex_num);
	}
	
//	마이페이지(운지공) 게시글 삭제
	@Override
	public void myExDelete(int ex_num) throws Exception {
		sql.delete(namespace + ".myExDelete", ex_num);
	}
	
//	마이페이지(운지공) 게시글 일괄 삭제
	@Override
	public void myExDeleteAll(String ex_writer) throws Exception {
		sql.delete(namespace + ".myExDeleteAll", ex_writer);
	}
	
//	마이페이지(운지공) 게시글에서 댓글 작성
	@Override
	public void myExDetailReplyWrite(Ex_ReplyVO vo) throws Exception {
		sql.insert(namespace + ".myExDetailReplyWrite", vo);
	}
	
//	마이페이지(운지공) 게시글에서 댓글 삭제
	@Override
	public void myExDetailReplyDelete(int exc_num) throws Exception {
		sql.delete(namespace + ".myExDetailReplyDelete", exc_num);
	}
	
//	마이페이지(운지공) 게시글에서 댓글 수정 뷰
	@Override
	public Ex_ReplyVO myExDetailReplyDetail(int exc_num) throws Exception {
		return sql.selectOne(namespace + ".myExDetailReplyDetail", exc_num);
	}
	
//	마이페이지(운지공) 게시글에서 댓글 수정 업데이트
	@Override
	public void myExDetailReplyModify(Ex_ReplyVO vo) throws Exception {
		sql.update(namespace + ".myExDetailReplyModify", vo);
	}
	
//	마이페이지(운지공) 댓글 총 개수
	@Override
	public int getMyExRepCnt(String ex_writer) throws Exception {
		return sql.selectOne(namespace + ".getMyExRepCnt", ex_writer);
	}
	
//	마이페이지(운지공) 댓글 목록
	@Override
	public List<Ex_ReplyVO> getMyExRepList(String exc_writer, int displayPost, int postNum) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("exc_writer", exc_writer);
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".getMyExRepList", data);
	}
	
//	마이페이지(운지공) 댓글 삭제
	@Override
	public void myExRepDelete(int exc_num) throws Exception {
		sql.delete(namespace + ".myExRepDelete", exc_num);
	}
	
//	마이페이지(운지공) 댓글 일괄 삭제	
	@Override
	public void myExRepDeleteAll(String exc_writer) throws Exception {
		sql.delete(namespace + ".myExRepDeleteAll", exc_writer);
	}
}
