package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.DibDAO;
import member.DibVO;

public class DibListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setPath("dibs-list.jsp");
		forward.setRedirect(false);

		DibVO dvo = new DibVO();
		DibDAO ddao = new DibDAO();

		if (request.getSession().getAttribute("mNum") != null) {
			dvo.setmNum((int)request.getSession().getAttribute("mNum"));
		}

		request.setAttribute("dList", ddao.selectAll(dvo));

		return forward;
	}

}
