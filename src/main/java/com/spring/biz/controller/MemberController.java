package com.spring.biz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.member.AddressService;
import com.spring.biz.member.AddressVO;
import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private AddressService addressService;

	/* 배송지 */
	// 배송지 추가
	@RequestMapping(value = "/addrsInsert.do")
	public String insertAddrs(AddressVO avo, HttpSession session, HttpServletRequest request) throws Exception {
		if (request.getParameter("defaultFl") == null) {
			avo.setIsDefault("0"); // 일반
		} else {
			avo.setmNum((Integer)session.getAttribute("mNum"));
			addressService.update(avo); // 기존 기본배송지 일반배송지로
			avo.setIsDefault("1");
		}

		if (addressService.insert(avo)) {
			return "redirect:addrsSelectAll.do";
		}
		return null;
	}

	// 배송지 수정
	@RequestMapping(value = "/addrsUpdate.do")
	public String updateAddrs(AddressVO avo, HttpSession session, HttpServletRequest request) throws Exception {
		int aNum = avo.getmNum();
		avo.setmNum(0);

		if (request.getParameter("defaultFl") == null) {
			avo.setIsDefault("0"); // 일반
		} else {
			avo.setmNum((Integer)session.getAttribute("mNum"));
			addressService.update(avo); // 기존 기본배송지 일반배송지로
			avo.setIsDefault("1");
		}
		avo.setmNum(aNum);

		if (addressService.update(avo)) {
			return "redirect:addrsSelectAll.do";
		}
		return null;
	}

	// 배송지 삭제
	@RequestMapping(value = "/addrsDelete.do.do")
	public String deleteAddrs(AddressVO avo) throws Exception {
		if (addressService.delete(avo)) {
			return "redirect:addrsSelectAll.do";
		}
		return null;
	}

	// 배송지 전체 조회
	@RequestMapping(value = "/addrsSelectAll.do")
	public ModelAndView selectAllAddrs(AddressVO avo, MemberVO mvo, HttpSession session, ModelAndView mav) throws Exception {
		mvo.setmId((String)session.getAttribute("mId"));
		mav.addObject("member", memberService.selectOneInfo(mvo));

		avo.setmNum((Integer)session.getAttribute("mNum"));
		mav.addObject("address", addressService.selectAll(avo));

		mav.setViewName("address-list.jsp");
		return mav;
	}

	// 배송지 조회
	@RequestMapping(value = "/addrsSelectOne.do")
	public ModelAndView selectOneAddrs(AddressVO avo, ModelAndView mav) throws Exception {
		mav.addObject("address", addressService.selectOne(avo));

		mav.setViewName("address-manage.jsp");
		return mav;
	}

}
