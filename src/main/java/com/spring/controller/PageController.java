package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.PageDAO;
import com.spring.biz.board.PageService;
import com.spring.biz.board.PageVO;
import com.spring.biz.member.MemberVO;

@Controller
@RequestMapping(value = "/view")
public class PageController {

	@Autowired
	PageService pageService;
	//마이페이지로 이동
	@RequestMapping(value = "/mypage.do")
	public String myPaging(HttpServletRequest request, Model model, PageVO vo, PageDAO dao, MemberVO mvo) {
		// 1. 화면전환 시에 조회하는 페이지번호 and 화면에 그려질 데이터개수 2개를 전달받음
		// 첫 페이지 경우
		int pageNum = 1;
		int amount = 10;

		// 페이지번호를 클릭하는 경우
		if (request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		}

		try {
			mvo.setmNum(Integer.parseInt(request.getParameter("mNum")));
		}catch(Exception e) {
			e.printStackTrace();
			return "error.jsp";
		}
		
		// 2. pageVO생성
		List<BoardVO> list = dao.getList(pageNum, amount);
		int total = dao.getMyTotal(mvo); // 전체게시글수
		PageVO pageVO = new PageVO(pageNum, amount, total);


		// 3. 페이지네이션을 화면에 전달
		model.addAttribute("pageVO", pageVO);
		// 화면에 가지고 나갈 list를 request에 저장 !!
		model.addAttribute("list", list);
		
		model.addAttribute("pageVO", pageService.getTotal());
		return "mypage.jsp";
	}
	
	// 신고글 목록 페이지로 이동시
	@RequestMapping(value = "/adMoveSue.do")
	public String suePaging(HttpServletRequest request, Model model, PageVO vo, PageDAO dao) {
		// 1. 화면전환 시에 조회하는 페이지번호 and 화면에 그려질 데이터개수 2개를 전달받음
		// 첫 페이지 경우
		int pageNum = 1;
		int amount = 10;

		// 페이지번호를 클릭하는 경우
		if (request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		
		// 2. pageVO생성
		List<BoardVO> list = dao.getList(pageNum, amount);
		int total = dao.getSueTotal(); // 전체게시글수
		PageVO pageVO = new PageVO(pageNum, amount, total);


		// 3. 페이지네이션을 화면에 전달
		model.addAttribute("pageVO", pageVO);
		// 화면에 가지고 나갈 list를 request에 저장 !!
		model.addAttribute("list", list);
		
		model.addAttribute("pageVO", pageService.getTotal());
		return "admin-sue.jsp";
	}

}
