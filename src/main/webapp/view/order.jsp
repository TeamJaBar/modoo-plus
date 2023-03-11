<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>주문서작성/결제</title>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script>
	$(document).ready(function () {
		$('.on').click(function () {
			$(this).toggleClass("on");
		});

		// 아이디 정규식
		const idCheck = /^[a-z][a-z0-9]+$/m

		$('#loginId').focusout(function () {
			let id = $('#loginId').val();
			// 영소문자로 시작되며 영소문자 혹은 숫자만 사용 가능

			// 자리수는 일부러 표현식에 안 적고 따로
			if (id.length < 4 || id.length > 20) {
				alert("아이디는 4~20자리 이내로 입력해주세요.");
				// input에 적은 거 없애기
				$('#loginId').val("");
				return false;
			}

			// 숫자로 시작하거나 영소문자와 숫자 외의 것 입력했을 시
			if (!idCheck.test(id)) {
				alert('아이디는 영어로 시작하며 영소문자 혹은 숫자만 사용할 수 있습니다.');
				$('#loginId').val("");
				return false;
			}
		});
	});
</script>

<%@include file="common/header.jsp"%>

<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/ModooShop/images/bg-img-01.png');">
	<h2 class="ltext-105 cl0 txt-center">주문서 작성/결제</h2>
</section>

