package com.spring.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.board.ApplicantService;
import com.spring.biz.board.ApplicantVO;
import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;
import com.spring.biz.board.CommentService;
import com.spring.biz.board.CommentVO;
import com.spring.biz.board.PageService;
import com.spring.biz.board.PageVO;
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
	@Autowired
	PageService pageService;
	@Autowired
	CommentService commentService;
	
	private static final int DEFAULT_PAGENUM = 1;
	private static final int DEFAULT_AMOUNT = 10;
	
	
	@RequestMapping("/mypage.do")
	public String selectAllMyBoard(BoardVO bvo, PageVO pvo, HttpSession session, Model model) {
		bvo.setAmount(DEFAULT_AMOUNT);
		// 첫 페이지
		if (bvo.getPageNum() == 0) {
			bvo.setPageNum(DEFAULT_PAGENUM);
		}

		if(session.getAttribute("mNum") != null) {
			bvo.setmNum((Integer)session.getAttribute("mNum"));			
		}
		
		int total = pageService.getMyTotal(bvo); // 전체게시글수
		pvo = new PageVO(bvo.getPageNum(), total);

		// 3. 페이지네이션을 화면에 전달
		model.addAttribute("pageVO", pvo);
		model.addAttribute("bDatas", pageService.selectAllMyBoard(bvo));
		return "/view/plus/mypage.jsp";
	}
	
	@RequestMapping("/updateBoardAction.do")
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
	public String selectAllMyMatch(BoardVO bvo, PageVO pvo, HttpSession session, Model model) {
		bvo.setAmount(DEFAULT_AMOUNT);
		// 첫 페이지
		if (bvo.getPageNum() == 0) {
			bvo.setPageNum(DEFAULT_PAGENUM);
		}

		if(session.getAttribute("mNum") != null) {
			bvo.setmNum((Integer)session.getAttribute("mNum"));			
		}
		
		int total = pageService.getMyMatchTotal(bvo); // 전체게시글수
		pvo = new PageVO(bvo.getPageNum(), total);

		// 3. 페이지네이션을 화면에 전달
		model.addAttribute("pageVO", pvo);
		model.addAttribute("bDatas", pageService.selectAllMatch(bvo));
		return "/view/plus/mymatch.jsp";
	}
	
	//내가 신청한 매칭 목록 - 매칭 신청 취소
	@RequestMapping("/myEntryDelete.do")
	public String deleteMatch(ApplicantVO avo, HttpServletRequest request, Model model) {
		String referer = request.getHeader("Referer");
		applicantService.delete(avo);
		return "redirect:"+referer;
	}
	
	//내가 작성한 글 - 매칭 강퇴
	@RequestMapping("/kickOut.do")
	public @ResponseBody String deleteApplicant(ApplicantVO avo, HttpServletRequest request, Model model) {
		if(applicantService.delete(avo)) {
			return "1";
		}
		return "-1";
	}
	
	//평가하기
	@RequestMapping("/userRating.do")
	public String updateScore(MemberVO mvo, ApplicantVO avo, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		int mvp = 50;
		mvo.setScore(mvp);
		memberService.update(mvo);
		applicantService.update(avo);
		return "redirect:"+referer;
	}
	
	//검색
	@RequestMapping({"/searchBoard.do", "/sortBoard.do"})
	public String updateScore(BoardVO bvo, Model model) {
		model.addAttribute("boardList", boardService.selectAllMain(bvo));
		return "/view/plus/board-list.jsp";
	}
	
	//보드 디테일
	@RequestMapping("/boardDetail.do")
	public String selectOneBoard(BoardVO bvo, ApplicantVO avo, HttpSession session, CommentVO cvo, Model model) {
		if(session.getAttribute("mNum") != null) {
			bvo.setmNum((Integer)session.getAttribute("mNum"));
		}
		model.addAttribute("bDatas", boardService.selectOne(bvo));
		model.addAttribute("aDatas", applicantService.selectAll(avo));
		model.addAttribute("cDatas", commentService.selectAll(cvo));
		//신고 카테고리
		//신고 여부
		return "/view/plus/match-detail.jsp";
	}
	
	@RequestMapping("/insertApplicant.do")
	public String insertApplicant(ApplicantVO avo, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		avo.setmNum((Integer)request.getSession().getAttribute("mNum"));
		applicantService.insert(avo);
		return "redirect:"+referer;
	}
	
	@RequestMapping(value="/boardUpdate.do", method=RequestMethod.GET)
	public String updateView(BoardVO bvo, Model model) {
		model.addAttribute("bDatas", boardService.selectOne(bvo));
		return "/view/plus/match-insert.jsp";
	}
	
	@RequestMapping(value = "/boardUpdate.do", method=RequestMethod.POST)
	public String updateBoard(BoardVO bvo, HttpServletRequest request, @RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm") Date bDate) {
		String referer = request.getHeader("Referer");
		bvo.setbDate(bDate);
		boardService.updateBoard(bvo);
		return "redirect:"+referer;
	}
}
