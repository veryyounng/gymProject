package com.gym.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gym.domain.FreeBoardVO;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {

	@Inject
    private SqlSession sql;
    
    private static String namespace = "com.gym.mappers.free";

   //게시글 총 갯수 세기
   @Override
   public int getFreeCnt() throws Exception {
      return sql.selectOne(namespace + ".freeCnt");
   }

   //게시글 목록 보기
   @Override
   public List<FreeBoardVO> getFreelist(int displayPost, int postNum) throws Exception {
	   HashMap<String, Integer> data = new HashMap<String, Integer>();
	   data.put("displayPost", displayPost);
	   data.put("postNum", postNum);
      return sql.selectList(namespace + ".freeList",data);
   }

   //게시글 내용 보기
   @Override
   public FreeBoardVO getFreeDetail(int b_num) throws Exception {
      return sql.selectOne(namespace + ".freeDetail", b_num);
   }

   //게시글 조회수
   @Override
   public void FreeViewCnt(int b_num) throws Exception {
	  sql.selectOne(namespace + ".freeViewCnt", b_num);
}
   
    

}