<!-- Content page -->
<section class="bg0 p-t-75 p-b-120">
	<div class="container">
		<div class="sub_content">
			<div class="content_box">
				<form id="frmOrder" name="frmOrder" action="orderOk.do" method="post">
					<%-- <input type="hidden" name="prodList" value="${prodList}" /> --%>
					<div class="order_wrap">
						<div class="order_tit">
							<h2>주문서작성/결제</h2>
							<ol>
								<li>
									<span>01</span>
									장바구니
									<span>
										<img src="/ModooShop/images/icons/icon_join_step_off.png" alt="화살표_진행완료">
									</span>
								</li>
								<li class="page_on">
									<span>02</span>
									주문서작성/결제
									<span>
										<img src="/ModooShop/images/icons/icon_join_step_on.png" alt="화살표_진행중">
									</span>
								</li>
								<li>
									<span>03</span>
									주문완료
								</li>
							</ol>
						</div>
						<!-- //order_tit -->

						<div class="order_cont">
							<div class="cart_cont_list">
								<div class="order_cart_tit">
									<h3>주문상세내역</h3>
								</div>
								<!-- //order_cart_tit -->
								<div class="order_table_type">
									<!-- 장바구니 상품리스트 시작 -->
									<table>
										<colgroup>
											<col>
											<!-- 상품명/옵션 -->
											<col style="width: 5%">
											<!-- 수량 -->
											<col style="width: 10%">
											<!-- 상품금액 -->
											<col style="width: 13%">
											<!-- 할인/적립 -->
											<col style="width: 10%">
											<!-- 합계금액 -->
											<col style="width: 10%">
											<!-- 배송비 -->
										</colgroup>
										<thead>
											<tr>
												<th>상품/옵션 정보</th>
												<th class="js-relative-none-mobile">수량</th>
												<th>개별 상품금액</th>
												<th class="js-relative-none-mobile">적립</th>
												<th class="js-relative-none-mobile">합계금액</th>
												<th class="js-relative-none-mobile">배송비</th>
											</tr>
										</thead>
										<tbody>
											<c:set var="sumPrice" value="0" />
											<c:set var="totalPrice" value="0" />
											<c:set var="totalCnt" value="0" />
											<c:set var="totalPoint" value="0" />
											<c:set var="deliveryFee" value="2500" />
											<c:forEach var="product" items="${prodList}" varStatus="status">
												<c:if test="${status.index == 0}">
													<c:set var="productName" value="${product.pName}"/>
												</c:if>
												<c:set var="sumPrice" value="${sumPrice + product.selPrice * product.pCnt}" />
												<c:set var="totalPrice" value="${totalPrice + product.selPrice * product.pCnt}" />
												<c:set var="totalCnt" value="${totalCnt + product.pCnt}" />
												<c:set var="totalPoint" value="${totalPoint + (product.selPrice - (product.selPrice % 1000)) / 100}" />
												<tr>
													<td class="td_left">
														<input type="hidden" name="pNum" value="${product.pNum}" />
														<input type="hidden" name="pCnt" value="${product.pCnt}" />
														<div class="pick_add_cont">
															<span class="pick_add_img">
																<img src="${product.pImg}" width="40" alt="${product.pName}" title="${product.pName}" class="middle">
															</span>
															<div class="pick_add_info">
																<em>
																	<span>${product.pName}</span>
																</em>
															</div>
														</div>
														<!-- //pick_add_cont -->
													</td>
													<td class="js-relative-none-mobile td_order_amount">
														<div class="order_goods_num" name="cnt">
															<!-- 담긴 상품 수량 -->
															<strong>${product.pCnt}개</strong>
														</div>
													</td>
													<td>
														<div class="js-relative-block-mobile">
															<!-- 담긴 상품별 수량 -->
															<!-- <strong>1개</strong> -->
														</div>
														<strong class="order_sum_txt price">
															<fmt:formatNumber value="${product.selPrice}" type="number" />
															원
														</strong>
													</td>
													<td class="td_benefit js-relative-none-mobile">
														<ul class="benefit_list">
															<li class="benefit_mileage js_mileage">
																<em>적립</em>
																<br>
																<span>
																	상품
																	<strong>
																		+
																		<fmt:formatNumber value="${(product.selPrice - (product.selPrice % 1000)) / 100}" type="number" />
																		원
																	</strong>
																</span>
															</li>
														</ul>
													</td>
													<td class="js-relative-none-mobile">
														<strong class="order_sum_txt">
															<fmt:formatNumber value="${product.selPrice * product.pCnt}" type="number" />
															원
														</strong>
													</td>
													<c:if test="${status.first}">
														<td class="td_delivery js-relative-none-mobile" rowspan="${fn:length(prodList)}">
															<br>
															<span id="deliveryFee">
																<fmt:formatNumber value="${deliveryFee}" type="number" />
															</span>
															원 <br> (택배)
														</td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- 장바구니 상품리스트 끝 -->
								</div>
							</div>
							<!-- //cart_cont_list -->
							<div class="btn_left_box">
								<a href="cart.do" class="shop_go_link">
									<em>&lt; 장바구니 가기</em>
								</a>
							</div>
							<div class="price_sum">
								<div class="price_sum_cont">
									<div class="price_sum_list">
										<dl>
											<dt>
												총
												<strong>
													<fmt:formatNumber value="${totalCnt}" type="number" />
												</strong>
												개의 상품금액
											</dt>
											<dd>
												<strong>
													<fmt:formatNumber value="${totalPrice}" type="number" />
												</strong>
												원
											</dd>
										</dl>
										<span>
											<img src="/ModooShop/images/icons/order_price_plus.png" alt="더하기">
										</span>
										<dl>
											<dt>배송비</dt>
											<dd>
												<strong>
													<fmt:formatNumber value="${deliveryFee}" type="number" />
												</strong>
												원
											</dd>
										</dl>
										<span>
											<img src="/ModooShop/images/icons/order_price_total.png" alt="합계">
										</span>
										<dl class="price_total">
											<dt>합계</dt>
											<dd>
												<strong>
													<fmt:formatNumber value="${totalPrice + deliveryFee}" type="number" />
												</strong>
												원
											</dd>
										</dl>
									</div>
									<!-- 총 예정 적립금 -->
									<em class="tobe_mileage js_mileage">
										적립예정 적립금 :
										<span>
											<fmt:formatNumber value="${totalPoint}" type="number" />
										</span>
										원
									</em>
								</div>
								<!-- //price_sum_cont -->
							</div>
							<!-- //price_sum -->
							<div class="order_view_info">
								<div class="order_info">
									<div class="order_zone_tit">
										<h4>주문자 정보</h4>
									</div>
									<div class="order_table_type">
										<table class="table_left">
											<colgroup>
												<col style="width: 15%;">
												<col style="width: 85%;">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">
														<span class="important">주문하시는 분</span>
													</th>
													<td>
														<input type="text" id="mName" name="name" data-pattern="gdEngKor" maxlength="20" value="${member.mName}" required>
													</td>
												</tr>
												<tr>
													<th scope="row">주소</th>
													<td style="font-size: 12px;">[${member.zipCode}] ${member.userAddr} ${member.detailAddr}</td>
												</tr>
												<!-- <tr>
													<th scope="row">전화번호</th>
													<td><input type="text" id="phoneNum" name="orderPhone"
														value="" maxlength="20">
														<div data-lastpass-icon-root="true"
															style="position: relative !important; height: 0px !important; width: 0px !important; float: left !important;">
														</div></td>
												</tr> -->
												<tr>
													<th scope="row">
														<span class="important">휴대폰 번호</span>
													</th>
													<td>
														<input type="text" id="mobileNum" name="tel" maxlength="20" value="${member.mTel}" required>
													</td>
												</tr>
												<tr>
													<th scope="row">
														<span class="important">이메일</span>
													</th>
													<td class="member_email">
														<input type="text" name="oEmail" id="email" value="${member.mEmail}" disabled>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!-- //order_info -->
								<div class="delivery_info">
									<div class="order_zone_tit">
										<h4>배송정보</h4>
									</div>
									<div class="order_table_type shipping_info">
										<table class="table_left shipping_info_table">
											<colgroup>
												<col style="width: 15%;">
												<col style="width: 85%;">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">배송지 확인</th>
													<td>
														<div class="form_element">
															<ul>
																<li>
																	<input type="radio" name="shipping" id="shippingBasic" value="1">
																	<label for="shippingBasic" class="choice_s">기본 배송지</label>
																</li>
																<li>
																	<input type="radio" name="shipping" id="shippingNew" value="2">
																	<label for="shippingNew" class="choice_s on">직접 입력</label>
																</li>
																<li>
																	<input type="radio" name="shipping" id="shippingSameCheck" value="3" checked>
																	<label for="shippingSameCheck" class="choice_s">주문자정보와 동일</label>
																</li>
															</ul>
															<!-- <button class="btn_gray_list">
																<a href="add-address.jsp" class="btn_gray_small btn_open_layer js_shipping" style="border: 1px 0188CB; color: #0188CB">배송지 관리</a>
															</button> -->
														</div>
													</td>
												</tr>
												<tr>
													<th scope="row">
														<span class="important">받으실분</span>
													</th>
													<td>
														<input type="text" id="receiverName" name="oShipName" data-pattern="gdEngKor" maxlength="20" value="${member.mName}" required>
													</td>
												</tr>
												<tr>
													<th scope="row">
														<span class="important">받으실 곳</span>
													</th>
													<td class="member_address">
														<div class="address_postcode find_address">
															<input type="text" name="oZipCode" id="sample3_postcode" placeholder="우편번호" value="${member.zipCode}" required>
															<input type="button" id="find_address" onclick="sample3_execDaumPostcode()" value="우편번호 찾기" required>
														</div>
														<!-- //base_info_box -->
														<div id="wrapPost" style="display: none; border: 1px solid; max-width: 500px; height: 300px; margin: 5px 0; position: relative">
															<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
																onclick="foldDaumPostcode()" alt="접기 버튼">
														</div>
														<div class="address_input detailed_address">
															<div class="member_warning">
																<input type="text" name="oUserAddr" id="sample3_address" placeholder="주소" value="${member.userAddr}" required>
															</div>
															<div class="member_warning js_address_sub">
																<input type="text" name="oDetailAddr" id="sample3_detailAddress" placeholder="상세주소" value="${member.detailAddr}" required style="display: block">
																<!-- <input type="text" id="sample3_extraAddress"
																	placeholder="참고항목" style="display: block"> -->
															</div>
														</div>
														<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
														<script>
															// 우편번호 찾기 찾기 화면을 넣을 element
															var element_wrap = document
																.getElementById('wrapPost');
						
															function foldDaumPostcode() {
																// iframe을 넣은 element를 안보이게 한다.
																element_wrap.style.display = 'none';
															}
						
															function sample3_execDaumPostcode() {
																// 현재 scroll 위치를 저장해놓는다.
																var currentScroll = Math
																	.max(
																		document.body.scrollTop,
																		document.documentElement.scrollTop);
																new daum.Postcode(
																	{
																		oncomplete: function (data) {
																			// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
																			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
																			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
																			var addr = ''; // 주소 변수
						
																			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
																			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
																				addr = data.roadAddress;
																			} else { // 사용자가 지번 주소를 선택했을 경우(J)
																				addr = data.jibunAddress;
																			}
						
																			// 우편번호와 주소 정보를 해당 필드에 넣는다.
																			document
																				.getElementById('sample3_postcode').value = data.zonecode;
																			document
																				.getElementById("sample3_address").value = addr;
																			// 커서를 상세주소 필드로 이동한다.
																			document
																				.getElementById(
																					"sample3_detailAddress")
																				.focus();
						
																			// iframe을 넣은 element를 안보이게 한다.
																			// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
																			element_wrap.style.display = 'none';
						
																			// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
																			document.documentElement.scrollTop = currentScroll;
																		},
																		// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
																		onresize: function (size) {
																			element_wrap.style.height = size.height
																				+ 'px';
																		},
																		width: '100%',
																		height: '100%'
																	}).embed(element_wrap);
						
																// iframe을 넣은 element를 보이게 한다.
																element_wrap.style.display = 'block';
															}
														</script>
													</td>
												</tr>
												<tr>
													<th scope="row">
														<span class="important">휴대폰 번호</span>
													</th>
													<td>
														<input type="text" id="receiverCellPhone" name="oTel" value="${member.mTel}">
													</td>
												</tr>
												<tr>
													<th scope="row">남기실 말씀</th>
													<td class="td_last_say">
														<input type="text" name="orderMemo">
													</td>
												</tr>
												<!--  
												<tr id="memberinfoApplyTr">
													<th scope="row">회원정보 반영</th>
													<td>
														<div class="form_element">
															<div id="memberinfoApplyTr1" class="member_info_delivery">
																<input type="checkbox" id="reflectApplyDelivery"
																	name="reflectApplyDelivery" value="y"> <label
																	for="reflectApplyDelivery" class="check_s">나의
																	배송지에 추가합니다.</label>
															</div>
															<div id="memberinfoApplyTr2" class="member_info_apply">
																<input type="checkbox" id="reflectApplyMember"
																	name="reflectApplyMember" value="y"> <label
																	for="reflectApplyMember" class="check_s">위 내용을
																	회원정보에 반영합니다. <span>(주소/전화번호/휴대폰번호)</span>
																</label>
															</div>
														</div>
													</td>
												</tr>
												 -->
											</tbody>
										</table>
									</div>
								</div>
								<!-- //delivery_info -->
								<div class="payment_info">
									<div class="order_zone_tit">
										<h4>결제정보</h4>
									</div>
									<div class="order_table_type">
										<table class="table_left">
											<colgroup>
												<col style="width: 15%;">
												<col style="width: 85%;">
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">상품 합계 금액</th>
													<td>
														<strong id="totalGoodsPrice" class="order_payment_sum">
															<fmt:formatNumber value="${totalPrice}" type="number" /> 원
														</strong>
													</td>
												</tr>
												<tr>
													<th scope="row">배송비</th>
													<td>
														<span id="totalDeliveryCharge">
															<fmt:formatNumber value="${deliveryFee}" type="number" />
														</span>원
														<!-- <span class="multi_shipping_text"></span> -->
													</td>
												</tr>
												<tr>
													<th scope="row">적립</th>
													<td>
														<ul class="order_benefit_list">
															<li class="order_benefit_mileage js_mileage">
																<em id="mileageDefault">
																	적립 적립금 :
																	<strong>
																		(+) <b class="total-member-mileage"><fmt:formatNumber value="${totalPoint}" type="number" /></b>원
																		<fmt:parseNumber var= "totalPointInt" integerOnly= "true" value="${totalPoint}" />
																		<input type="hidden" name="mPoint" value="${totalPointInt}"/>
																	</strong>
																</em>
															</li>
														</ul>
													</td>
												</tr>
												<tr>
													<th scope="row">적립금 사용</th>
													<td>
														<div class="order_money_use">
															<input type="text" name="oPoint" id="useMileageSelect" value="0">
															원
															<input type="button" id="useMileagePoint" onclick="gd_mileage_use_point()" value="적립금 적용하기">
															<div class="form_element">
																<input type="checkbox" id="useMileageAll" onclick="gd_mileage_use_all()">
																<label for="useMileageAll" class="check_s">전액 사용하기</label>
																<span class="money_use_sum">
																	(보유 적립금 : <fmt:formatNumber value="${member.mPoint}" type="number" /> 원)
																</span>
															</div>
															<em class="money_use_txt js-mileageInfoArea">
																※
																<fmt:formatNumber value="${member.mPoint}" type="number" />
																원까지 사용 가능합니다.
															</em>
														</div>
													</td>
												</tr>
												<tr id="purchase">
													<th scope="row">최종 결제 금액</th>
													<td>
														<input type="hidden" name="settlePrice" value="${totalPrice + deliveryFee}" required>
														<strong id="totalSettlePrice" class="order_payment_sum">
															<fmt:formatNumber value="${totalPrice + deliveryFee}" type="number" />
														</strong>원
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!-- //payment_info -->
								<div class="payment_progress">
									<div class="order_zone_tit">
										<h4>결제수단 선택 / 결제</h4>
									</div>
									<div class="payment_progress_list">
										<div class="js_pay_content">
											<!-- N : 일반결제 시작 -->
											<div id="settlekind_general" class="general_payment">
												<dl>
													<dt>일반결제</dt>
													<dd>
														<div class="form_element">
															<ul class="payment_progress_select">
																<li id="settlekindType_pk">
																	<input type="radio" id="settleKind_pk" name="settleKind" value="카카오" checked>
																	<label for="settleKind_pk" class="choice_s">카카오페이</label>
																</li>
																<li id="settlekindType_pc">
																	<input type="radio" id="settleKind_pc" name="settleKind" value="카드">
																	<label for="settleKind_pc" class="choice_s">신용카드</label>
																</li>
																<!-- <li id="settlekindType_pb">
																		<input type="radio" id="settleKind_pb"
																			name="settleKind" value="pb">
																		<label for="settleKind_pb"
																			class="choice_s">계좌이체</label>
																	</li>
																	<li id="settlekindType_pv">
																		<input type="radio" id="settleKind_pv"
																			name="settleKind" value="pv">
																		<label for="settleKind_pv"
																			class="choice_s">가상계좌</label>
																	</li>
																	<li id="settlekindType_gb">
																		<input type="radio" id="settleKind_gb"
																			name="settleKind" value="gb">
																		<label for="settleKind_gb" class="choice_s">무통장
																			입금</label>
																	</li>
																	<li id="settlekindType_ph">
																		<input type="radio" id="settleKind_ph"
																			name="settleKind" value="ph">
																		<label for="settleKind_ph"
																			class="choice_s">휴대폰결제</label>
																	</li> -->
															</ul>
														</div>
													</dd>
												</dl>
											</div>
											<!-- //general_payment -->
											<!-- N : 일반결제 끝 -->
										</div>
									</div>
									<!-- //payment_progress_list -->
									<div class="payment_final">
										<div class="payment_final_total">
											<dl>
												<dt>최종 결제 금액</dt>
												<dd>
													<span>
														<strong id="totalSettlePriceView">
															<fmt:formatNumber value="${totalPrice + deliveryFee}" type="number" />
														</strong>
														원
													</span>
												</dd>
											</dl>
										</div>
										<div class="payment_final_check">
											<div class="form_element">
												<input type="checkbox" id="termAgree_orderCheck" class="require" required>
												<label for="termAgree_orderCheck" class="check_s">
													<b>(필수)</b> 구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.
												</label>
											</div>
										</div>
										<div class="btn_center_box">
											<!-- <button class="btn_order_buy order-buy">결제하기</button> -->
											<!-- <input type="submit" class="btn_order_buy order-buy" value="결제하기"> -->
											<button type="button" class="btn_order_buy order-buy" onclick="payment()">결제하기</button>
										</div>
									</div>
									<!-- //payment_final -->
								</div>
								<!-- //payment_progress -->
							</div>
							<!-- //order_view_info -->
						</div>
						<!-- //order_cont -->
					</div>
					<!-- //order_wrap -->
				</form>
			</div>
		</div>
	</div>
