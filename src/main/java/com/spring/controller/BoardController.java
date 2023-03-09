package com.spring.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.board.ApplicantService;
import com.spring.biz.board.ApplicantVO;
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
	private ApplicantService applicantService;
	@Autowired
	private SueService sueService;
	
	/* 게시글 */
	// 게시글 목록
	@RequestMapping("/boardList.do")
	public String selectAllMyBoard(BoardVO bvo, Model model) {
		model.addAttribute("boardList", boardService.selectAllMain(bvo));
		model.addAttribute("localList", boardService.selectAllLocal(bvo));
		return "/view/plus/board-list.jsp";
	}

	// 게시글 작성하러 이동
	@RequestMapping(value = "/createBoard.do")
	public String createBoard(SueVO svo) {
		return "/view/plus/match-insert.jsp";
	}

	// 게시글 작성
	@RequestMapping(value = "/insertBoard.do")
	public String insertBoard(BoardVO bvo, ApplicantVO avo, @RequestParam("date") @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm") Date bDate, HttpSession session) {
		System.out.println(bvo);

		// bLocal 설정
		bvo.setbLocal(boardService.getbLocal(bvo.getbAddress()));

		// bDate 설정
		System.out.println(bDate);
		bvo.setbDate(bDate);
		
		avo.setmNum((Integer)session.getAttribute("mNum"));

		if (boardService.insertBoard(bvo)) {
			bvo = null;
			bvo = boardService.selectOne(bvo);
			avo.setbNum(bvo.getbNum());
			applicantService.insert(avo);
			return "redirect:boardList.do?sortBy=1";
		}
		return null;
	}

	// 게시글 삭제

	/* 댓글 */
	// 댓글 작성
	@RequestMapping(value = "/insertComment.do")
	public @ResponseBody String insertComment(CommentVO cvo) {
		if (commentService.insertComment(cvo)) {
			return "1";
		}
		return "-1";
	}

	// 댓글 수정
	@RequestMapping(value = "/updateComment.do")
	public @ResponseBody String updateComment(CommentVO cvo) {
		if (commentService.updateComment(cvo)) {
			return "1";
		}
		return "-1";
	}

	// 댓글 삭제
	@RequestMapping(value = "/deleteComment.do")
	public @ResponseBody String deleteComment(CommentVO cvo) {
		if (commentService.deleteComment(cvo)) {
			return "1";
		}
		return "-1";
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