package com.gym.ex_board.dao;

import java.util.List;

import com.gym.ex_board.vo.Ex_BoardVO;

public interface Ex_BoardDAO {
	
	//게시물 목록
	public List<Ex_BoardVO> getList() throws Exception;
	
	//게시물 작성
	public void write(Ex_BoardVO evo) throws Exception;
	
	//게시물 조회
	public Ex_BoardVO view(int ex_num) throws Exception;
	
	//게시물 수정
	public void Ex_Modify(Ex_BoardVO evo) throws Exception;

	//게시물 삭제
	public void Ex_delete(int ex_num) throws Exception;

	//게시물 총 갯수
	public int ex_count() throws Exception;
	
	//게시물 리스트 + 페이징
	public List<Ex_BoardVO> ex_listPage(int displayPost , int postNum) throws Exception;
	
	
}
