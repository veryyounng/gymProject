package com.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.dao.MessageDAO;
import com.gym.domain.MessageVO;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDAO dao;
	
	@Override
	public int msgSend(MessageVO vo) throws Exception {
		return dao.msgSend(vo);
	}

	@Override
	public List<MessageVO> getMailbox(String userid) {
		return dao.getMailbox(userid);
	}

	@Override
	public int getCount(String userid) {
		return dao.getCount(userid);
	}

	@Override
	public List<MessageVO> getSentMsg(String userid) {
		return dao.getSentMsg(userid);
	}

	@Override
	public int getSentCount(String userid) {
		return dao.getSentCount(userid);
	}

	@Override
	public void updateReception(int msg_num) {
		dao.updateReception(msg_num);
	}

	@Override
	public MessageVO getMSG(int msg_num) {
		return dao.getMSG(msg_num);
	}

	@Override
	public int msgDelete(int msg_num) {
		return dao.msgDelete(msg_num);
	}
	
}
