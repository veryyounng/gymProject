package com.gym.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gym.domain.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Inject
    private SqlSession sql;
    
    private static String namespace = "com.gym.mappers.message";
	
	@Override
	public int msgSend(MessageVO vo) throws Exception {
		return sql.insert(namespace+".msgSend",vo);
	}

	@Override
	public List<MessageVO> getMailbox(String userid) {
		return sql.selectList(namespace+".getMailbox",userid);
	}

	@Override
	public int getCount(String userid) {
		return sql.selectOne(namespace+".getCount",userid);
	}

	@Override
	public List<MessageVO> getSentMsg(String userid) {
		return sql.selectList(namespace+".getSentMsg",userid);
	}

	@Override
	public int getSentCount(String userid) {
		return sql.selectOne(namespace+".getSentCount",userid);
	}

	@Override
	public void updateReception(int msg_num) {
		sql.update(namespace+".updateReception",msg_num);
	}

	@Override
	public MessageVO getMSG(int msg_num) {
		return sql.selectOne(namespace+".getMSG",msg_num);
	}

	@Override
	public int msgDelete(int msg_num) {
		return sql.delete(namespace+".msgDelete",msg_num);
	}

}
