package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.OrderDAO;
import member.OrderVO;

public class CanListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		forward.setPath("cancel-list.jsp");
		forward.setRedirect(false);
		
		OrderVO ovo=new OrderVO();
		OrderDAO odao=new OrderDAO();
		
		ovo.setmNum((int)request.getSession().getAttribute("mNum"));
		
		ArrayList<OrderVO> canorder=odao.selectAll(ovo);
		
		request.setAttribute("canorder", canorder);
				
		return forward;
	}

}
