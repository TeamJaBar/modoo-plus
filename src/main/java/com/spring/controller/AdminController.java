package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;
import com.spring.biz.board.PageService;
import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;
import com.spring.biz.member.OrderService;
import com.spring.biz.member.OrderVO;
import com.spring.biz.product.ProductService;
import com.spring.biz.product.ProductVO;
import com.spring.biz.sue.SueService;
import com.spring.biz.sue.SueVO;

@Controller
@RequestMapping(value = { "/view", "/view/admin" })
public class AdminController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ProductService productService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private SueService sueService;
	@Autowired
	private PageService pageService;


	// 관리자 메인 페이지로 이동
	@RequestMapping(value = { "/admin-main.do" })
	public String adminMainView(HttpSession session, OrderVO ovo, MemberVO mvo, Model model) {

		model.addAttribute("statusList", orderService.selectAll_ADMIN(ovo));

		// 일별 매출 현황
		model.addAttribute("salesList", orderService.selectAll_SALES(ovo));

		// 신규 회원가입 현황
		model.addAttribute("mList", memberService.selectAll(mvo));

		return "/view/admin/admin-home.jsp";
	}

	// 사용자 관리 페이지로 이동
	@RequestMapping(value = "/adMemberMain.do")
	public String adminMemberView(MemberVO mvo, Model model) {

		model.addAttribute("members", memberService.selectAllMember(mvo));

		return "/view/admin/admin-member.jsp";
	}

	// 사용자 수정 페이지로 이동
	@RequestMapping(value = "/memSelect.do")
	public String adminSelectOneInfo(MemberVO mvo, Model model) {
		model.addAttribute("infomember", memberService.selectOneMember(mvo));
		return "/view/admin/admin-member-update.jsp";
	}

	// 사용자 정보 수정
	@RequestMapping(value = "/memUpdate.do")
	public String adminUpdateMem(MemberVO mvo) {
		memberService.update(mvo);
		return "redirect:adMemberMain.do";
	}

	// 사용자 삭제
	@RequestMapping(value = "/memDelete.do")
	public String adminDeleteMem(MemberVO mvo) {
		memberService.delete(mvo);
		return "redirect:adMemberMain.do";
	}

	// 상품 관리 페이지로 이동
	@RequestMapping(value = "/prSelectAll.do")
	public String adminProductView(ProductVO pvo, Model model) {

		pvo.setCateNum(100);
		model.addAttribute("products", productService.selectAll(pvo));

		return "/view/admin/admin-product.jsp";
	}

	// 상품 정보 변경 페이지로 이동
	@RequestMapping(value = "/prSelect.do")
	public String adminSelectOneInfo(ProductVO pvo, Model model) {
		model.addAttribute("infoproduct", productService.selectOne(pvo));
		return "/view/admin/admin-product-update.jsp";
	}

	@RequestMapping(value = "/prUpdate.do")
	public String admincUpdatePr(ProductVO pvo) {
		productService.update(pvo);
		return "redirect:prSelectAll.do";
	}

	@RequestMapping(value = "/prDelete.do")
	public String admincDeletePr(ProductVO pvo) {
		productService.delete(pvo);
		return "redirect:prSelectAll.do";
	}

	/* 게시글 */
	// 게시글 관리 페이지 이동
	@RequestMapping(value = "/adPlusMain.do")
	public String selsctAllBoard(BoardVO bvo, Model model) {
		model.addAttribute("bDatas", boardService.selectAllManage(bvo));
		return "/view/plus/admin-board.jsp";
	}

	// 게시글 삭제
	@RequestMapping(value = "/deleteAdBoard.do")
	public String deleteBoard(BoardVO bvo) {
		boardService.deleteBoard(bvo);
		return "redirect:/view/plus/adPlusMain.do";
	}

	/* 매칭 */
	// 매칭 내역 삭제

	/* 신고 */
	// 신고글 관리 페이지 이동
	@RequestMapping(value = "/adMoveSue.do")
	public String selsctAllSue(SueVO svo, Model model) {
		model.addAttribute("sueCount", sueService.selectAllCount(svo));
		model.addAttribute("sue", sueService.selectAllSue(svo));
		return "/view/plus/admin-sue.jsp";
	}

	// 신고 상세 페이지 이동
	@RequestMapping(value = "/selectSue.do")
	public String selsctOneSue(SueVO svo, Model model, HttpSession session) {
		svo.setmNum((Integer)session.getAttribute("mNum"));
		model.addAttribute("sue", sueService.selectOneSue(svo));
		return "/view/plus/sue-detail.jsp";
	}

	// 신고 처리
	@RequestMapping(value = "/adSueMem.do")
	public String glglgl(SueVO svo, Model model) {
		// 사용자 정지
		// sue 처리 완료
		sueService.updateSue(svo);
		// 신고 board 차단
		// 다른 글 차단
		return "redirect:/view/plus/adMoveSue.do";
	}
	
}
