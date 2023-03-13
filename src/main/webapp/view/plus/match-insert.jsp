<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<!-- 파비콘 삽입 -->
<link rel="icon" href="../assets/img/favicon.png">
<title><spring:message code="message.match-insert.title" /></title>
<style type="text/css">
.hidden {
	display: none;
}

select option[disabled] {
	display: none;
}

.ck-editor__editable {
	min-height: 300px;
}

select option[disabled] {
	display: none;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	width: 100%;
	height: 100%;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

#searchResult-list {
	margin-top: 30px;
}

#search-item {
	padding-right: 0px;
}
</style>

<!-- General CSS Files -->
<link rel="stylesheet" href="../assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/modules/fontawesome/css/all.min.css">

<!-- CSS Libraries -->
<link rel="stylesheet" href="../assets/modules/bootstrap-daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="../assets/modules/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
<link rel="stylesheet" href="../assets/modules/select2/dist/css/select2.min.css">
<link rel="stylesheet" href="../assets/modules/jquery-selectric/selectric.css">
<link rel="stylesheet" href="../assets/modules/bootstrap-timepicker/css/bootstrap-timepicker.min.css">
<link rel="stylesheet" href="../assets/modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.css">

<!-- Template CSS -->
<link rel="stylesheet" href="../assets/css/style.css">
<link rel="stylesheet" href="../assets/css/components.css">
<!-- Start GA -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-94034622-3');
</script>
<!-- /END GA -->
</head>

<body>
	<div id="app">
		<div class="main-wrapper main-wrapper-1">

			<!--  header -->
			<modoo:header />

			<!-- Main Content -->
			<div class="main-content">
				<section class="section">
					<div class="section-header">
						<c:choose>
							<c:when test="${param.type == 'update'}">
								<h1>
									<spring:message code="message.match-insert.headerModify" />
								</h1>
							</c:when>
							<c:otherwise>
								<h1>
									<spring:message code="message.match-insert.headerCreating" />
								</h1>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="section-body">
						<c:choose>
							<c:when test="${param.type == 'update'}">
								<h2 class="section-title">
									<spring:message code="message.match-insert.sectionTitleModify" />
								</h2>
							</c:when>
							<c:otherwise>
								<h2 class="section-title">
									<spring:message code="message.match-insert.sectionTitleCreating" />
								</h2>
							</c:otherwise>
						</c:choose>
						<div class="row mt-4">
							<div class="col-12">
								<div class="card">
									<div class="card-header">
										<h4><spring:message code="message.match-insert.cardHeader" /></h4>
									</div>
									<div class="card-body">
										<form action="${param.type == 'update' ? 'updateBoard.do' : 'insertBoard.do'}" method="post" onsubmit="return submitBoard();">
											<c:if test="${param.type == 'update'}">
												<input type="hidden" name="bNum" value="${bDatas.bNum}" />
											</c:if>
											<input type="hidden" name="bLatitude" id="bLatitude" value="${bDatas.bLatitude}" />
											<input type="hidden" name="bLongitude" id="bLongitude" value="${bDatas.bLongitude}" />
											<div class="form-group">
												<label><spring:message code="message.match-insert.postTitle" /></label>
												<input type="text" class="form-control title" name="bTitle" value="${bDatas.bTitle}" />
											</div>
											<div class="alert alert-info hidden char"><spring:message code="message.match-insert.alertChar" /></div>
											<div class="form-group">
												<label><spring:message code="message.match-insert.personnel" /></label>
												<div class="input-group">
													<div class="input-group mb-2">
														<input type="text" class="form-control text-right bCnt" id="inlineFormInputGroup2" name="bCnt" value="${bDatas.bCnt}" />
														<div class="input-group-append">
															<div class="input-group-text"><spring:message code="message.match-insert.person" /></div>
														</div>
													</div>
												</div>
											</div>
											<div class="alert alert-info hidden max"><spring:message code="message.match-insert.alertMax" /></div>
											<div class="alert alert-info hidden num"><spring:message code="message.match-insert.alertNum" /></div>
											<div class="form-group">
												<label><spring:message code="message.match-insert.time" /></label>
												<div class="input-group">
													<input type="datetime-local" id="date-local" class="form-control date" name="date" value="${bDatas.bDate}" />
												</div>
											</div>
											<div class="alert alert-info hidden datetime"><spring:message code="message.match-insert.alertDatetime" /></div>
											<div class="form-group">
												<label><spring:message code="message.match-insert.location" /></label>
												<div class="input-group">
													<input type="text" id="address" class="form-control" name="bAddress" value="${bDatas.bAddress}" readonly />
													<div class="input-group-append">
														<button type="button" class="btn btn-primary" id="btn-map" data-toggle="modal" data-target="#mapModal"><spring:message code="message.match-insert.mapSearch" /></button>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label><spring:message code="message.match-insert.ability" /></label>
												<div class="input-group">
													<div class="selectgroup w-100">
														<label class="selectgroup-item">
															<input type="radio" name="bRate" value="초고수" class="selectgroup-input" ${bDatas.bRate eq '초고수' ? 'checked' : ''} />
															<span class="selectgroup-button"><spring:message code="message.match-insert.challenger" /></span>
														</label>
														<label class="selectgroup-item">
															<input type="radio" name="bRate" value="고수" class="selectgroup-input" ${bDatas.bRate eq '고수' ? 'checked' : ''} />
															<span class="selectgroup-button"><spring:message code="message.match-insert.master" /></span>
														</label>
														<label class="selectgroup-item">
															<input type="radio" name="bRate" value="초보" class="selectgroup-input" ${bDatas.bRate eq '초보' ? 'checked' : ''} />
															<span class="selectgroup-button"><spring:message code="message.match-insert.novice" /></span>
														</label>
														<label class="selectgroup-item">
															<input type="radio" name="bRate" value="왕초보" class="selectgroup-input" ${bDatas.bRate eq '왕초보' ? 'checked' : ''} />
															<span class="selectgroup-button"><spring:message code="message.match-insert.nooblette" /></span>
														</label>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label><spring:message code="message.match-insert.contents" /></label>
												<textarea class="form-control" id="editor" name="bContent">${bDatas.bContent}</textarea>
												<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
												<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
												<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
												<script>
													ClassicEditor.create(document.querySelector('#editor'), {
														language : "ko",
														ckfinder : {
															uploadUrl : 'uploadImg.do'
														}
													});
												</script>
											</div>
											<div class="alert alert-info hidden blankMsg"><spring:message code="message.match-insert.alertblankMsg" /></div>
											<div class="card-footer text-right">
												<button type="button" class="btn btn-secondary" onclick="history.go(-1)"><spring:message code="message.match-insert.cancel" /></button>
												<button type="submit" class="btn btn-primary"><spring:message code="message.match-insert.complete" /></button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<!-- Modal screen -->
	<div class="modal fade" role="dialog" id="mapModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<form onsubmit="searchPlaces(); return false;">
						<div class="input-group">
							<input type="text" id="keyword" class="form-control" placeholder="<spring:message code='message.match-insert.enterLocation' />">
							<div class="input-group-append">
								<button type="submit" class="btn btn-primary"><spring:message code="message.match-insert.mapSearch" /></button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-body">
					<div class="map_wrap">
						<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

					</div>
					<div id="menu_wrap" class="bg_white">
						<ul class="list-unstyled list-unstyled-border" id="searchResult-list">
						</ul>
						<div id="pagination"></div>
					</div>
				</div>
				<div class="modal-footer bg-whitesmoke br">
					<button type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="message.match-insert.cancel" /></button>
				</div>
			</div>
		</div>
	</div>

	<style>
