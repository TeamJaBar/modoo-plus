package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.AddressDAO;
import member.AddressVO;

public class AddrsDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		forward.setPath("addrsSelect.do");
		forward.setRedirect(true);

		AddressDAO adao = new AddressDAO();
		AddressVO avo = new AddressVO();

		avo.setaNum(Integer.parseInt(request.getParameter("aNum")));
		
		if (adao.delete(avo)) {
			return forward;
		}

		return null;
	}
}
