package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.AddressDAO;
import member.AddressVO;
import member.MemberDAO;
import member.MemberVO;
import product.ProductDAO;
import product.ProductVO;

public class OrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		forward.setPath("order.jsp");
		forward.setRedirect(false);
		
		MemberVO mvo = new MemberVO();
		MemberDAO mdao = new MemberDAO();
		AddressVO avo = new AddressVO();
		AddressDAO adao = new AddressDAO();
		ProductVO pvo = new ProductVO();
		ProductDAO pdao = new ProductDAO();
		ArrayList<ProductVO> prodList = new ArrayList<ProductVO>();
		
		String[] arpNum = request.getParameterValues("chk");
		String[] arpCnt = request.getParameterValues("num-product");
		
		for (int i = 0; i < arpNum.length; i++) {
			pvo.setpNum(Integer.parseInt(arpNum[i]));
			pvo = pdao.selectOne(pvo);
			pvo.setpCnt(Integer.parseInt(arpCnt[i]));
			prodList.add(pvo);
		}
		System.out.println("\t주문서 상품 로그: " + prodList);
		
		mvo.setmNum((int)request.getSession().getAttribute("mNum"));
		avo.setmNum((int)request.getSession().getAttribute("mNum"));
		
		request.setAttribute("member", mdao.selectOneInfo(mvo));
		request.setAttribute("defAddr", adao.selectOne(avo));
		request.setAttribute("prodList", prodList);
		
		return forward;
	}
}