.main-content {
	padding-left: 15%;
	padding-right: 15%;
	min-width: 40%;
}

@font-face {
	font-family: 'GmarketSansMedium';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'GmarketSansMedium';
}
</style>
	<!-- General JS Scripts -->
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	<script src="../assets/modules/jquery.min.js"></script>
	<script src="../assets/modules/popper.js"></script>
	<script src="../assets/modules/tooltip.js"></script>
	<script src="../assets/modules/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="../assets/modules/moment.min.js"></script>
	<script src="../assets/js/stisla.js"></script>

	<!-- JS Libraies -->
	<script src="../assets/modules/cleave-js/dist/cleave.min.js"></script>
	<script src="../assets/modules/cleave-js/dist/addons/cleave-phone.us.js"></script>
	<script src="../assets/modules/jquery-pwstrength/jquery.pwstrength.min.js"></script>
	<script src="../assets/modules/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script src="../assets/modules/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
	<script src="../assets/modules/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
	<script src="../assets/modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
	<script src="../assets/modules/select2/dist/js/select2.full.min.js"></script>
	<script src="../assets/modules/jquery-selectric/jquery.selectric.min.js"></script>
	<!-- Page Specific JS File -->
	<script src="../assets/js/page/forms-advanced-forms.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e98e93c6644d1ff13c4d2be348fb6bd&libraries=services"></script>
	<script>
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
			map.relayout();
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('searchResult-list'), menuEl = document.getElementById('menu_wrap'), fragment = document.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다.
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover', function() {
						displayInfowindow(marker, title);
					});

					kakao.maps.event.addListener(marker, 'mouseout', function() {
						infowindow.close();
					});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
			var arr = [ index, places.place_name, places.address_name, places.y, places.x ];

			var el = document.createElement('li'), itemStr = '<div class="media-body">' + '<div class="media-title">' + places.place_name + '</div>' + '<div class="text-small text-muted">'
					+ places.address_name + '</div> </div>' + '<button class="btn btn-primary" value="' + arr + '" onclick="selectAdd(this);" data-dismiss="modal" id="adBtn"><spring:message code="message.match-insert.choice" /></button>';

			el.innerHTML = itemStr;
			el.className = 'media';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}

		// 검색결과 선택 시 address에 추가하는 함수입니다
		function selectAdd(args0) {
			var value = $(args0).val().split(",");

			document.getElementById("address").value = value[2] + ' ' + value[1];
			document.getElementById("address").innerText = value[2] + ' ' + value[1];
			document.getElementById("bLatitude").value = value[3];
			document.getElementById("bLongitude").value = value[4];
		}

		$(document).ready(function() {
			//타이틀 유효성검사
			$(".title").keyup(function(e) {
				let title = $(this).val();
				// console.log($(this).val());

				// 글자수 제한
				if (title.length > 50) {
					// 50자 부터는 타이핑 되지 않도록
					$(this).val($(this).val().substring(0, 50));
					// 50자 넘으면 알림창 뜨도록
					$(this).parent().siblings('.char').removeClass('hidden');
				} else {
					$(this).parent().siblings('.char').addClass('hidden');
				}
			});

			//모집인원 유효성검사
			$(".bCnt").keyup(function(e) {
				var regExp = /^[0-9]*$/;
				let cnt = $(this).val();
				console.log(cnt);

				// 인원 제한
				if (!regExp.test(cnt)) {
					// 숫자 이외의 값 입력시 0으로 변환
					$(this).val(0);
					// 숫자 이외의 값 넣으면 알림창 뜨도록
					$(this).parent().parent().parent().siblings('.max').addClass('hidden');
					$(this).parent().parent().parent().siblings('.num').removeClass('hidden');
				} else if (cnt > 20) {
					// 10자리 이상 부터는 타이핑 되지 않도록
					$(this).val($(this).val().substring(0, 2));
					// 20 이상 넘을시 20으로 자동 변환
					$(this).val(20);
					// 50자 넘으면 알림창 뜨도록
					$(this).parent().parent().parent().siblings('.num').addClass('hidden');
					$(this).parent().parent().parent().siblings('.max').removeClass('hidden');
				} else {
					$(this).parent().parent().parent().siblings('.num').addClass('hidden');
					$(this).parent().parent().parent().siblings('.max').addClass('hidden');
				}
			});

			//모임 기간 유효성검사
			var now_utc = new Date();
			var oneHoursLater = new Date(now_utc.setHours(now_utc.getHours() + 1));
			var timeOff = new Date().getTimezoneOffset() * 60000;
			var today = new Date(oneHoursLater - timeOff).toISOString().substring(0, 16);
			//현재 시간보다 1시간 후의 시간만 선택할수 있게 설정
			$("#date-local").attr("min", today);

			var twoMonthLater = new Date(now_utc.setMonth(now_utc.getMonth() + 2));
			var monthLater = new Date(twoMonthLater - timeOff).toISOString().substring(0, 16);
			//최대 2달 이후까지 선택할수 있게 설정
			$("#date-local").attr("max", monthLater);

			//현재 시간의 1시간 이후 시간보다 이전 시간 선택시 알림창 뜨도록
			$('#date-local').focusout(function() {
				if ($("#date-local").val() < today) {
					$(".datetime").removeClass('hidden');
					$("#date-local").val(today);
				} else {
					$(".datetime").addClass('hidden');
				}
			});

			$('#mapModal').on('shown.bs.modal', function() {
				map.relayout(); // 여기서 'map'은 카카오 맵 객체를 나타냅니다.
			});
		});

		//버튼입력 시 유효성검사
		function submitBoard() {
			var title = $(".title").val();
			var cnt = $(".bCnt").val();
			var datetime = $(".date").val();
			var address = $("#address").val();

			if (title == '' || title == null || title == " " || cnt == '' || cnt == null || datetime == '' || datetime == null || address == '' || address == null) {
				$('.blankMsg').removeClass('hidden');
				return false;
			} else {
				$('.blankMsg').addClass('hidden');
				return true;
			}
		}
	</script>

	<!-- Template JS File -->
	<script src="../assets/js/scripts.js"></script>
	<script src="../assets/js/custom.js"></script>
</body>
</html>