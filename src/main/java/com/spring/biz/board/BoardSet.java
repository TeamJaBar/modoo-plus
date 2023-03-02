package com.spring.biz.board;

import java.util.List;

public class BoardSet {
	private BoardVO board;
	private List<CommentVO> cList;
	public BoardVO getBoard() {
		return board;
	}
	public void setBoard(BoardVO board) {
		this.board = board;
	}
	public List<CommentVO> getcList() {
		return cList;
	}
	public void setcList(List<CommentVO> cList) {
		this.cList = cList;
	}
	@Override
	public String toString() {
		return "BoardSet [board=" + board + ", cList=" + cList + "]";
	}
	
	
}
