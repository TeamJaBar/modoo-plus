package com.spring.controller;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.biz.product.CategoryVO;
import com.spring.biz.product.ProductDAO;
import com.spring.biz.product.ProductService;
import com.spring.biz.product.ProductVO;


@Controller
@RequestMapping(value="/view")
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	//메인페이지
	@RequestMapping(value="/main.do")
	public String selectAllBoard(HttpSession session, ProductVO pvo, CategoryVO cvo, Model model) {
		final int newCategory = 1000;
		final int mdCategory = 300;
		final int lowNum = 300;
		final int highNum = 600;
		int initPageCnt = 16;
		int newPageCnt = 8;
		
		// 장바구니
		if (session.getAttribute("cart") == null) {
			ArrayList<ProductVO> cart = new ArrayList<ProductVO>();
			session.setAttribute("cart", cart);
			System.out.println("\t로그: cart 생성 완료");
		}
		
		//NEW 상품 목록
		pvo.setCateNum(newCategory);
		pvo.setPageCnt(newPageCnt);
		model.addAttribute("newList", productService.selectAll(pvo));
		
		
		//MD 추천 목록
		pvo.setCateNum(mdCategory);
		pvo.setLowNum(lowNum);
		pvo.setHighNum(highNum);
		pvo.setPageCnt(initPageCnt);
		
		if(session.getAttribute("mNum") != null) {
			pvo.setDib((int)(session.getAttribute("mNum")));
		}
		
		model.addAttribute("cateNum", mdCategory);
		model.addAttribute("lowNum", lowNum);
		model.addAttribute("highNum", highNum);
		model.addAttribute("pList", productService.selectAll(pvo));
		
		
		//MD 추천 목록 카테고리 대분류		
		cvo.setLowNum(lowNum);
		cvo.setHighNum(highNum);
		model.addAttribute("cList", productService.selectAll(cvo));
		
		return "main.jsp";
	}
	
	//상품목록페이지로 이동
	@RequestMapping(value="/product.do")
	public String productView(HttpSession session, CategoryVO cvo, ProductVO pvo, Model model) {
		int initPageCnt = 40;
		int cateNum = cvo.getCateNum();
		
		// 카테고리 목록
		model.addAttribute("cList", productService.selectAllCateNum(cvo));

		// 상품 목록
		pvo.setLowNum(cateNum);
		pvo.setHighNum(cateNum);
		pvo.setPageCnt(initPageCnt);
		if (session.getAttribute("mNum") != null) {
			pvo.setDib((Integer)session.getAttribute("mNum"));
		}

		model.addAttribute("prodList", productService.selectAll(pvo));


		return "product.jsp";
	}
	
	//상품 상세 페이지
	@RequestMapping(value="/productDetail.do")
	public String selectOne(HttpSession session, ProductVO pvo, Model model) {	
		
		if (session.getAttribute("mNum") != null) {
			pvo.setDib((Integer)session.getAttribute("mNum"));
		}
		
		pvo = productService.selectOne(pvo);
		
		model.addAttribute("product", pvo);
		model.addAttribute("category", productService.selectOneCate(pvo));
		
		return "product-detail.jsp";
	}
	
	//퀵 뷰
	@RequestMapping(value="/quickView.do", produces="application/json; charset=UTF-8")
	public @ResponseBody String selectOneQuickView(HttpSession session, ProductVO pvo) {		
		System.out.println("[퀵뷰 로그] 상품번호 : " + pvo.getpNum());
		
		if(session.getAttribute("mNum") != null) {
			pvo.setDib((int)(session.getAttribute("mNum")));
		}
		
		pvo = productService.selectOne(pvo);
		
		if(pvo != null) {
			Gson gson = new Gson();
			//System.out.println("[퀵뷰 로그] 리턴 : " + gson.toJson(pvo));
			return gson.toJson(pvo);
		}
		
		return null;
	}
	
	//검색
	@RequestMapping(value="/search.do")
	public String selectAllSearch(ProductVO pvo, Model model) {
		if(pvo.getBrand().equals("브랜드")) {
			pvo.setBrand(null);
		}
		
		model.addAttribute("rList", productService.selectAllSearch(pvo));
		model.addAttribute("searchContent",  pvo.getpName());
		
		return "search-result.jsp";
	}
	
	//필터검색
	@RequestMapping(value="/searchFilter.do")
	public String selectAllSearchFilter(HttpSession session, ProductVO pvo, CategoryVO cvo, Model model) {
		
		System.out.println("필터 검색");
		int cateNum = cvo.getCateNum();
		cvo.setLowNum(cateNum);
		cvo.setHighNum(cateNum);
		model.addAttribute("cList", productService.selectAllCateNum(cvo));
		
		
		if(session.getAttribute("mNum") != null) {
			pvo.setDib((int)session.getAttribute("mNum"));
		}
		
		model.addAttribute("searchResult", productService.selectAllFilter(pvo));
		
		
		return "product-list.jsp";
	}
	
	
	//장바구니
	@RequestMapping(value="/cart.do")
	public String cartView() {
		return "redirect:shopping-cart.jsp";
	}
	
	//장바구니에 추가 - 퀵뷰 / 상품상세 페이지
	@RequestMapping(value="/cartInsertOne.do")
	public @ResponseBody String cartInsertOne(HttpSession session, ProductVO pvo) {
		ArrayList<ProductVO> cart = (ArrayList<ProductVO>)session.getAttribute("cart");

		boolean isExisting = false;

		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getpNum() == pvo.getpNum()) { // 추가하려는 상품이 장바구니에 있다면
				isExisting = true;
				cart.get(i).setpCnt(cart.get(i).getpCnt() + pvo.getpCnt()); // 기존 장바구니 구매 수량 + pCnt
				break;
			}
		}

		if (!isExisting) {
			cart.add(productService.selectOne(pvo)); // 해당 상품 정보 추가
			cart.get(cart.size() - 1).setpCnt(pvo.getpCnt()); // 구매 수량 = pCnt
		}

		session.setAttribute("cart", cart);
		return "1";
	}
	
	//장바구니에 추가 - 찜 목록 페이지
	@RequestMapping(value="/cartInsertDib.do")
	public @ResponseBody String cartInsertDib(HttpServletRequest request, ProductVO pvo) {
		ArrayList<ProductVO> cart = (ArrayList<ProductVO>)request.getSession().getAttribute("cart");

		String[] arDibs = request.getParameterValues("dibProduct");

		for (int i = 0; i < arDibs.length; i++) {
			boolean isExisting = false;
			int pNum = Integer.parseInt(arDibs[i]);

			for (int j = 0; j < cart.size(); j++) {
				if (cart.get(j).getpNum() == pNum) { // 추가하려는 상품이 장바구니에 있다면
					isExisting = true;
					cart.get(i).setpCnt(cart.get(i).getpCnt() + 1); // 기존 장바구니 구매 수량 + pCnt
					break;
				}
			}

			if (!isExisting) { // 장바구니에 없다면
				pvo.setpNum(pNum); // 상품 번호(PK)
				cart.add(productService.selectOne(pvo)); // 해당 상품 정보 추가
				cart.get(cart.size() - 1).setpCnt(1); // 구매 수량 = 1
			}
		}

		request.getSession().setAttribute("cart", cart);
		
		return "1";
	}
	
	
	@RequestMapping(value="/cartUpdate.do")
	public @ResponseBody String cartUpdate(HttpSession session, ProductVO pvo) {
		ArrayList<ProductVO> cart = (ArrayList<ProductVO>)session.getAttribute("cart");

		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getpNum() == pvo.getpNum()) { // 추가하려는 상품이 장바구니에 있다면
				cart.get(i).setpCnt(pvo.getpCnt()); // 기존 장바구니 구매 수량 + pCnt
				break;
			}
		}

		session.setAttribute("cart", cart);
		return "1";
	}
	
	
	@RequestMapping(value="/cartDelete.do")
	public @ResponseBody String cartDelete(HttpServletRequest request) {
		ArrayList<ProductVO> cart = (ArrayList<ProductVO>)request.getSession().getAttribute("cart");

		String[] arDelete = request.getParameterValues("arProduct");
		
		for (int i = 0; i < arDelete.length; i++) {
			int pNum = Integer.parseInt(arDelete[i]);

			for (int j = 0; j < cart.size(); j++) {
				if (cart.get(j).getpNum() == pNum) {
					cart.remove(j); // 해당 인덱스의 상품 제거
					break;
				}
			}
		}

		request.getSession().setAttribute("cart", cart);
		return "1";
	}
}
