package com.spring.biz.board;

import java.util.List;

import com.spring.biz.member.MemberVO;

public interface PageService {
	public int getTotal();
	public int getSueTotal();
	public int getMyTotal(MemberVO mvo);
	public List<BoardVO> getList(int pageNum, int amount);
}
