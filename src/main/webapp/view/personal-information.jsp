<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>개인정보처리방침</title>
<style>
body, th, td, input, select, textarea, button {
	font-size: 12px;
	line-height: 1.5;
	font-family: 'SUIT', sans-serif;
	color: #333
}
/* 폰트 컬러 */
.fc_red {
	color: #fa2828 !important;
}

input[type="radio"] {
	width: 13px;
	height: 13px;
	vertical-align: top;
}

input[type="text"], input[type="password"] {
	padding: 0 10px;
	outline: none;
	font-size: 12px;
}

input[type="checkbox"] {
	width: 13px;
	height: 13px;
	vertical-align: top;
}

input[type="image"] {
	vertical-align: top;
	border: none;
	cursor: pointer;
}

input[type="button"] {
	border: none;
	background: none;
	cursor: pointer;
}

input[type="submit"] {
	cursor: pointer;
	vertical-align: top;
	font-size: 100%;
}

/*common.csss */
input[type="text"], input[type="password"] {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 0px;
}

.find_password_box .login_input .member_warning {
	margin: 0px;
}

.find_password_reset_box .login_input {
	padding: 0px;
	width: 100%
}

.member_cont .btn_center_box, .member_warning+.btn_center_box {
	margin: 0px;
	margin-top: 10px;
}

.member_cont .find_password_complete_box {
	text-align: center;
}

.member_cont .find_password_complete_box .btn_center_box {
	margin-top: 35px;
}

/* left type */
.mypage_table_type .table_left {
	border-top: 1px solid #999999;
}

.mypage_table_type .table_left th {
	padding: 15px 10px 14px 20px;
	border-top: none 0;
	background: #f7f7f7;
	text-align: left;
}

.mypage_table_type .table_left td {
	height: 31px;
	padding: 12px 10px 11px 15px;
	text-align: left;
}

.mypage_table_type .table_left textarea {
	width: 95%;
}

.board_search_box input[type="text"], input[type="password"] {
	width: 110px;
}

/* 쇼핑정보 > 취소,확인 */
.btn_claim_cancel {
	display: inline-block;
	min-width: 80px;
	height: 42px;
	padding: 0 10px 0 10px;
	line-height: 40px;
	color: #3e3d3c;
	font-size: 14px;
	border: 1px solid #cccccc;
	background: #ffffff;
	text-align: center;
}

.btn_claim_cancel:hover {
	color: #333333;
	border: 1px solid #bbbbbb;
}

.btn_claim_cancel em {
	font-weight: bold;
}

.btn_claim_ok {
	min-width: 100px;
	height: 44px;
	padding: 0 10px 0 10px;
	color: #ffffff;
	font-size: 14px;
	font-weight: bold;
	border: 1px solid #181818;
	background: #181818;
	text-align: center;
	vertical-align: top;
}

.btn_claim_ok:hover {
	border: 1px solid #181818;
	background: #181818;
}

.btn_claim_ok em {
	font-weight: bold;
}

/* ------------- 마이페이지 > 회원탈퇴 ------------- */
.hack_out {
	margin: 0 0 50px 0;
}

.hack_out .mypage_zone_tit {
	margin: 0 0 50px 0;
	padding: 0 0 10px 0;
	font-size: 14px;
	border-bottom: 1px solid #999999;
}

.hack_out .mypage_unregister .mypage_zone_tit {
	margin: 0;
	padding: 0 0 10px 0;
	font-size: 14px;
	border-bottom: none 0;
}

.hack_out .mypage_unregister .unregister_info {
	margin: 0 0 40px 0;
	padding: 15px 15px 15px 15px;
	color: #717171;
	border: 1px solid #dadada;
}

.hack_out .mypage_unregister .hack_out_list li {
	float: left;
	width: 35%;
	padding: 0 0 7px 0;
}

.hack_out .mypage_unregister textarea {
	width: 98%;
	height: 100px;
}

/* CSS Document */

/* reset */
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code,
	form, fieldset, legend, textarea, p, blockquote, th, td, input, select,
	textarea, button {
	margin: 0;
	padding: 0
}

fieldset, img {
	border: 0 none;
	vertical-align: top;
}

dl, ul, ol, li {
	list-style: none
}

blockquote, q {
	quotes: none
}

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none
}

