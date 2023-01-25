package com.gym.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	private SqlSession sql;
	
	private static String namespace = "com.gym.mappers.noti";

	@Override
	public int getCnt() throws Exception {
		return sql.selectOne(namespace+".notiCnt");
	}

	@Override
	public List<NoticeVO> getContent(int displayPost, int postNum) throws Exception {
		HashMap<String, Integer> datas = new HashMap<String, Integer>();
		datas.put("displayPost", displayPost);
		datas.put("postNum", postNum);
		return sql.selectList(namespace + ".notiContents", datas);
	}

	@Override
	public NoticeVO getDetail(int notice_num) throws Exception {
		return sql.selectOne(namespace + ".notiDetail", notice_num);
	}
	
	@Override
	public void notiViewCnt(int notice_num) throws Exception {
		sql.update(namespace+".notiViewCnt", notice_num);
	}

	@Override
	public int getSearchCnt(String keyword) throws Exception {
		return sql.selectOne(namespace+".getSearchCnt", keyword);
				
	}

	@Override
	public List<NoticeVO> getSearchList(int displayPost, int postNum, String keyword) throws Exception {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("displayPost", displayPost);
		datas.put("postNum", postNum);
		datas.put("keyword", keyword);
		return sql.selectList(namespace + ".getSearchList", datas);
		
	}

	@Override
	public void postWrite(NoticeVO nvo) throws Exception {
		sql.insert(namespace+".notiWrite", nvo);
	}

	@Override
	public int getMaxNum() throws Exception {
		return sql.selectOne(namespace + ".getMaxNum");
	}

	@Override
	public void notiDelete(int notice_num) throws Exception {
		sql.delete(namespace + ".notiDelete", notice_num);
	}
 

}
