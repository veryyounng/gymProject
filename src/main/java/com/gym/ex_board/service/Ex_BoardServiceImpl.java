package com.gym.ex_board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.ex_board.dao.Ex_BoardDAO;
import com.gym.ex_board.vo.Ex_BoardVO;

@Service
public class Ex_BoardServiceImpl implements Ex_BoardService {
	
	@Autowired
	private Ex_BoardDAO dao;

	//게시물 리스트
	@Override
	public List<Ex_BoardVO> getList() throws Exception {
		return dao.getList();
	}

	//게시물 작성
	@Override
	public void write(Ex_BoardVO evo) throws Exception {
		dao.write(evo);
	}
	
	//게시물 조회
	@Override
	public Ex_BoardVO view(int ex_num) throws Exception {
		return dao.view(ex_num);
	}

	//게시물 수정
	@Override
	public void Ex_Modify(Ex_BoardVO evo) throws Exception {
		dao.Ex_Modify(evo);
	}

	//게시물 삭제
	@Override
	public void Ex_delete(int ex_num) throws Exception {
		dao.Ex_delete(ex_num);
	}

	//게시물 총 갯수
	@Override
	public int ex_count() throws Exception {
		return dao.ex_count();
	}

	//게시물 리스트 + 페이징
	@Override
	public List<Ex_BoardVO> ex_listPage(int displayPost, int postNum) throws Exception {
		return dao.ex_listPage(displayPost, postNum);
	}

	//게시물 목록 + 페이징 + 검색
	@Override
	public List<Ex_BoardVO> ex_search(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		return dao.ex_search(displayPost, postNum, searchType, keyword);
	}

	//게시물 총 갯수 + 검색 적용
	@Override
	public int ex_SearchCount(String searchType, String keyword) throws Exception {
		return dao.ex_SearchCount(searchType, keyword);
	}

	
	

}
