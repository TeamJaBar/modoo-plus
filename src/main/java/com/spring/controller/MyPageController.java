package com.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;

@Controller
@RequestMapping(value="/view")
public class MyPageController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/mypage.do")
	public String selectAllMyBoard(BoardVO bvo, HttpSession session, Model model) {
		if(session.getAttribute("mNum") != null) {
			bvo.setmNum((Integer)session.getAttribute("mNum"));			
		}
		System.out.println("mNum : " + bvo.getmNum());
		model.addAttribute("bDatas", boardService.MyBoardSelectAll(bvo));
		return "/view/plus/mypage.jsp";
	}
	
	@RequestMapping("/boardUpdate.do")
	public String updateBAction(BoardVO bvo, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		System.out.println(bvo);
		boardService.updateBoard(bvo);
		return "redirect:"+referer;
	}
	
	@RequestMapping("/boardDelete.do")
	public String deleteBoard(BoardVO bvo, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		boardService.deleteBoard(bvo);
		return "redirect:"+referer;
	}
	

}