input, select, textarea, button {
	vertical-align: middle
}

button {
	border: 0 none;
	background-color: transparent;
	cursor: pointer
}

body {
	background: #fff
}

body, th, td, input, select, textarea, button {
	font-size: 12px;
	line-height: 1.5;
	font-family: 'SUIT', sans-serif;
	color: #333
} /* color값은 디자인가이드에 맞게사용 */
a {
	color: #333;
	text-decoration: none
}

a:active, a:hover {
	text-decoration: none;
}

address, caption, cite, code, dfn, em, var {
	font-style: normal;
	font-weight: normal
}

@font-face {
	font-family: 'SUIT';
	font-weight: 500;
	font-style: normal;
	src:
		url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.eot');
	src:
		url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.eot?#iefix')
		format('embedded-opentype'),
		url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.woff2')
		format('woff2'),
		url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.woff')
		format('woff'),
		url('https://cdn.jsdelivr.net/gh/webfontworld/sunn/SUIT-Medium.ttf')
		format("truetype");
	font-display: swap;
}

@font-face {
	font-family: 'NEXON Lv1 Gothic OTF';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'NEXON Lv2 Gothic';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansLight';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GmarketSansBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#mm {
	display: flex;
	width: 100%;
	flex-wrap: wrap;
	justify-content: center;
}

.LLi {
	width: 450px;
}

#mm ul {
	width: 450px;
}

@media only screen and (min-width: 600px) and (max-width: 1000px) {
	#mm li img {
		width: 100%;
	}
	.LLi {
		width: 50%;
	}
	#mm ul {
		width: 50%;
	}
}

@media only screen and (max-width: 599px) {
	#mm li img {
		width: 100%;
	}
	.LLi {
		width: 100%;
	}
	#mm ul {
		width: 100%;
	}
}

/* ------------- 테이블 공통(텍스트 센터 기본) ------------- */


.mypage_table_type .td_left {
	text-align: left;
}

.mypage_table_type table {
	width: 100%;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
	text-align: center;
}

.mypage_table_type th {
	padding: 9px 10px 10px 10px;
	border-top: 1px solid #999999;
	border-bottom: 1px solid #dbdbdb;
	background: #f7f7f7;
}

.mypage_table_type td {
	height: 31px;
	padding: 15px 10px 14px 10px;
	color: #777777;
	border-bottom: 1px solid #dbdbdb; /*border-left:1px dotted #ededed;*/
}

.mypage_table_type td>strong {
	color: #181818;
}


.mypage_table_type th .form_element {
	vertical-align: middle;
}

.mypage_table_type .text_info {
	display: block;
	padding: 2px 0 2px 0;
	color: #999999;
	font-size: 11px;
}

.mypage_table_type .coupon_price {
	color: #333333;
	font-size: 14px;
}

.mypage_table_type .coupon_price b {
	padding: 0 2px 0 0;
	font-size: 16px;
}

.mypage_table_type .row_line td {
	border-bottom: 1px solid #ebebeb;
}

