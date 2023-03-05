package com.spring.biz.board;

import java.util.List;

import com.spring.biz.member.MemberVO;
import com.spring.biz.sue.SueVO;

public interface PageService {
	public int getMainTotal();
	public int getSueTotal();
	public int getMyTotal(MemberVO mvo);
	public int getMyMatchTotal(MemberVO mvo);
	public List<BoardVO> getMainList(int pageNum, int amount);
	public List<BoardVO> getMyList(int pageNum, int amount);
	public List<SueVO> getSueList(int pageNum, int amount);
	public List<BoardVO> getMyMatchList(int pageNum, int amount);
}
