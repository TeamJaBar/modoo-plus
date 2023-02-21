package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.DibDAO;
import member.DibVO;
import product.ProductDAO;
import product.ProductVO;

// 퀵뷰, 상세 페이지
@WebServlet("/view/cartInsertOne")
public class CartInsertOneController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartInsertOneController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductVO pvo = new ProductVO();
		ProductDAO pdao = new ProductDAO();
		ArrayList<ProductVO> cart = (ArrayList<ProductVO>)request.getSession().getAttribute("cart");

		boolean isExisting = false;

		// pNum, pCnt
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		int pCnt = Integer.parseInt(request.getParameter("pCnt"));

		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getpNum() == pNum) { // 추가하려는 상품이 장바구니에 있다면
				isExisting = true;
				cart.get(i).setpCnt(cart.get(i).getpCnt() + pCnt); // 기존 장바구니 구매 수량 + pCnt
				break;
			}
		}

		if (!isExisting) {
			pvo.setpNum(pNum); // 상품 번호(PK)
			cart.add(pdao.selectOne(pvo)); // 해당 상품 정보 추가
			cart.get(cart.size() - 1).setpCnt(pCnt); // 구매 수량 = pCnt
		}

		request.getSession().setAttribute("cart", cart);
		response.getWriter().println("1");

	}
}