.mypage_table_type table td.order_day_num {
	border-right: 1px dotted #ededed;
	border-bottom: 1px solid #dbdbdb;
} /* 날짜/주문번호 */
.mypage_table_type .btn_claim>span {
	display: inline-block;
	margin: 7px 0 0 0;
}
</style>
<%@include file="common/header.jsp"%>
	
	<!-- Title page -->
	<section class="bg0 p-t-75 p-b-120">
		<div class="container">
			<div class="sub-content">
				<div class="content-box">
					<div class="join-agreement-wrap">

						<form id="formHackOut" name="formHackOut"
							action="../mypage/my_page_ps.php" method="post"
							novalidate="novalidate">
							<input type="hidden" name="mode" value="hackOut"> <input
								type="hidden" name="snsType" value="">
							<div class="hack_out">

								<div class="mypage_zone_tit ltext-104">
									<h2>개인정보처리방침</h2>
								</div>

								<div class="mypage_unregister">
									<div class="unregister_info" style="font-size: 8px;">
										개인정보취급방침<br><br>

										보드게임몰은(는) 이용자들의 개인정보보호를 매우 중요시하며, 이용자가 회사의 서비스를<br>
										이용함과 동시에 온라인상에서 회사에 제공한 개인정보가 보호 받을 수 있도록 최선을 다하고<br>
										있습니다. 이에 보드게임몰(주)는 통신비밀보호법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에<br>
										관한 법률 등 정보통신서비스제공자가 준수하여야 할 관련 법규상의 개인정보보호 규정 및<br>
										정보통신부가 제정한 개인정보보호지침을 준수하고 있습니다. 보드게임몰(주)는 개인정보 취급방침을 통하여<br>
										이용자들이 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해<br>
										어떠한 조치가 취해지고 있는지 알려 드립니다<br>
										<br><br>
										보드게임몰(주)는 개인정보 취급방침을 홈페이지 첫 화면에 공개함으로써 이용자들이 언제나 용이하게 보실<br>
										수 있도록 조치하고 있습니다.<br>
										<br><br>
										회사의 개인정보 취급방침은 정부의 법률 및 지침 변경이나 회사의 내부 방침 변경 등으로 인하여<br>
										수시로 변경될 수 있고, 이에 따른 개인정보 취급방침의 지속적인 개선을 위하여 필요한 절차를<br>
										정하고 있습니다. 그리고 개인정보 취급방침을 개정하는 경우나 개인정보 취급방침 변경될 경우<br>
										쇼핑몰의 첫페이지의 개인정보취급방침을 통해 고지하고 있습니다. 이용자들께서는 사이트 방문 시<br>
										수시로 확인하시기 바랍니다.<br>
										<br><br>
										보드게임몰(주)의 개인정보 취급방침은 다음과 같은 내용을 담고 있습니다.
										<br><br>
										1. 개인정보 수집에 대한 동의<br>
										2. 개인정보의 수집목적 및 이용목적<br>
										3. 수집하는 개인정보 항목 및 수집방법<br>
										4. 수집하는 개인정보의 보유 및 이용기간<br>
										5. 수집한 개인정보의 공유 및 제공<br>
										6. 이용자 자신의 개인정보 관리(열람,정정,삭제 등)에 관한 사항<br>
										7. 쿠키(cookie)의 운영에 관한 사항<br>
										8. 비회원 고객의 개인정보 관리<br>
										9. 개인정보의 위탁처리<br>
										10. 개인정보관련 의견수렴 및 불만처리에 관한 사항<br>
										11. 개인정보 관리책임자 및 담당자의 소속-성명 및 연락처<br>
										12. 고지의 의무<br>
										<br><br><br>
										
										1. 개인정보 수집에 대한 동의<br><br>
										
										보드게임몰(주)는 이용자들이 회사의 개인정보 취급방침 또는 이용약관의 내용에 대하여 「동의」버튼 또는<br>
										「취소」버튼을 클릭할 수 있는 절차를 마련하여, 「동의」버튼을 클릭하면 개인정보 수집에 대해<br>
										동의한 것으로 봅니다.<br><br><br>
										
										
										2. 개인정보의 수집목적 및 이용목적<br><br>
										
										"개인정보"라 함은 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명등의 사항에 의하여<br>
										당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와<br>
										용이하게 결합하여 식별할 수 있는 것을 포함)를 말합니다.<br>
										<br><br>
										대부분의 서비스는 별도의 사용자 등록이 없이 언제든지 사용할 수 있습니다.<br>
										그러나 보드게임몰(주)는 회원서비스를 통하여 이용자들에게 맞춤식 서비스를 비롯한 보다 더 향상된 양질의<br>
										서비스를 제공하기 위하여 이용자 개인의 정보를 수집하고 있습니다.<br><br>
										
										보드게임몰(주)는 이용자의 사전 동의 없이는 이용자의 개인 정보를 공개하지 않으며, 수집된 정보는 아래와<br>
										같이 이용하고 있습니다.<br><br>
										
										첫째, 이용자들이 제공한 개인정보를 바탕으로 보다 더 유용한 서비스를 개발할 수 있습니다.<br>
										보드게임몰(주)는 신규 서비스개발이나 컨텐츠의 확충 시에 기존 이용자들이 회사에 제공한 개인정보를<br>
										바탕으로 개발해야 할 서비스의 우선 순위를 보다 더 효율적으로 정하고, 보드게임몰(주)는 이용자들이 필요로<br>
										할 컨텐츠를 합리적으로 선택하여 제공할 수 있습니다.<br><br>
										
										둘째, 수집하는 개인정보 항목과 수집 및 이용목적은 다음과 같습니다.<br>
										-성명 , 아이디, 비밀번호 : 회원제 서비스 이용에 따른 본인 확인 절차에 이용<br>
										-이메일주소, 전화번호 : 고지사항 전달, 불만처리 등을 위한 원활한 의사소통 경로의 확보,<br>
										새로운 서비스 및 신상품이나 이벤트 정보 등의 안내<br>
										-은행계좌정보, 신용카드정보 : 서비스 및 부가 서비스 이용에 대한 요금 결제<br>
										-주소, 전화번호 : 청구서, 물품배송시 정확한 배송지의 확보<br>
										-기타 선택항목 : 개인맞춤 서비스를 제공하기 위한 자료<br>
										-IP Address, : 불량회원의 부정 이용 방지와 비인가 사용 방지<br><br>
										
										3. 수집하는 개인정보 항목 및 수집방법<br><br>
										
										보드게임몰(주)는 이용자들이 회원서비스를 이용하기 위해 회원으로 가입하실 때 서비스 제공을 위한 필수적인<br>
										정보들을 온라인상에서 입력 받고 있습니다. 회원 가입 시에 받는 필수적인 정보는 이름, 이메일 주소<br>
										등입니다. 또한 양질의 서비스 제공을 위하여 이용자들이 선택적으로 입력할 수 있는 사항으로서<br>
										전화번호 등을 입력 받고 있습니다.<br><br>
										
										또한 쇼핑몰 내에서의 설문조사나 이벤트 행사 시 통계분석이나 경품제공 등을 위해 선별적으로<br>
										개인정보 입력을 요청할 수 있습니다. 그러나, 이용자의 기본적 인권 침해의 우려가 있는 민감한<br>
										개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및<br>
										성생활 등)는 수집하지 않으며 부득이하게 수집해야 할 경우 이용자들의 사전동의를 반드시 구할<br>
										것입니다.<br>
										그리고, 어떤 경우에라도 입력하신 정보를 이용자들에게 사전에 밝힌 목적 이외에 다른 목적으로는<br>
										사용하지 않으며 외부로 유출하지 않습니다.<br><br>
										
										4. 수집하는 개인정보의 보유 및 이용기간<br><br>
										
										이용자가 쇼핑몰 회원으로서 회사에 제공하는 서비스를 이용하는 동안 보드게임몰(주)는 이용자들의 개인정보를<br>
										계속적으로 보유하며 서비스 제공 등을 위해 이용합니다. 다만, 아래의 "6. 이용자 자신의 개인정보<br>
										관리(열람,정정,삭제 등)에 관한 사항" 에서 설명한 절차와 방법에 따라 회원 본인이 직접<br>
										삭제하거나 수정한 정보, 가입해지를 요청한 경우에는 재생할 수 없는 방법에 의하여 디스크에서<br>
										완전히 삭제하며 추후 열람이나 이용이 불가능한 상태로 처리됩니다.<br><br>
										
										그리고 "3. 수집하는 개인정보 항목 및 수집방법"에서와 같이 일시적인 목적 (설문조사, 이벤트,<br>
										본인확인 등)으로 입력 받은 개인정보는 그 목적이 달성된 이후에는 동일한 방법으로 사후 재생이<br>
										불가능한 상태로 처리됩니다.<br>
										
										귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기하는 것을<br>
										원칙으로 합니다. 그리고 상법, 전자상거래등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여<br>
										보존할 필요가 있는 경우 보드게임몰(주)는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.<br>
										이 경우 보드게임몰(주)는 보드게임몰(주)는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.<br><br>
										
										- 계약 또는 청약철회 등에 관한 기록 : 5년<br>
										- 대금결제 및 재화 등의 공급에 관한 기록 : 5년<br>
										- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br><br>
										
										보드게임몰(주)는 귀중한 회원의 개인정보를 안전하게 처리하며, 유출의 방지를 위하여 다음과 같은 방법을<br>
										통하여 개인정보를 파기합니다.<br><br>
										
										- 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.<br>
										- 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다<br><br><br>
										
										
										5. 수집한 개인정보의 공유 및 제공<br><br>
										
										보드게임몰(주)는 이용자들의 개인정보를 "2. 개인정보의 수집목적 및 이용목적"에서 고지한 범위 내에서<br>
										사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의<br>
										개인정보를 외부에 공개하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.<br><br>
										
										- 이용자들이 사전에 공개에 동의한 경우<br>
										- 서비스 제공에 따른 요금정산을 위하여 필요한 경우<br>
										- 홈페이지에 게시한 서비스 이용 약관 및 기타 회원 서비스 등의 이용약관 또는 운영원칙을<br>
										위반한 경우<br>
										- 자사 서비스를 이용하여 타인에게 정신적, 물질적 피해를 줌으로써 그에 대한 법적인 조치를<br>
										취하기 위하여 개인정보를 공개해야 한다고 판단되는 충분한 근거가 있는 경우<br>
										- 기타 법에 의해 요구된다고 선의로 판단되는 경우 (ex. 관련법에 의거 적법한 절차에 의한<br>
										정부/수사기관의 요청이 있는 경우 등)<br>
										- 통계작성, 학술연구나 시장조사를 위하여 특정개인을 식별할 수 없는 형태로 광고주, 협력업체나<br>
										연구단체 등에 제공하는 경우<br>
										- 이용자의 서비스 이용에 따른 불만사항 및 문의사항(민원사항)의 처리를 위하여 파.항의<br>
										고객센터를 운영하는 전문업체에 해당 민원사항의 처리에 필요한 개인 정보를 제공하는 경우<br><br>
										
										6. 이용자 자신의 개인정보 관리(열람,정정,삭제 등)에 관한 사항<br>
										
										회원님이 원하실 경우 언제라도 당사에서 개인정보를 열람하실 수 있으며 보관된 필수 정보를<br>
										수정하실 수 있습니다. 또한 회원 가입 시 요구된 필수 정보 외의 추가 정보는 언제나 열람,<br>
										수정, 삭제할 수 있습니다. 회원님의 개인정보 변경 및 삭제와 회원탈퇴는 당사의 고객센터에서<br>
										로그인(Login) 후 이용하실 수 있습니다.
										<br><br>
										7. 쿠키(cookie)의 운영에 관한 사항<br><br>
										
										당사는 회원인증을 위하여 Cookie 방식을 이용하고 있습니다. 이는 로그아웃(Logout)시 자동으로<br>
										컴퓨터에 저장되지 않고 삭제되도록 되어 있으므로 공공장소나 타인이 사용할 수 있는 컴퓨터를<br>
										사용 하 실 경우에는 로그인(Login)후 서비스 이용이 끝나시면 반드시 로그아웃(Logout)해 주시기<br>
										바랍니다.<br><br>
										
										※ 쿠키 설정 거부 방법<br>
										예: 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써<br>
										모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수<br>
										있습니다.<br><br>
										
										설정방법 예(인터넷 익스플로어의 경우)<br>
										: 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보
										<br><br>
										단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.<br><br>
										
										8. 비회원고객의 개인정보관리<br>
										- 당사는 비회원 고객 또한 물품 및 서비스 상품의 구매를 하실 수 있습니다. 당사는 비회원<br>
										주문의 경우 배송 및 대금 결제, 상품 배송에 반드시 필요한 개인정보만을 고객님께 요청하고<br>
										있습니다.<br><br>
										
										- 당사에서 비회원으로 구입을 하신 경우 비회원 고객께서 입력하신 지불인 정보 및 수령인<br>
										정보는 대금 결제 및 상품 배송에 관련한 용도 외에는 다른 어떠한 용도로도 사용되지 않습니다.<br><br>
										
										9. 개인정보의 위탁처리<br>
										은(는) 서비스 향상을 위해서 귀하의 개인정보를 필요한 경우 동의 등<br>
										법률상의 요건을 구비하여 외부에 수집 · 취급 · 관리 등을 위탁하여 처리할 있으며, 제 3자에<br>
										게 제공할 수 있습니다.<br>
										- 당사는 개인정보의 처리와 관련하여 아래와 같이 업무를 위탁하고 있으며, 관계 법령에 따라<br>
										위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다. 또한<br>
										공유하는 정보는 당해 목적을 달성하기 위하여 필요한 최소한의 정보에 국한됩니다.<br>
										<br>
										- 위탁 대상자 : [택배사 이름]<br>
										- 위탁업무 내용 : [택배사 위탁 내용]<br>
										<br>
										- 위탁 대상자 : [PG사 이름]<br>
										- 위탁업무 내용 : [PG사 위탁 내용]<br>
										<br><br><br>
										
										- 당사는 귀하에게 편리하고 혜택이 있는 다양한 서비스를 제공하기 위하여 다음의 업체와<br>
										제휴합니다. 제공되는 개인정보의 항목은 회원가입 시 당사에 제공한 개인정보 중 아래와<br>
										같이 제공됩니다.<br><br>
										
										= 제공대상 : [대상이름]<br>
										= 제공 개인정보 항목 : [제공항목]<br>
										= 정보 이용목적 : [제공목적]<br>
										= 정보 보유 및 이용기간 : [보유기간]<br><br>
										
										- 다만, 아래의 경우에는 예외로 합니다.<br>
										= 이용자들이 사전에 동의한 경우<br>
										= 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의<br>
										요구가 있는 경우<br><br>
										
										- 개인정보의 처리를 위탁하거나 제공하는 경우에는 수탁자, 수탁범위, 공유 정보의 범위 등에<br>
										관한 사항을 서면, 전자우편, 전화 또는 홈페이지를 통해 미리 귀하에게 고지합니다.<br><br>
										
										10. 개인정보관련 의견수렴 및 불만처리에 관한 사항<br><br>
										
										당사는 개인정보보호와 관련하여 이용자 여러분들의 의견을 수렴하고 있으며 불만을 처리하기<br>
										위하여 모든 절차와 방법을 마련하고 있습니다. 이용자들은 하단에 명시한 "11. 개인정보<br>
										관리책임자 및 담당자의 소속-성명 및 연락처"항을 참고하여 전화나 메일을 통하여 불만사항을<br>
										신고할 수 있고, 보드게임몰(주)는 이용자들의 신고사항에 대하여 신속하고도 충분한 답변을 해 드릴<br>
										것입니다.<br><br>
										
										11. 개인정보 관리책임자 및 담당자의 소속-성명 및 연락처<br><br>
										
										당사는 귀하가 좋은 정보를 안전하게 이용할 수 있도록 최선을 다하고 있습니다. 개인정보를<br>
										보호하는데 있어 귀하께 고지한 사항들에 반하는 사고가 발생할 경우 개인정보관리책임자가<br>
										책임을 집니다.<br><br>
										
										이용자 개인정보와 관련한 아이디(ID)의 비밀번호에 대한 보안유지책임은 해당 이용자 자신에게<br>
										있습니다. 보드게임몰(주)는 비밀번호에 대해 어떠한 방법으로도 이용자에게 직접적으로 질문하는 경우는<br>
										없으므로 타인에게 비밀번호가 유출되지 않도록 각별히 주의하시기 바랍니다.<br>
										특히 공공장소에서 온라인상에서 접속해 있을 경우에는 더욱 유의하셔야 합니다.<br>
										보드게임몰(주)는 개인정보에 대한 의견수렴 및 불만처리를 담당하는 개인정보 관리책임자 및 담당자를<br>
										지정하고 있고, 연락처는 아래와 같습니다.<br><br>
										
										이　　　 름 : O O O <br>
										소속 / 직위　: 관리팀 본부장<br>
										E-M A I L 　 : abc@naver.com<br>
										전 화 번 호　: 031-123-1234<br>
										<br>
										12. 고지의 의무<br><br>
										
										현 개인정보취급방침의 내용은 정부의 정책 또는 보안기술의 변경에 따라 내용의 추가 삭제 및<br>
										수정이 있을 시에는 홈페이지의 '공지사항'을 통해 고지할 것입니다.<br>
										
									</div>


								</div>
								<!-- //mypage_unregister -->

							</div>
							<!-- //hack_out -->


						</form>
					</div>

				</div>
			</div>
		</div>
	</section>



	<%@include file="common/footer.jsp"%>

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
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script src="../vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<!--===============================================================================================-->
	<script src="../vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
	<script src="../js/map-custom.js"></script>
	<!--===============================================================================================-->
	<script src="../js/main.js"></script>

</body>
</html>