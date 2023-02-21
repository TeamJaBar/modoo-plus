package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.AddressDAO;
import member.AddressVO;
import member.MemberDAO;
import member.MemberVO;

public class AddrsSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		AddressDAO adao = new AddressDAO();
		AddressVO avo = new AddressVO();
		
		if (request.getParameter("aNum") == null) { // SelectAll
			forward.setPath("address-list.jsp");
			forward.setRedirect(false);
			
			MemberDAO mdao = new MemberDAO();
			MemberVO mvo = new MemberVO();
			
			mvo.setmId((String)request.getSession().getAttribute("mId"));
			request.setAttribute("member", mdao.selectOneInfo(mvo));
			
			avo.setmNum((int)request.getSession().getAttribute("mNum"));
			request.setAttribute("address", adao.selectAll(avo));
		} else { // SelectOne
			forward.setPath("address-manage.jsp");
			forward.setRedirect(false);
			
			avo.setaNum(Integer.parseInt(request.getParameter("aNum")));
			request.setAttribute("type", request.getParameter("type"));
			request.setAttribute("address", adao.selectOne(avo));
			
		}
		return forward;
	}
}
