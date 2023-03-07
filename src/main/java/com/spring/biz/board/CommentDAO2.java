package com.spring.biz.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("commentDAO")
public class CommentDAO2 {
   @Autowired
   private SqlSessionTemplate mybatis;

   public boolean insertComment(CommentVO cvo) {
      try {
         System.out.println("CommentDAO의 insert()");
         mybatis.insert("CommentDAO.insertComment",cvo);
      }catch(Exception e) {
         return false;
      }
      return true;
   }

   public boolean updateComment(CommentVO cvo) {
      try {
         System.out.println("CommentDAO의 update()");
         mybatis.update("CommentDAO.updateComment",cvo);
      }catch(Exception e) {
         return false;
      }
      return true;
   }

   public boolean deleteComment(CommentVO cvo) {
      try {
         System.out.println("CommentDAO의 delete()");
         mybatis.delete("CommentDAO.deleteComment",cvo);
      }catch(Exception e) {
         return false;
      }
      return true;
   }
   
   public List<CommentVO> selectAll(CommentVO cvo){
      try {
         return mybatis.selectList("CommentDAO.selectAll",cvo);
      }catch(Exception e) {
         e.printStackTrace();
      }
      return null;
   }

}