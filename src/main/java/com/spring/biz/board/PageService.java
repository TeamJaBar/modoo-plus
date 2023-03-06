package com.spring.biz.board;

import java.util.List;

public interface PageService {
	public int getSueTotal();
	public int getMyTotal(BoardVO bvo);
	public int getMyMatchTotal(BoardVO bvo);
	public List<BoardVO> selectAllMyBoard(BoardVO bvo);
	public List<BoardVO> selectAllMatch(BoardVO bvo);
}
