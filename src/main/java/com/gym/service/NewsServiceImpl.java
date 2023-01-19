package com.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.dao.NewsDAO;
import com.gym.domain.NoticeVO;

@Service
public class NewsServiceImpl implements NewsService {
	@Autowired
	private NewsDAO ndao;

	
	@Override
	public List<NoticeVO> getNotiNews() throws Exception {
		return ndao.getNotiNews();
		
	}

}
