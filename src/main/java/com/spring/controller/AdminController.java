package com.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.spring.biz.board.ApplicantService;
import com.spring.biz.board.ApplicantVO;
import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;
import com.spring.biz.board.PageService;
import com.spring.biz.board.PageVO;
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
	private ApplicantService applicantService;
	@Autowired
	private PageService pageService;

	private static final int DEFAULT_PAGENUM = 1;
	private static final int DEFAULT_AMOUNT = 10;
	private static final int SCORE = -30; // 신고당한 회원 감점
	private static final int POINT = 100; // 신고한 회원 쇼핑몰 포인트 추가

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
		String jbDatas = new Gson().toJson(boardService.selectAllManage(bvo));
		System.out.println("bDatas 로그 : " + jbDatas);
		model.addAttribute("jbDatas", jbDatas);
		return "/view/plus/admin-board.jsp";
	}

	// 게시글 개별 삭제
	// MyPageController - deleteBoard() 사용

	// 게시글 선택 삭제
	@ResponseBody
	@RequestMapping(value = "/arBoardDelete.do")
	public String deleteArBoard(BoardVO bvo, HttpServletRequest request) {
		String[] arDelete = request.getParameterValues("arbNum");

		for (int i = 0; i < arDelete.length; i++) {
			bvo.setbNum(Integer.parseInt(arDelete[i]));
			boardService.deleteBoard(bvo);
		}
		return "1";
	}

	/* 신고 */
	// 신고글 관리 페이지 이동
	@RequestMapping(value = "/adMoveSue.do", method = RequestMethod.GET)
	public String selsctAllSue(SueVO svo, PageVO pvo, Model model) {
		svo.setAmount(DEFAULT_AMOUNT);
		// 첫 페이지
		if (svo.getPageNum() == 0) {
			svo.setPageNum(DEFAULT_PAGENUM);
		}

		int total = pageService.getSueTotal(svo); // 전체게시글수
		pvo = new PageVO(svo.getPageNum(), total);

		model.addAttribute("pageVO", pvo);
		model.addAttribute("sueCount", sueService.selectCount(svo));
		model.addAttribute("sue", pageService.selectAllSue(svo));
		return "/view/plus/admin-sue.jsp";
	}

	@RequestMapping(value = "/adMoveSue.do", method = RequestMethod.POST)
	public @ResponseBody JsonObject selsctAllSueResult(SueVO svo, PageVO pvo, Model model) {
		svo.setAmount(DEFAULT_AMOUNT);
		// 첫 페이지
		if (svo.getPageNum() == 0) {
			svo.setPageNum(DEFAULT_PAGENUM);
		}

		int total = pageService.getSueTotal(svo); // 전체게시글수
		pvo = new PageVO(svo.getPageNum(), total);

		JsonObject result = new JsonObject();
		result.addProperty("pageVO", new Gson().toJson(pvo));
		result.addProperty("sue", new GsonBuilder().setPrettyPrinting().create().toJson(pageService.selectAllSue(svo)));

		System.out.println(result);

		return result;
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
	public String updateSueAd(SueVO svo, MemberVO mvo, BoardVO bvo, ApplicantVO avo, Model model) {
		boolean ismStat = svo.getmStatus() != null ? true : false;
		System.out.println(avo);
		
		// 신고글 (sResult "0" > "1")
		sueService.updateSue(svo);
		mvo.setmStatus(null);

		// 신고한 회원 포인트 적립
		mvo.setmPoint(POINT);
		memberService.update(mvo);
		
		mvo = new MemberVO();
		mvo.setmNum(svo.getSmNum());
		
		// 게시글 차단
		if (bvo.getbNum() != 0) {
			// 신고당한 회원 감점
			mvo.setScore(SCORE);
			memberService.update(mvo);

			// 신고당한 게시글 차단 (bStatus "0" > "1")
			bvo.setbStatus("1");
			boardService.updateBoard(bvo);
			
			// 해당 글에 대한 매칭 삭제
			avo.setbNum(svo.getbNum());
			applicantService.deleteApplicant(avo);
		}
		
		// 회원 정지
		if (ismStat) {
			System.out.println("mStatus");
			// 계정 3일 정지 (mStatus "0" > "1")
			mvo.setmStatus("1");
			memberService.update(mvo);
			mvo.setmStatus(null);
			
			// 해당 회원에 대한 매칭 삭제
			avo.setbNum(0);
			avo.setmNum(svo.getSmNum()); // 신고당한 회원의 PK
			applicantService.deleteApplicant(avo);
			
			// 이메일 보내기
			return "sendFreezeEmail.do";
		}

		return "redirect:selectSue.do?sNum=" + svo.getsNum();
	}

}
