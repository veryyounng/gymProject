package com.gym.service;

import java.util.List;

import com.gym.domain.NoticeVO;

public interface NoticeService {

	//게시물 총 갯수 
	public int getCnt() throws Exception;
		
	//게시물 목록 보기, 페이징 
	public List<NoticeVO> getContent(int displayPost, int postNum) throws Exception;
	
	//게시물 내용보기 
	public NoticeVO getDetail(int notice_num) throws Exception;

	//조회수 
	public void notiViewCnt(int notice_num) throws Exception;
	
	//검색 게시물 갯수 
	public int getSearchCnt(String keyword) throws Exception;
	
	//검색 게시물 목록 
	public List<NoticeVO> getSearchList(int displayPost, int postNum, String keyword) throws Exception;
	
	//게시물 작성
	public void postWrite(NoticeVO nvo) throws Exception;
	
	//게시물 최신 번호 받아오기 
	public int getMaxNum() throws Exception;
	
	//게시물 삭제
	public void notiDelete(int notice_num) throws Exception;
	
} 
