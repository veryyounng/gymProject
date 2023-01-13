package com.gym.dao;

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
   public List<FreeBoardVO> getFreelist() throws Exception {
      return sql.selectList(namespace + ".freeList");
   }

   //게시글 내용 보기
   @Override
   public FreeBoardVO getFreeDetail(int b_num) throws Exception {
      return sql.selectOne(namespace + ".freeDetail", b_num);
   }
   
   //게시글 조회수 세는 중 

}