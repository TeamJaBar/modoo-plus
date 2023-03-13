package com.spring.biz.board;

import java.util.List;

import com.spring.biz.sue.SueVO;

public interface PageService {
	public int getSueTotal(SueVO svo);
	public int getMyTotal(BoardVO bvo);
	public int getMyMatchTotal(BoardVO bvo);
	public List<BoardVO> selectAllMyBoard(BoardVO bvo);
	public List<BoardVO> selectAllMatch(BoardVO bvo);
}
