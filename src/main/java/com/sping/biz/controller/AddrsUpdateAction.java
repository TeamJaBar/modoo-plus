package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.AddressDAO;
import member.AddressVO;

public class AddrsUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		forward.setPath("addrsSelect.do");
		forward.setRedirect(true);

		AddressDAO adao = new AddressDAO();
		AddressVO avo = new AddressVO();
		
		avo.setmNum((int)request.getSession().getAttribute("mNum"));
		
		if (request.getParameter("defaultFl") == null) {
			avo.setIsDefault("0"); // 일반
		} else {
			adao.update(avo); // 기존 기본배송지 일반배송지로
			avo.setIsDefault("1");
		}
		
		avo.setShipName(request.getParameter("shipName"));
		avo.setDestination(request.getParameter("destination"));
		avo.setZipCode(request.getParameter("zipCode"));
		avo.setUserAddr(request.getParameter("userAddr"));
		avo.setDetailAddr(request.getParameter("detailAddr"));
		avo.setTel(request.getParameter("tel"));
		avo.setaNum(Integer.parseInt(request.getParameter("aNum")));

		if (adao.update(avo)) {
			return forward;
		}

		return null;
	}
}
