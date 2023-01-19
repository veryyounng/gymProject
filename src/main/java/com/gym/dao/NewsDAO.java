package com.gym.dao;

import java.util.List;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.NoticeVO;

public interface NewsDAO {

	//공지사항 목록 
	public List<NoticeVO> getNotiNews() throws Exception;
	
	public List<FreeBoardVO> getFreeNews() throws Exception;
}
