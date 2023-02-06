package com.gym.service;

import java.util.List;

import com.gym.domain.MessageVO;

public interface MessageService {
	
	// 수신메세지 가져오기
	public List<MessageVO> getMailbox(String userid);
	
	// 메세지 보내기
	public int msgSend(MessageVO vo) throws Exception;
	
	// 수신메세지 갯수 세기
	public int getCount(String userid);

	// 발신메세지 가져오기
	public List<MessageVO> getSentMsg(String userid);
	
	// 발신메세지 갯수 세기
	public int getSentCount(String userid);
	
	// 수신여부 업데이트
	public void updateReception(int msg_num);
	
	// 메세지 자세히보기
	public MessageVO getMSG(int msg_num);
	
	// 메세지 삭제하기
	public int msgDelete(int msg_num);
}
