package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.ProductDAO;
import product.ProductVO;

public class PrInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		forward.setPath("prSelectAll.do");
		forward.setRedirect(false);
		
		ProductVO pvo=new ProductVO();
		ProductDAO pdao=new ProductDAO();
		
		pvo.setCateNum(Integer.parseInt(request.getParameter("cateNum")));
		pvo.setpName(request.getParameter("pName"));
		pvo.setFixPrice(Integer.parseInt(request.getParameter("fixPrice")));
		pvo.setSelPrice(Integer.parseInt(request.getParameter("selPrice")));
		pvo.setRePerson(request.getParameter("rePerson"));
		pvo.setReAge(Integer.parseInt(request.getParameter("reAge")));
		pvo.setBrand(request.getParameter("brand"));
		pvo.setpImg(request.getParameter("pImg"));
		pvo.setInfoImg(request.getParameter("infoImg"));
		pvo.setProductCnt(Integer.parseInt(request.getParameter("productCnt")));
		
		pdao.insert(pvo);
		
		return forward;
	}

	
}
