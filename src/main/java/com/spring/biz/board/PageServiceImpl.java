package com.spring.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.member.MemberVO;

@Service("pageService")
public class PageServiceImpl implements PageService {

	@Autowired
	private PageDAO pageDAO;

	@Override
	public int getTotal() {
		return pageDAO.getTotal();
	}
	
	@Override
	public int getSueTotal() {
		return pageDAO.getSueTotal();
	}
	
	@Override
	public int getMyTotal(MemberVO mvo) {
		return pageDAO.getMyTotal(mvo);
	}

	public List<BoardVO> getList(int pageNum, int amount){
		return pageDAO.getList(pageNum, amount);
	}



}