</section>

<%@include file="common/footer.jsp"%>

<link rel="stylesheet" type="text/css" href="../css/order.css">

<!--===============================================================================================-->
<script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="../vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="../vendor/bootstrap/js/popper.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="../vendor/select2/select2.min.js"></script>
<script>
	$(".js-select2").each(function () {
		$(this).select2({
			minimumResultsForSearch: 20,
			dropdownParent: $(this).next('.dropDownSelect2')
		});
	})
</script>
<!--===============================================================================================-->
<script src="../vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
<script src="../vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
	$('.js-pscroll').each(function () {
		$(this).css('position', 'relative');
		$(this).css('overflow', 'hidden');
		var ps = new PerfectScrollbar(this, {
			wheelSpeed: 1,
			scrollingThreshold: 1000,
			wheelPropagation: false,
		});

		$(window).on('resize', function () {
			ps.update();
		})
	});
</script>
<!--===============================================================================================-->
<script src="../js/main.js"></script>
<script>
$("input[name='shipping']").change(function () {
	let chk = $("input[name='shipping']:checked").val();
	// 라디오 버튼 누를때마다 text 초기화
	$("#receiverName").val("");
	$("#sample3_postcode").val("");
	$("#sample3_address").val("");
	$("#sample3_detailAddress").val("");
	$("#receiverCellPhone").val("");
	// 라디오 버튼 체크
	if (chk == 1) { // 기본 배송지
		$("#receiverName").val('${defAddr.shipName}');
		$("#sample3_postcode").val('${defAddr.zipCode}');
		$("#sample3_address").val('${defAddr.userAddr}');
		$("#sample3_detailAddress").val('${defAddr.detailAddr}');
		$("#receiverCellPhone").val('${defAddr.tel}');
	} else if (chk == 3) { // 주문자정보와 동일
		$("#receiverName").val('${member.mName}');
		$("#sample3_postcode").val('${member.zipCode}');
		$("#sample3_address").val('${member.userAddr}');
		$("#sample3_detailAddress").val('${member.detailAddr}');
		$("#receiverCellPhone").val('${member.mTel}');
	}
});

