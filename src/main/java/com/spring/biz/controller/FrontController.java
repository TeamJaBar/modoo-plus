package com.spring.biz.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("uri: " + uri);
		String cp = request.getContextPath() + "/view/";
		if (uri.contains("admin/")) {
			// 관리자 페이지 경로 때문에 추가한 로직
			cp += "admin/";
		} else if (uri.contains("/view/admin/view/admin")) {
			cp += "admin/view/admin/";
		}
		System.out.println("cp: " + cp);
		String command = uri.substring(cp.length());
		System.out.println("command: " + command);

		ActionForward forward = null;
		// 실행 기능 > path
		if (command.equals("main.do")) { // main
			try {
				forward = new MainAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("join.do")) { // 회원가입 > join-ok
			try {
				forward = new JoinAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("login.do")) { // 로그인 > main
			try {
				forward = new LoginAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("logout.do")) { // 로그아웃 > main
			try {
				forward = new LogoutAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("idFind.do")) { // 아이디 찾기 > id-find-ok
			try {
				forward = new IdFindAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("pwFind.do")) { // 비밀번호 찾기 > pw-find-02
			try {
				forward = new PwFindAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("sendEmail.do")) { // 이메일 전송 > pw-find-03
			try {
				forward = new SendEmailAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("update.do")) {
			// 비밀번호 재설정 > login
			// 회원정보 변경 > changeInfo.do
			try {
				forward = new UpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("changeInfo.do")) { // 회원정보 변경 > change-info
			try {
				forward = new ChangeInfoAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("withdrawal.do")) { // 회원 탈퇴 > main
			try {
				forward = new WithdrawalAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("addrsSelect.do")) {
			// 배송지 관리 진입 > address-list
			// 배송지 수정 클릭 > address-manage
			try {
				forward = new AddrsSelectAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("addrsInsert.do")) { // 배송지 추가 완료 > address-list
			try {
				forward = new AddrsInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("addrsUpdate.do")) { // 배송지 수정 완료 > address-list
			try {
				forward = new AddrsUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("addrsDelete.do")) { // 배송지 삭제 > address-list
			try {
				forward = new AddrsDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("prInsert.do")) { // 관리자: 상품 추가
			try {
				forward = new PrInsertAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("admin-main.do")) { // 관리자 메인 화면
			try {
				forward = new AdmainAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("prSelectAll.do")) {// 관리자 상품 목록
			try {
				forward = new PrSelectAllAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("prDelete.do")) {// 관리자 상품 삭제
			try {
				forward = new PrDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("prSelect.do")) {// 관리자 상품 변경
			try {
				forward = new PrSelectAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("prUpdate.do")) {// 관리자 상품 변경 완료
			try {
				forward = new PrUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("memDelete.do")) {// 관리자: 사용자삭제
			try {
				forward = new MemDeleteAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("adMemberMain.do")) {// 관리자: 사용자목록
			try {
				forward = new AdMemberMainAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("memUpdate.do")) {// 관리자: 사용자 수정 완료
			try {
				forward = new MemUpdateAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("memSelect.do")) {// 관리자: 사용자 수정
			try {
				forward = new MemSelectAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("product.do")) { // 상품 목록
			try {
				forward = new ProdAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("productDetail.do")) { // 상품 상세
			try {
				forward = new ProdDetailAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("dibList.do")) { // 찜 목록
			try {
				forward = new DibListAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("cart.do")) { // 장바구니 목록
			try {
				forward = new CartAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("order.do")) { // 주문서 작성 페이지
			try {
				forward = new OrderAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("orderSelect.do")) { // 결제 목록
			try {
				forward = new OrListAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("orderOk.do")) { // 주문서 작성 완료
			try {
				forward = new OrderOkAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("search.do")) { // 사이드바 검색
			try {
				forward = new ShResultAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("orderSearch.do")) { // 사이드바 검색
			try {
				forward = new OrderSearchAction().execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// if (forward == null) {
		// forward = new ActionForward();
		// forward.setPath("/view/error/error.jsp");
		// forward.setRedirect(false);
		// }

		if (forward.isRedirect()) {
			System.out.println("리다이렉트");
			response.sendRedirect(forward.getPath());
		} else {
			System.out.println("포워드");
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
			dispatcher.forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

}