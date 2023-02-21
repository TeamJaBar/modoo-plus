package com.sping.biz.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sping.biz.member.OrderDAO;
import com.sping.biz.member.OrderVO;

public class CanListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("cancel-list.jsp");
		forward.setRedirect(false);

		OrderVO ovo = new OrderVO();
		OrderDAO odao = new OrderDAO();

		ovo.setmNum((Integer)request.getSession().getAttribute("mNum"));

		ArrayList<OrderVO> canorder = odao.selectAll(ovo);

		request.setAttribute("canorder", canorder);

		return forward;
	}

}
