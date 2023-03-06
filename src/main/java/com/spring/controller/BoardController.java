package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;
import com.spring.biz.board.CommentService;
import com.spring.biz.board.CommentVO;
import com.spring.biz.sue.SueService;
import com.spring.biz.sue.SueVO;

@Controller
@RequestMapping(value = "/view")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private SueService sueService;
	
	@RequestMapping("/boardList.do")
	public String selectAllMyBoard(BoardVO bvo, Model model) {
		model.addAttribute("boardList", boardService.selectAllMain(bvo));
		return "/view/plus/board-list.jsp";
	}

	/* 댓글 */
	// 댓글 작성
	@RequestMapping(value = "/insertComment.do")
	public String insertComment(CommentVO cvo) {
		if (commentService.insertComment(cvo)) {
			return "redirect:boardDetail.do";
		}
		return null;
	}

	// 댓글 수정
	@RequestMapping(value = "/updateComment.do")
	public String updateComment(CommentVO cvo) {
		if (commentService.updateComment(cvo)) {
			return "redirect:boardDetail.do";
		}
		return null;
	}

	// 댓글 삭제
	@RequestMapping(value = "/deleteComment.do")
	public String deleteComment(CommentVO cvo) {
		if (commentService.deleteComment(cvo)) {
			return "redirect:boardDetail.do";
		}
		return null;
	}

	/* 신고 */
	// 게시글 신고
	@RequestMapping(value = "/insertSue.do")
	public String insertSue(SueVO svo, Model model) {
		if (sueService.insertSue(svo)) {
			return "redirect:boardList.do?sortBy=1";
		}
		return null;
	}

}