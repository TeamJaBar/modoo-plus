package com.spring.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("pageService")
public class PageServiceImpl implements PageService {

	@Autowired
	private PageDAO pageDAO;
	
	@Override
	public int getSueTotal() {
		return pageDAO.getSueTotal();
	}
	
	@Override
	public int getMyTotal(BoardVO bvo) {
		return pageDAO.getMyTotal(bvo);
	}

	@Override
	public int getMyMatchTotal(BoardVO bvo) {
		return pageDAO.getMyMatchTotal(bvo);
	}

	@Override
	public List<BoardVO> selectAllMyBoard(BoardVO bvo) {
		return pageDAO.selectAllMyBoard(bvo);
	}
	
	@Override
	public List<BoardVO> selectAllMatch(BoardVO bvo) {
		return pageDAO.selectAllMatch(bvo);
	}
}