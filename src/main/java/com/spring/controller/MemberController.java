package com.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.member.AddressService;
import com.spring.biz.member.AddressVO;
import com.spring.biz.member.DibService;
import com.spring.biz.member.DibVO;
import com.spring.biz.member.MemberService;
import com.spring.biz.member.MemberVO;
import com.spring.biz.member.OrderDetail;
import com.spring.biz.member.OrderService;
import com.spring.biz.member.OrderVO;
import com.spring.biz.product.ProductService;
import com.spring.biz.product.ProductVO;

@Controller
@RequestMapping(value="/view")
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private AddressService addressService;
	@Autowired
	private DibService dibService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ProductService productService;

	/* 주문 */
	// 주문페이지로 이동
	@RequestMapping(value = "/order.do")
	public String order(MemberVO mvo, AddressVO avo, ProductVO pvo, @RequestParam(value = "chk") String[] arpNum, @RequestParam(value = "num-product") String[] arpCnt, ArrayList<ProductVO> prodList,
			HttpSession session, Model model) {
		
		for (int i = 0; i < arpNum.length; i++) {
			pvo.setpNum(Integer.parseInt(arpNum[i]));
			prodList.add(productService.selectOneCart(pvo));
			prodList.get(i).setpCnt(Integer.parseInt(arpCnt[i]));
		}

		mvo.setmNum((Integer)session.getAttribute("mNum"));
		avo.setmNum((Integer)session.getAttribute("mNum"));

		model.addAttribute("member", memberService.selectOneMember(mvo));
		model.addAttribute("defAddr", addressService.selectOne(avo));
		model.addAttribute("prodList", prodList);

		return "order.jsp";
	}

	// 주문하기
	@RequestMapping(value = "/orderOk.do")
	public String orderOk(ProductVO pvo, OrderVO ovo, OrderDetail od, MemberVO mvo, ArrayList<ProductVO> prodList, @RequestParam(value = "pNum") String[] arpNum, @RequestParam(value = "pCnt") String[] arpCnt, HttpSession session) {
		
		for (int i = 0; i < arpNum.length; i++) {
			ProductVO p = new ProductVO();
			p.setpNum(Integer.parseInt(arpNum[i]));
			p.setpCnt(Integer.parseInt(arpCnt[i]));
			prodList.add(p);
		}
		
		
		int mNum = (Integer)session.getAttribute("mNum");
		ovo.setmNum(mNum);
		orderService.insert(ovo);

		ovo = orderService.selectOne(ovo);
		for (int i = 0; i < prodList.size(); i++) {
			od.setoNum(ovo.getoNum());
			od.setpNum(prodList.get(i).getpNum());
			od.setCnt(prodList.get(i).getpCnt());
			orderService.insert(od);
		}
		
		//포인트 업데이트
		mvo.setmNum(mNum);
		System.out.println("사용 포인트 : " + ovo.getoPoint());
		System.out.println("적립 포인트 : " + mvo.getmPoint());
		System.out.println(mvo);
		mvo.setmPoint(ovo.getoPoint()*(-1) + mvo.getmPoint());
		memberService.update(mvo);

		return "redirect:order-ok.jsp";
	}

	// 주문 목록 조회
	@RequestMapping(value = "/orderSelect.do")
	public String selectAllOrder(OrderVO ovo, HttpSession session, Model model) {
		ovo.setmNum((Integer)session.getAttribute("mNum"));

		List<OrderVO> orders = orderService.selectAll(ovo);
		System.out.println("주문목록 이동 로그 : " + orders.size());

		model.addAttribute("orders", orders);

		return "order-list.jsp";
	}

	// 취소 목록 조회
	/*
	 * @RequestMapping(value = "/orderSelect.do") public String
	 * selectAllCancel(OrderVO ovo, HttpSession session, Model model) {
	 * ovo.setmNum((Integer)session.getAttribute("mNum"));
	 * 
	 * List<OrderVO> canorder = orderService.selectAll(ovo);
	 * 
	 * model.addAttribute("canorder", canorder);
	 * 
	 * return "cancel-list.jsp"; }
	 */
	
	
	// 전체 목록 날짜 조회
	@RequestMapping(value = "/orderSearch.do")
	public String selectAllSearchOrder(OrderVO ovo, HttpSession session, Model model) {
		if (session.getAttribute("mNum") != null) {
			ovo.setmNum((Integer)(session.getAttribute("mNum")));
		}

		System.out.println("로그 : " + ovo.getSearchCal());

		List<OrderVO> searchResult = orderService.selectAll(ovo);

		model.addAttribute("orders", searchResult);
		return "order-list.jsp";
	}

	/* 배송지 */
	// 배송지 추가
	@RequestMapping(value = "/addrsInsert.do")
	public String insertAddrs(AddressVO avo, HttpSession session, HttpServletRequest request) {
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
	public String updateAddrs(AddressVO avo, HttpSession session, HttpServletRequest request) {
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
	public String deleteAddrs(AddressVO avo) {
		if (addressService.delete(avo)) {
			return "redirect:addrsSelectAll.do";
		}
		return null;
	}
	// 배송지 전체 조회
	@RequestMapping(value = "/addrsSelectAll.do")
	public String selectAllAddrs(AddressVO avo, MemberVO mvo, HttpSession session, Model model) {
		mvo.setmNum((Integer)session.getAttribute("mNum"));
		model.addAttribute("member", memberService.selectOneMember(mvo));

		avo.setmNum((Integer)session.getAttribute("mNum"));
		model.addAttribute("address", addressService.selectAll(avo));

		return "address-list.jsp";
	}

	// 배송지 조회
	@RequestMapping(value = "/addrsSelectOne.do")
	public String selectOneAddrs(AddressVO avo, Model model) {
		model.addAttribute("address", addressService.selectOne(avo));

		return "address-manage.jsp";
	}

	/* 찜 */
	// 찜 추가하기
	@ResponseBody
	@RequestMapping(value = "/dibInsert.do", method = RequestMethod.POST)
	public String insertDib(DibVO dvo, HttpSession session) {
		if (session.getAttribute("mNum") != null) {
			dvo.setmNum((Integer)(session.getAttribute("mNum")));
			if (dibService.insert(dvo)) {
				return "1";
			}
		}
		return "-1";
	}

	// 찜 삭제
	@RequestMapping(value = "/dibDelete.do", method = RequestMethod.POST)
	public @ResponseBody String deteletDib(DibVO dvo, HttpSession session, @RequestParam(value = "dibProduct", required = false) List<String> dibProduct) {
		boolean checkFlag = true;

		if (dvo.getpNum() != 0) { // 하나 삭제
			System.out.println("로그 : DeleteDibController - pNum: " + dvo.getpNum());

			dvo.setmNum((Integer)session.getAttribute("mNum"));
			System.out.println("로그 : DeleteDibController - mNum: " + dvo.getmNum());

			if (!dibService.delete(dvo)) {
				checkFlag = false;
			}
		} else { // 찜 목록에서 삭제
			for (int i = 0; i < dibProduct.size(); i++) {
				dvo.setDibNum(Integer.parseInt(dibProduct.get(i)));
				if (!dibService.delete(dvo)) {
					checkFlag = false;
				}
			}
		}

		if (checkFlag) {
			return "1";
		}
		return "-1";
	}

	// 찜 전체 조회
	@RequestMapping(value = "/dibList.do")
	public String selectAllDib(DibVO dvo, HttpSession session, Model model) {

		if (session.getAttribute("mNum") != null) {
			dvo.setmNum((Integer)session.getAttribute("mNum"));
		}

		model.addAttribute("dList", dibService.selectAll(dvo));

		return "dibs-list.jsp";
	}

}