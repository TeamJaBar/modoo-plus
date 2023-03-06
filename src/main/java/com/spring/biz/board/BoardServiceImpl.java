package com.spring.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO boardDAO;

	@Override
	public boolean insertBoard(BoardVO bvo) {
		return boardDAO.insertBoard(bvo);
	}

	@Override
	public boolean updateBoard(BoardVO bvo) {
		return boardDAO.updateBoard(bvo);
	}

	@Override
	public boolean deleteBoard(BoardVO bvo) {
		return boardDAO.deleteBoard(bvo);
	}

	@Override
	public List<BoardVO> selectAllMain(BoardVO bvo) {
		return boardDAO.selectAllMain(bvo);
	}

	@Override
	public List<BoardVO> selectAllManage(BoardVO bvo) {
		return boardDAO.selectAllManage(bvo);
	}

	@Override
	public BoardVO selectOne(BoardVO bvo) {
		return boardDAO.selectOne(bvo);
	}
}
