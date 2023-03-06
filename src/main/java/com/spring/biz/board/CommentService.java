package com.spring.biz.board;

import java.util.List;

public interface CommentService {

	   public boolean insertComment(CommentVO cvo);

	   public boolean updateComment(CommentVO cvo);

	   public boolean deleteComment(CommentVO cvo);

	   public List<CommentVO> selectAll(CommentVO cvo);
}
