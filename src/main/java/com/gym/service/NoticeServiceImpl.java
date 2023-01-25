package com.gym.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.dao.NoticeDAO;
import com.gym.domain.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	
	@Autowired
	private NoticeDAO ndao;
	
	@Override
	public int getCnt() throws Exception {
		return ndao.getCnt();
	}

	@Override
	public List<NoticeVO> getContent(int displayPost, int postNum) throws Exception {
		return ndao.getContent(displayPost, postNum);
	}


	@Override
	public NoticeVO getDetail(int notice_num) throws Exception {
		return ndao.getDetail(notice_num);
	}
	
	
	@Override
	public void notiViewCnt(int notice_num) throws Exception {
		ndao.notiViewCnt(notice_num);
	}

	@Override
	public int getSearchCnt(String keyword) throws Exception {
		return ndao.getSearchCnt(keyword);
	}

	@Override
	public List<NoticeVO> getSearchList(int displayPost, int postNum, String keyword) throws Exception {
		return ndao.getSearchList(displayPost, postNum, keyword);
	}

	@Override
	public void postWrite(NoticeVO nvo) throws Exception {
		ndao.postWrite(nvo);
	}

	@Override
	public int getMaxNum() throws Exception {
		return ndao.getMaxNum();
	}

	@Override
	public void notiDelete(int notice_num) throws Exception {
		ndao.notiDelete(notice_num);
	} 

	

}
