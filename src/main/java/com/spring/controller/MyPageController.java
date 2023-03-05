package com.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.board.ApplicantDAO;
import com.spring.biz.board.ApplicantService;
import com.spring.biz.board.ApplicantVO;
import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;
import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;

@Controller
@RequestMapping(value="/view")
public class MyPageController {
	
	@Autowired
	BoardService boardService;
	@Autowired
	MemberService memberService;
	@Autowired
	ApplicantService applicantService;
	
	@RequestMapping("/mypage.do")
	public String selectAllMyBoard(BoardVO bvo, HttpSession session, Model model) {
		if(session.getAttribute("mNum") != null) {
			bvo.setmNum((Integer)session.getAttribute("mNum"));			
		}
		System.out.println("mNum : " + bvo.getmNum());
		model.addAttribute("bDatas", boardService.selectAllManage(bvo));
		return "/view/plus/mypage.jsp";
	}
	
	@RequestMapping("/boardUpdate.do")
	public String updateBAction(BoardVO bvo, HttpServletRequest request) {
		//보드 매칭상태 업데이트 (모집중 OR 모집완료)
		String referer = request.getHeader("Referer");
		System.out.println(bvo);
		boardService.updateBoard(bvo);
		return "redirect:"+referer;
	}
	
	@RequestMapping("/boardDelete.do")
	public String deleteBoard(BoardVO bvo, HttpServletRequest request) {
		//내가 작성한 글 삭제
		String referer = request.getHeader("Referer");
		boardService.deleteBoard(bvo);
		return "redirect:"+referer;
	}
	
	@RequestMapping("/myBoard.do")
	public String selectAllMyMatch(BoardVO bvo, HttpSession session, Model model) {
		if(session.getAttribute("mNum") != null) {
			bvo.setmNum((Integer)session.getAttribute("mNum"));			
		}
		model.addAttribute("bDatas", boardService.selectAllMatch(bvo));
		return "/view/plus/mymatch.jsp";
	}
	
	//내가 신청한 매칭 목록 - 매칭 신청 취소
	@RequestMapping("/myEntryDelete.do")
	public String deleteMatch(ApplicantVO avo, Model model) {
		applicantService.delete(avo);
		return "/view/plus/mymatch.jsp";
	}
	
	//내가 작성한 글 - 매칭 강퇴
	@RequestMapping("/entryDelete.do")
	public String deleteApplicant(ApplicantVO avo, HttpServletRequest request, Model model) {
		String referer = request.getHeader("Referer");
		applicantService.delete(avo);
		return "redirect:"+referer;
	}
	
	//평가하기
	@RequestMapping("/userRating.do")
	public String updateScore(MemberVO mvo, ApplicantVO avo, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		int mvp = 50;
		mvo.setScore(mvp);
		memberService.update(mvo);
		//applicantService.update(avo);
		return "redirect:"+referer;
	}
	

}
