package com.spring.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.member.MemberVO;
import com.spring.biz.sue.SueVO;

@Service("pageService")
public class PageServiceImpl implements PageService {

	@Autowired
	private PageDAO pageDAO;

	@Override
	public int getMainTotal() {
		return pageDAO.getMainTotal();
	}
	@Override
	public int getSueTotal() {
		return pageDAO.getSueTotal();
	}
	
	@Override
	public int getMyTotal(MemberVO mvo) {
		return pageDAO.getMyTotal(mvo);
	}
	@Override
	public int getMyMatchTotal(MemberVO mvo) {
		return pageDAO.getMyMatchTotal(mvo);
	}
	@Override
	public List<BoardVO> getMainList(int pageNum, int amount){
		return pageDAO.getMainList(pageNum, amount);
	}
	@Override
	public List<BoardVO> getMyList(int pageNum, int amount){
		return pageDAO.getMyList(pageNum, amount);
	}
	@Override
	public List<SueVO> getSueList(int pageNum, int amount){
		return pageDAO.getSueList(pageNum, amount);
	}
	@Override
	public List<BoardVO> getMyMatchList(int pageNum, int amount) {
		return pageDAO.getMyMatchList(pageNum, amount);
	}



}