package com.gym.ex_board.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gym.ex_board.vo.Ex_BoardVO;

@Repository
public class Ex_BoardDAOImpl implements Ex_BoardDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.gym.mappers.Ex_Board";
	
	// 게시글 리스트
	@Override
	public List<Ex_BoardVO> getList() throws Exception {
		return sql.selectList(namespace + ".ex_list");
	}

	// 게시물 작성
	@Override
	public void write(Ex_BoardVO evo) throws Exception {
		sql.insert(namespace + ".ex_write", evo);
	}

	// 게시물 조회
	@Override
	public Ex_BoardVO view(int ex_num) throws Exception {
		return sql.selectOne(namespace + ".ex_view", ex_num);
	}

	// 게시물 수정
	@Override
	public void Ex_Modify(Ex_BoardVO evo) throws Exception {
		sql.update(namespace + ".ex_modify", evo);
	}

	// 게시물 삭제
	@Override
	public void Ex_delete(int ex_num) throws Exception {
		sql.delete(namespace + ".ex_delete", ex_num);
	}

	// 게시물 총 갯수
	@Override
	public int ex_count() throws Exception {
		return sql.selectOne(namespace + ".ex_count");
	}

	//게시물 리스트 + 페이징
	@Override
	public List<Ex_BoardVO> ex_listPage(int displayPost, int postNum) throws Exception {
		
		HashMap<String , Integer> data = new HashMap<String, Integer>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".ex_listpage", data);
	}

	//게시물 리스트 + 페이징 + 검색
	@Override
	public List<Ex_BoardVO> ex_search(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		HashMap<String , Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectList(namespace + ".ex_search", data);
	}

	// 검색적용 총 갯수
	@Override
	public int ex_SearchCount(String searchType, String keyword) throws Exception {
		HashMap<String , Object> data = new HashMap<String, Object>();
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectOne(namespace + ".ex_searchCount", data);
	}


	
}