function gd_mileage_use_point() {
	
	var useMileagePoint = $('#useMileageSelect').val();
	var useMileage = parseInt(useMileagePoint); // 사용 적용한 적립금
	console.log("입력한 사용 적립금 :" + useMileage);
	
	if(useMileage > '${member.mPoint}' || useMileage < 0) {
		alert('사용가능한 적립금을 확인해주세요.');
		$('#useMileageSelect').val(0);
		return;
	}
	
	var totalPricePoint = '${totalPrice}';
	var totalPrice = parseInt(totalPricePoint); // 합계금액
	console.log("합계금액 :" +totalPrice);

	var sumTotalPrice = totalPrice - useMileage + 2500; // 합계금액 - 적립금 = 최종 금액
	console.log("최종금액 :" +sumTotalPrice);
	$('#totalSettlePrice').text(sumTotalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')); //최종금액 HTML 태그에 넣기
	$('#totalSettlePriceView').text(sumTotalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
}

function gd_mileage_use_all() {
	
	var totalPricePoint = '${totalPrice}';
	var totalPrice = parseInt(totalPricePoint); // 합계금액
	var sumTotalPrice = totalPrice+2500; // 합계금액 - 적립금 = 최종 금액
	
	if(!($('#useMileageAll').is(':checked'))) {
		$('#useMileageSelect').val(0);
		$('#totalSettlePrice').text(sumTotalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')); //최종금액 HTML 태그에 넣기
		$('#totalSettlePriceView').text(sumTotalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		return;
	}
	
	var useMileagePoint = '${member.mPoint}';
	var useMileage = parseInt(useMileagePoint); // 사용 적용한 적립금
	
	if(useMileage > '${member.mPoint}' || useMileage < 0) {
		alert('사용가능한 적립금을 확인해주세요.');
		$('#useMileageSelect').val(0);
		return;
	}

	sumTotalPrice = sumTotalPrice - useMileage;
	$('#useMileageSelect').val(useMileage);
	$('#totalSettlePrice').text(sumTotalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')); //최종금액 HTML 태그에 넣기
	$('#totalSettlePriceView').text(sumTotalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
}
</script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
	function createOrderNum(){
		//주문번호 생성
		const date = new Date();
		const year = String(date.getFullYear()).substring(2,4);
		const month = String(date.getMonth() + 1).padStart(2, "0");
		const day = String(date.getDate()).padStart(2, "0");
		
		let orderNum = year + month + day;
		for(let i=0;i<3;i++) {
			orderNum += Math.floor(Math.random() * 8);	
		}
		return orderNum;
	}
	
	//버튼 클릭하면 실행
	function payment() {
		
		var pay = $('input:radio[name=settleKind]:checked').val();
		
		if (pay == '카카오') {
			pay = 'kakaopay.TC0ONETIME';
		} else if (pay == '카드') {
			pay = 'nice.nictest00m';
		}
		
		console.log(pay);
		
		if(!($('#termAgree_orderCheck').is(':checked'))) {
			alert("구매동의 체크를 해주세요");
			return;
		}
		
		var productName = '${productName}'
		
		if(${fn:length(prodList)} > 1) {
			productName += ' 외 ' + (${fn:length(prodList)}-1) + ' 건';
		}
	
		IMP.init('imp56551018');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
		IMP.request_pay({// param
			pg: pay, //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
			pay_method: "card", //지불 방법
			merchant_uid: createOrderNum(), //가맹점 주문번호
			name: productName, //결제창에 노출될 상품명
			amount: $('#totalSettlePrice').text(), //금액
			buyer_email: $('#mEmail').val(),
			buyer_name: $('#mName').val(),
			buyer_tel: $('#mobileNum').val()
		}, function (rsp) { // callback
			if (rsp.success) {
				alert("결제 성공");
				console.log(rsp.merchant_uid);
				var form = $("#frmOrder");
				form.append($('<input/>', {type: 'hidden', name: 'oNum', value:rsp.merchant_uid}));
				form.submit();
			} else {
				alert("실패 : 코드(" + rsp.error_code + ") / 메세지("+ rsp.error_msg + ")");
			}
		});
	}
</script>
</body>
</html>