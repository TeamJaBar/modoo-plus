<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<!-- 파비콘 삽입 -->
<link rel="icon" href="../../assets/img/favicon.png">
<title>보드매칭 &rsaquo; 매칭 상세페이지</title>

<!-- General CSS Files -->
<link rel="stylesheet" href="../../assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../../assets/modules/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../../assets/css/match-detail.css">

<!-- CSS Libraries -->

<!-- Template CSS -->
<link rel="stylesheet" href="../../assets/css/style.css">
<link rel="stylesheet" href="../../assets/css/components.css">
<!-- Start GA -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-94034622-3"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-94034622-3');
</script>
<!-- /END GA -->

<!-- Jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!--네이버 MAP API -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=7fsod5t8fd"></script>


<!-- 카카오 API -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>

<body class="layout-3">
	<div id="app">
		<div class="main-wrapper container">

			<!--  header -->
			<modoo:header id="${member.memberId}" name="${member.memberName}" />

			<!-- Main Content -->
			<div class="main-content">
				<section class="section">
					<div class="section-header">
						<h1>매칭 상세페이지</h1>
					</div>
					<div class="section-body">
						<div class="card">
							<div class="navermap-container" style="width: 100%;">
								<div id="map" style="width: 100%; height: 350px;"></div>
							</div>
							<div class="match-container">
								<div class="match-header">
									<div class="match-title">
										<div style="display: flex">
											<!-- 날짜 -->
											<div class="date">23.02.18. (토) 22:00 - 00:00</div>
											<button class="btn-sue" id="modal-sue">
												<i class="fas fa-siren"></i>신고하기
											</button>
										</div>
										<div class="title">빡고수들만 모이셈</div>
									</div>
									<!-- 주소 -->
									<div class="address">경기도 고양시 덕양구 수역이길 42</div>
									<a href="#" class="btn-custom btn-address">
										<i class="far fa-copy"></i> 주소복사하기
									</a>
									<a href="#" id="btn-share" onclick="fn_share('kakaotalk');return false;" class="btn-custom btn-share">
										<i class="fas fa-share-alt"></i> 공유하기
									</a>
								</div>
								<div class="match-body">

									<!-- 탭 -->
									<ul class="nav nav-tabs" id="myTab2" role="tablist">
										<li class="nav-item">
											<a class="nav-link active show" id="info-tab2" data-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="true">정보</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" id="applicant-tab2" data-toggle="tab" href="#applicant" role="tab" aria-controls="applicant" aria-selected="false">신청자</a>
										</li>
									</ul>
									<div class="tab-content tab-bordered">
										<!--매치 정보-->
										<div class="tab-pane fade active show" id="info" role="tabpanel" aria-labelledby="info-tab2">
											<table>
												<tr>
													<td>인원</td>
													<td>실력</td>
													<td>상태</td>
												</tr>
												<tr>
													<td>6명</td>
													<td>초고수</td>
													<td>모집중</td>
												</tr>
											</table>
										</div>
										<!--참가 신청자 정보-->
										<div class="tab-pane fade" id="applicant" role="tabpanel" aria-labelledby="applicant-tab2">
											<ul class="tab-applicant list-unstyled user-progress list-unstyled-border list-unstyled-noborder">
												<!--방장 - 글 작성자-->
												<li class="media">
													<div class="avatar-item">
														<img alt="image" src="../../assets/img/avatar/avatar-1.png" width="50" class="mr-3 img-fluid">
														<div class="avatar-badge">
															<i class="fas fa-crown" style="color: #ffdd00"></i>
														</div>
													</div>
													<div class="media-body">
														<div class="media-title">김시하</div>
														<div class="text-job text-muted">초보</div>
													</div>
													<div class="media-progressbar">
														<div class="progress-text">30점</div>
														<div class="progress" data-height="6" style="height: 6px;">
															<div class="progress-bar bg-primary" data-width="6%" style="width: 6%;"></div>
														</div>
													</div>
												</li>
												<!--일반 참여자-->
												<li class="media">
													<img alt="image" class="mr-3 rounded-circle" width="50" src="../../assets/img/avatar/avatar-5.png">
													<div class="media-body">
														<div class="media-title">윤석환</div>
														<div class="text-job text-muted">고수</div>
													</div>
													<div class="media-progressbar">
														<div class="progress-text">120점</div>
														<div class="progress" data-height="6" style="height: 6px;">
															<div class="progress-bar bg-primary" data-width="24%" style="width: 24%;"></div>
														</div>
													</div>
													<!--퇴출하기 버튼은 글 작성자에게만 보임-->
													<div class="media-cta">
														<a href="#" class="btn btn-outline-primary">퇴출하기</a>
													</div>
												</li>
												<li class="media">
													<img alt="image" class="mr-3 rounded-circle" width="50" src="../../assets/img/avatar/avatar-4.png">
													<div class="media-body">
														<div class="media-title">박가연</div>
														<div class="text-job text-muted">초고수</div>
													</div>
													<div class="media-progressbar">
														<div class="progress-text">450점</div>
														<div class="progress" data-height="6" style="height: 6px;">
															<div class="progress-bar bg-primary" data-width="90%" style="width: 90%;"></div>
														</div>
													</div>
													<div class="media-cta">
														<a href="#" class="btn btn-outline-primary">퇴출하기</a>
													</div>
												</li>
											</ul>
										</div>
									</div>
									<!-- 본문 내용 -->
									<div class="match-content">
										01064816085
										<br>
										편하게 연락주세요
									</div>
									<!-- 댓글 -->
									<div class="match-comment">
										<form action="#" method="post">
											<div class="comment-title">댓글 (2개)</div>
											<div class="form-group">
												<textarea class="form-control" placeholder="댓글을 입력해주세요. (최대 400자)" data-height="150" style="height: 87px;"></textarea>
												<button type="submit" class="btn btn-lg btn-submit">
													<i class="fas fa-comments"></i>
												</button>
											</div>
										</form>

										<ul class="list-unstyled list-unstyled-border list-unstyled-noborder">
											<c:forEach var="com" items="${cDatas}">
												<c:if test="${member.mNum == com.mNum}">
													<!-- 현재 로그인한 사람이 작성한 댓글 -->
													<li class="media">
														<div class="media-body">
															<div class="comment-head">
																<div class="media-title mb-1">${com.mId}</div>
																<c:if test="${com.ccDate == null}">
																	<div class="text-time">${com.cwDate}</div>
																</c:if>
																<c:if test="${com.ccDate != null}">
																	<div class="text-time">수정됨</div>
																</c:if>
															</div>
															<div class="media-description text-muted">${com.cContent}</div>
															<div class="media-links">
																<a href="#">수정</a>
																<div class="bullet"></div>
																<a href="#" class="text-danger">삭제</a>
															</div>
														</div>
													</li>
												</c:if>
												<c:if test="${member.mNum != com.mNum}">
													<!-- 일반 댓글 -->
													<li class="media">
														<div class="media-body">
															<div class="comment-head">
																<div class="media-title mb-1">${com.mId}</div>
																<c:if test="${com.ccDate == null}">
																	<div class="text-time">${com.cwDate}</div>
																</c:if>
																<c:if test="${com.ccDate != null}">
																	<div class="text-time">수정됨</div>
																</c:if>
															</div>
															<div class="media-description text-muted">${com.cContent}</div>
														</div>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="fixed-bottom">

							<c:if test="${member.mNum == bDatas.mNum}">
								<a class="correct" href="#">수정</a>
								<a class="delete" href="#">삭제</a>
								<a class="complete" href="#">매치 완료/신청하기</a>
							</c:if>
							<c:if test="${member.mNum == bDatas.mNum}">
								<a class="complete" href="#">매치 완료/신청하기</a>
							</c:if>
							
							<!--<a class="btn btn-info btn-action mb-3" data-toggle="tooltip"
								title="" data-original-title="매칭 신청"><i
								class="fas fa-user-plus"></i></a> -->
							<!-- 이 아래는 작성자에게만 보이는 버튼 -->
							<!-- <a class="btn btn-info btn-action mb-3" data-toggle="tooltip"
								title="" data-original-title="매칭 완료"><i
								class="fas fa-user-check"></i></a> <a
								class="btn btn-warning btn-action mb-3" data-toggle="tooltip"
								title="" data-original-title="수정하기"><i
								class="fas fa-pencil-alt"></i></a> <a
								class="btn btn-danger btn-action trigger--fire-modal-3"
								data-toggle="tooltip" title=""
								data-confirm="정말 삭제하시겠습니까?|한 번 삭제한 글은 다시 되돌릴 수 없습니다."
								data-confirm-yes="alert('삭제되었습니다.')" data-original-title="삭제하기"><i
								class="fas fa-trash"></i></a> -->
						</div>
					</div>
				</section>
			</div>

			<div class="modal fade" tabindex="-1" role="dialog" id="exampleModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Modal title</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p>Modal body text goes here.</p>
						</div>
						<div class="modal-footer bg-whitesmoke br">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<footer class="main-footer">
			<div class="footer-left">
				Copyright &copy; 2018
				<div class="bullet"></div>
				Design By
				<a href="https://nauval.in/">Muhamad Nauval Azhar</a>
			</div>
			<div class="footer-right"></div>
		</footer>
	</div>

	<form class="modal-part" id="modal-sue-part" style="font-family: 'GmarketSansMedium'">
		<p class="modal-description">신고 사유를 선택해주세요.</p>
		<div class="radio-container">
			<div class="custom-control custom-radio">
				<input type="radio" value="1" id="sc1" name="scnum" class="custom-control-input">
				<label class="custom-control-label" for="sc1">욕설</label>
			</div>
			<div class="custom-control custom-radio">
				<input type="radio" value="2" id="sc2" name="scnum" class="custom-control-input">
				<label class="custom-control-label" for="sc2">혐오발언</label>
			</div>
			<div class="custom-control custom-radio">
				<input type="radio" value="3" id="sc3" name="scnum" class="custom-control-input">
				<label class="custom-control-label" for="sc3">부적절한 ID</label>
			</div>

		</div>
	</form>


	<script>
		<!-- NaverMap API -->
		$(function() {
			initMap();
			Kakao.init('516feb11cc26d2c51d7ca443d04c9c32');
		});
		
		function initMap() {
		 var mapOptions = {
			    center: new naver.maps.LatLng(37.552758094502494, 126.98732600494576),	//지도 초기 중심 좌표
			    zoom: 15	//지도의 초기 줌 레벨
			};
		 
		 var map = new naver.maps.Map('map', mapOptions);
		 
		 var marker = new naver.maps.Marker({
			map:map,
			position: new naver.maps.LatLng(37.552758094502494, 126.98732600494576),
			icon: {
				content: '<img src="<c:url value="/../../assets/img/marker2.png"/>" alt=""style="width: 48px; height: 60px;">',
				size: new naver.maps.Size(32,32),
				anchor: new naver.maps.Point(16, 32)
			}
		 });
		
		}
		
		<!-- 카카오 공유-->
		function fn_share(sns) {
			var thisUrl = document.URL;
			var snsTitle = "빡고수들만 모이셈";
			 
			if(sns == 'kakaotalk') {			    
			    // 카카오링크 버튼 생성
			    Kakao.Share.sendDefault({
			        objectType: 'location',
			        address : '경기도 고양시 덕양구 수역이길 42', //주소
			        content: {
				        title: snsTitle, // 제목
				        imageUrl: thisUrl, // 콘텐츠 URL
				        link: {
				            mobileWebUrl: thisUrl,
				            webUrl: thisUrl
				        }
			        },
			       	buttons: [{
		       			title : '웹으로 보기',
		       			link: {
				            mobileWebUrl: thisUrl,
				            webUrl: thisUrl
				        }
			       	}],
			    
			    });
			}
		}
	</script>


	<!-- General JS Scripts -->
	<script src="../../assets/modules/jquery.min.js"></script>
	<script src="../../assets/modules/popper.js"></script>
	<script src="../../assets/modules/tooltip.js"></script>
	<script src="../../assets/modules/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="../../assets/modules/moment.min.js"></script>
	<script src="../../assets/js/stisla.js"></script>

	<!-- JS Libraies -->

	<!-- Page Specific JS File -->
	<script src="../../assets/js/page/bootstrap-modal.js"></script>

	<!-- Template JS File -->
	<script src="../../assets/js/scripts.js"></script>
	<script src="../../assets/js/custom.js"></script>
</body>
</html>