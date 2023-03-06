package com.spring.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("commentService")
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDAO commentDAO;
	
	@Override
	public boolean insertComment(CommentVO cvo) {
		return commentDAO.insertComment(cvo);
	}

	@Override
	public boolean updateComment(CommentVO cvo) {
		return commentDAO.updateComment(cvo);
	}

	@Override
	public boolean deleteComment(CommentVO cvo) {
		return commentDAO.deleteComment(cvo);
	}

	@Override
	public List<CommentVO> selectAll(CommentVO cvo) {
		return commentDAO.selectAll(cvo);
	}
}
