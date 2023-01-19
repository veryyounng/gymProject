package com.gym.service;

import java.util.List;

import com.gym.domain.NoticeVO;

public interface NewsService {
	
	//공지사항 목록 
	public List<NoticeVO> getNotiNews() throws Exception;
}
