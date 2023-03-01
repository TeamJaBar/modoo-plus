<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<!-- 파비콘 삽입 -->
<link rel="icon" href="../../assets/img/favicon.png">
<title>보드매칭 &rsaquo; 매칭 작성 페이지</title>

<style type="text/css">
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
<link rel="stylesheet" href="../../assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../assets/modules/fontawesome/css/all.min.css">

<!-- CSS Libraries -->
<link rel="stylesheet" href="../../assets/modules/bootstrap-daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="../../assets/modules/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
<link rel="stylesheet" href="../../assets/modules/select2/dist/css/select2.min.css">
<link rel="stylesheet" href="../../assets/modules/jquery-selectric/selectric.css">
<link rel="stylesheet" href="../../assets/modules/bootstrap-timepicker/css/bootstrap-timepicker.min.css">
<link rel="stylesheet" href="../../assets/modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.css">

<!-- Template CSS -->
<link rel="stylesheet" href="../../assets/css/style.css">
<link rel="stylesheet" href="../../assets/css/components.css">
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
			<modoo:header id="${member.memberId}" name="${member.memberName}" />

			<!-- Main Content -->
			<div class="main-content">
				<section class="section">
					<div class="section-header">
						<h1>${title}</h1>
					</div>
					<div class="section-body">
						<h2 class="section-title">매칭 ${title} 페이지</h2>
						<div class="row mt-4">
							<div class="col-12">
								<div class="card">
									<div class="card-header">
										<h4>매칭 게시글</h4>
									</div>
									<div class="card-body">
										<form action="${title == '게시글 작성' ? 'insertBoard.do' : 'boardUpdate.do'}" method="post">
											<div class="form-group">
												<label>제목</label>
												<input type="text" class="form-control" name="bTitle" value="${bDatas.bTitle}" />
											</div>
											<div class="form-group">
												<label>모집 인원</label>
												<div class="input-group">
													<div class="input-group mb-2">
														<input type="text" class="form-control text-right" id="inlineFormInputGroup2" name="bCnt" value="${bDatas.bCnt}" />
														<div class="input-group-append">
															<div class="input-group-text">명</div>
														</div>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label>게임 시간</label>
												<div class="input-group">
													<input type="datetime-local" class="form-control" name="bDate" value="${bDatas.bDate}" />
												</div>
											</div>
											<div class="form-group">
												<label>게임 위치</label>
												<div class="input-group">
													<input type="text" id="address" class="form-control" name="bAddress" value="${bDatas.bAddress}" readonly="" />
													<div class="input-group-append">
														<button class="btn btn-primary" data-toggle="modal" data-target="#mapModal">지도 검색</button>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label>실력</label>
												<div class="input-group">
													<div class="selectgroup w-100">
														<label class="selectgroup-item">
															<input type="radio" name="bRate" value="초고수" class="selectgroup-input" checked="${bDatas.bRate == '초고수' ? 'true' : 'false'}" />
															<span class="selectgroup-button">초고수</span>
														</label>
														<label class="selectgroup-item">
															<input type="radio" name="bRate" value="고수" class="selectgroup-input" checked="${bDatas.bRate == '고수' ? 'true' : 'false'}" />
															<span class="selectgroup-button">고수</span>
														</label>
														<label class="selectgroup-item">
															<input type="radio" name="bRate" value="초보" class="selectgroup-input" checked="${bDatas.bRate == '초보' ? 'true' : 'false'}" />
															<span class="selectgroup-button">초보</span>
														</label>
														<label class="selectgroup-item">
															<input type="radio" name="bRate" value="왕초보" class="selectgroup-input" checked="${bDatas.bRate == '왕초보' ? 'true' : 'false'}" />
															<span class="selectgroup-button">왕초보</span>
														</label>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label>내용</label>
												<textarea class="form-control" id="editor" name="cContent">${bDatas.cContent}</textarea>
												<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
												<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
												<script>
													ClassicEditor.create(document.querySelector('#editor'), {
														language : "ko"
													});
												</script>
											</div>
											<div class="card-footer text-right">
												<button type="button" class="btn btn-secondary" onclick="history.go(-1)">취소</button>
												<button type="submit" class="btn btn-primary">작성 완료</button>
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
							<input type="text" id="keyword" class="form-control" placeholder="장소를 입력해 주세요">
							<div class="input-group-append">
								<button type="submit" class="btn btn-primary">검색</button>
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
					</div>
				</div>
				<div class="modal-footer bg-whitesmoke br">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

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
			var el = document.createElement('li'), itemStr = '<div class="media-body">' + '<div class="media-title">' + places.place_name + '</div>' + '<div class="text-small text-muted">'
					+ places.address_name + '</div> </div>' + '<button class="btn btn-primary" value="' + places.address_name + '" onclick="selectAdd(this);" data-dismiss="modal">선택</button>';

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

		//
	</script>
	<script type="text/javascript">
		function selectAdd(args0) {
			var value = $(args0).val();
			document.getElementById("address").value = value;
			document.getElementById("address").innerText = value;
		}

		$().ready(function() {
			$("#alertStart").click(function() {
				Swal.fire({
					icon : 'success',
					title : 'Alert가 실행되었습니다.',
					text : '이곳은 내용이 나타나는 곳입니다.',
				});
			});
		});
	</script>

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
	<script src="../../assets/modules/jquery.min.js"></script>
	<script src="../../assets/modules/popper.js"></script>
	<script src="../../assets/modules/tooltip.js"></script>
	<script src="../../assets/modules/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="../../assets/modules/moment.min.js"></script>
	<script src="../../assets/js/stisla.js"></script>

	<!-- JS Libraies -->
	<script src="../../assets/modules/cleave-js/dist/cleave.min.js"></script>
	<script src="../../assets/modules/cleave-js/dist/addons/cleave-phone.us.js"></script>
	<script src="../../assets/modules/jquery-pwstrength/jquery.pwstrength.min.js"></script>
	<script src="../../assets/modules/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script src="../../assets/modules/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
	<script src="../../assets/modules/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
	<script src="../../assets/modules/bootstrap-tagsinput/dist/bootstrap-tagsinput.min.js"></script>
	<script src="../../assets/modules/select2/dist/js/select2.full.min.js"></script>
	<script src="../../assets/modules/jquery-selectric/jquery.selectric.min.js"></script>
	<!-- Page Specific JS File -->
	<script src="../../assets/js/page/forms-advanced-forms.js"></script>

	<!-- Template JS File -->
	<script src="../../assets/js/scripts.js"></script>
	<script src="../../assets/js/custom.js"></script>
</body>
</html>