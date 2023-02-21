package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// session에 장바구니가 있기 때문에 내용은 없지만 향후 유지 보수를 위해 넣은 Action
		ActionForward forward = new ActionForward();

		forward.setPath("shopping-cart.jsp");
		forward.setRedirect(true);

		return forward;
	}
}
