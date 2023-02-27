package com.spring.biz.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;
import com.spring.biz.member.OrderService;
import com.spring.biz.member.OrderVO;
import com.spring.biz.product.ProductService;
import com.spring.biz.product.ProductVO;

@Controller
@RequestMapping(value="/view")
public class AdminController {
	
		@Autowired
		private OrderService orderService;
		@Autowired
		private MemberService memberService;
		@Autowired
		private ProductService productService;
	
		//관리자 메인 페이지로 이동
		@RequestMapping(value={"/admin-main.do", "/admin/admin-main.do"})
		public String adminMainView(HttpSession session, OrderVO ovo, MemberVO mvo, Model model) {

			model.addAttribute("statusList", orderService.selectAll_ADMIN(ovo));

			// 일별 매출 현황
			model.addAttribute("salesList", orderService.selectAll_SALES(ovo));

			// 신규 회원가입 현황
			model.addAttribute("mList", memberService.selectAll(mvo));
			
			return "/view/admin/admin-home.jsp";
		}
		
		//사용자 관리 페이지로 이동
		@RequestMapping(value="/adMemberMain.do")
		public String adminMemberView(MemberVO mvo, Model model) {

			model.addAttribute("members", memberService.selectAllMember(mvo));
			
			return "/view/admin/admin-member.jsp";
		}
		
		//사용자 수정 페이지로 이동
		@RequestMapping(value="/memSelect.do")
		public String adminSelectOneInfo(MemberVO mvo, Model model) {
			model.addAttribute("infomember", memberService.selectOneInfo(mvo));
			return "/view/admin/admin-member-update.jsp";
		}
		
		//사용자 정보 수정
		@RequestMapping(value="/memUpdate.do")
		public String adminUpdateMem(MemberVO mvo) {
			memberService.update(mvo);
			return "redirect:adMemberMain.do";
		}
		
		//사용자 삭제
		@RequestMapping(value="/memDelete.do")
		public String adminDeleteMem(MemberVO mvo) {
			memberService.delete(mvo);
			return "redirect:adMemberMain.do";
		}
		
		//상품 관리 페이지로 이동
		@RequestMapping(value="/prSelectAll.do")
		public String adminProductView(ProductVO pvo, Model model) {

			pvo.setCateNum(100);
			model.addAttribute("products", productService.selectAll(pvo));
			
			return "/view/admin/admin-product.jsp";
		}
		
		//상품 정보 변경 페이지로 이동
		@RequestMapping(value="/prSelect.do")
		public String adminSelectOneInfo(ProductVO pvo, Model model) {
			model.addAttribute("infoproduct", productService.selectOne(pvo));
			return "/view/admin/admin-product-update.jsp";
		}
		
		@RequestMapping(value="/prUpdate.do")
		public String admincUpdatePr(ProductVO pvo) {
			productService.update(pvo);
			return "redirect:prSelectAll.do";
		}
		
		@RequestMapping(value="/prDelete.do")
		public String admincDeletePr(ProductVO pvo) {
			productService.delete(pvo);
			return "redirect:prSelectAll.do";
		}
}
