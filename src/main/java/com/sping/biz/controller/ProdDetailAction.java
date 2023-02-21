package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.CategoryVO;
import product.ProductDAO;
import product.ProductVO;

public class ProdDetailAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		
		forward.setPath("product-detail.jsp");
		forward.setRedirect(false);
		
		ProductVO pvo=new ProductVO();
		ProductDAO pdao=new ProductDAO();
		
		int mNum = 0;
		if (request.getSession().getAttribute("mNum") != null) {
			mNum = (int)request.getSession().getAttribute("mNum");
		}
		pvo.setDib(mNum);
		pvo.setpNum(Integer.parseInt(request.getParameter("pNum")));
		
		ProductVO product = pdao.selectOne(pvo);
		CategoryVO category = pdao.selectOneCate(product);
		
		request.setAttribute("product", product);
		request.setAttribute("category", category);
		
		System.out.println(product);
		
		return forward;
	}

}
