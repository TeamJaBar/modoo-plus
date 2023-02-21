<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Footer -->
<footer class="bg6 p-t-75 p-b-32">
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-lg-3 p-b-50 m-l-100">
				<h4 class="stext-301 cl8 p-b-30">INFO</h4>
				<ul>
					<li class="p-b-10">
						<a href="about.jsp" class="stext-107 cl6 hov-cl1 trans-04">회사소개</a>
					</li>

					<li class="p-b-10">
						<a href="use-guidlines.jsp" class="stext-107 cl6 hov-cl1 trans-04">이용안내</a>
					</li>

					<li class="p-b-10">
						<a href="use-terms.jsp" class="stext-107 cl6 hov-cl1 trans-04">이용약관</a>
					</li>

					<li class="p-b-10">
						<a href="personal-information.jsp" class="stext-107 cl6 hov-cl1 trans-04">개인정보처리방침</a>
					</li>
				</ul>
			</div>

			<div class="col-sm-6 col-lg-3 p-b-50 m-l-100">
				<h4 class="stext-301 cl8 p-b-30">SERVICE INFO</h4>
				<ul>
					<c:if test="${mId == null}">
						<li class="p-b-10">
							<a href="login.jsp" class="stext-107 cl6 hov-cl1 trans-04">배송조회</a>
						</li>
						<li class="p-b-10">
							<a href="login.jsp" class="stext-107 cl6 hov-cl1 trans-04">취소내역</a>
						</li>
						<li class="p-b-10">
							<a href="login.jsp" class="stext-107 cl6 hov-cl1 trans-04">마이페이지</a>
						</li>
					</c:if>
					<c:if test="${mId == 'admin'}">
						<li class="p-b-10">
							<a href="order-list.jsp" class="stext-107 cl6 hov-cl1 trans-04">배송조회</a>
						</li>
						<li class="p-b-10">
							<a href="cancel-list.jsp" class="stext-107 cl6 hov-cl1 trans-04">취소내역</a>
						</li>
						<li class="p-b-10">
							<a href="adMain.do" class="stext-107 cl6 hov-cl1 trans-04">관리자페이지</a>
						</li>
					</c:if>
					<c:if test="${mId != null && mId != 'admin'}">
						<li class="p-b-10">
							<a href="order-list.jsp" class="stext-107 cl6 hov-cl1 trans-04">배송조회</a>
						</li>
						<li class="p-b-10">
							<a href="cancel-list.jsp" class="stext-107 cl6 hov-cl1 trans-04">취소내역</a>
						</li>
						<li class="p-b-10">
							<a href="change-inform.jsp" class="stext-107 cl6 hov-cl1 trans-04">마이페이지</a>
						</li>
					</c:if>
				</ul>
			</div>

			<div class="col-sm-6 col-lg-3 p-b-50 m-l-100">
				<h4 class="stext-301 cl8 p-b-30">GET IN TOUCH</h4>
				<ul>
					<li class="p-b-10 stext-107 cl6 trans-04">
						<i class="fa fa-phone" style="margin-right: 10px;"></i>
						1588-5890
					</li>
					<li class="p-b-10 stext-107 cl6 trans-04">
						<i class="fa fa-map-marker" style="margin-right: 10px;"></i>
						서울특별시 강남구 현익빌딩 3층, 4층
					</li>
				</ul>
			</div>
		</div>

		<div class="p-t-40">
			<div class="flex-c-m flex-w p-b-18">
				<img src="../images/icons/icon-pay-01.png" alt="ICON-PAY">
				<img src="../images/icons/icon-pay-02.png" alt="ICON-PAY">
				<img src="../images/icons/icon-pay-03.png" alt="ICON-PAY">
				<img src="../images/icons/icon-pay-04.png" alt="ICON-PAY">
				<img src="../images/icons/icon-pay-05.png" alt="ICON-PAY">
			</div>

			<p class="stext-107 cl6 txt-center">
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				Copyright &copy;
				<script>
					document.write(new Date().getFullYear());
				</script>
				All rights reserved | Made with
				<i class="fa fa-heart-o" aria-hidden="true"></i>
				by
				<a href="https://colorlib.com" target="_blank">Colorlib</a>
				&amp; distributed by
				<a href="https://themewagon.com" target="_blank">ThemeWagon</a>
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

			</p>
		</div>
	</div>
</footer>


<!-- Back to top -->
<div class="btn-back-to-top" id="myBtn">
	<span class="symbol-btn-back-to-top">
		<i class="zmdi zmdi-chevron-up"></i>
	</span>
</div>