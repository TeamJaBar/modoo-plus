package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;

@Controller
@RequestMapping(value="/view")
public class BoardController {		
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/boardList.do")
	public String selectAllMyBoard(BoardVO bvo, HttpSession session, Model model) {
		
		model.addAttribute("boardList", boardService.selectAllMain(bvo));

		return "/view/plus/board-list.jsp";
	}
		
}
