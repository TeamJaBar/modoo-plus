<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>

<!-- bDatas : 보드 정보, aDatas : 현재 매치 참가자 정보, cDatas : 현재 매치 댓글 정보, scDatas : 신고 카테고리 정보-->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<!-- 파비콘 삽입 -->
<link rel="icon" href="../assets/img/favicon.png">
<title>보드매칭 &rsaquo; 매칭 상세페이지</title>

<!-- General CSS Files -->
<link rel="stylesheet" href="../assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/modules/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../assets/css/match-detail.css">

<!-- CSS Libraries -->

<!-- Template CSS -->
<link rel="stylesheet" href="../assets/css/style.css">
<link rel="stylesheet" href="../assets/css/components.css">
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

<style type="text/css">
.hidden {
	display: none;
}
</style>

</head>

<body class="layout-3">
	<div id="app">
		<div class="main-wrapper container">

			<!--  header -->
			<modoo:header />

			<!-- Main Content -->
			<div class="main-content">
				<section class="section">
					<c:if test="${bDatas.bStatus==1}">
						<div class="card-body">
							<div class="alert alert-primary alert-has-icon p-4">
								<div class="alert-icon">
									<i class="far fa-lightbulb"></i>
								</div>
								<div class="alert-body">
									<div class="alert-title">삭제된 게시물</div>
									<p>다수 유저의 신고로 인해 관리자의 권한으로 삭제된 매칭 게시글입니다.</p>
									<p class="mt-3">
										<a href="boardList.do" target="_blank" class="btn bg-white text-dark">돌아가기</a>
									</p>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${bDatas.bStatus==0}">
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
												<div class="date">
													<fmt:formatDate value="${bDatas.bDate}" pattern="yy.MM.dd. (E) HH:mm" />
												</div>
												<c:if test="${bDatas.sue != 1}">
													<button class="btn-sue" id="modal-sue" data-toggle="modal">
														<i class="fas fa-siren"></i>신고하기
													</button>
												</c:if>
												<c:if test="${bDatas.sue == 1}">
													<div class="btn-sue">
														<i class="fas fa-siren"></i>신고완료
													</div>
												</c:if>
											</div>
											<div class="title">${bDatas.bTitle}</div>
										</div>
										<!-- 주소 -->
										<div class="address">${bDatas.bAddress}</div>
										<a href="#" class="btn-custom btn-address" onclick="clip(); return false;">
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
														<td>${bDatas.bCnt}</td>
														<td>${bDatas.bRate}</td>
														<td>
															<c:if test="${bDatas.bAction==0}">모집 중</c:if>
															<c:if test="${bDatas.bAction==1}">모집완료</c:if>
															<c:if test="${bDatas.bAction==2}">지난 모임</c:if>
														</td>
													</tr>
												</table>
											</div>
											<!--참가 신청자 정보-->
											<div class="tab-pane fade" id="applicant" role="tabpanel" aria-labelledby="applicant-tab2">
												<ul id="a_box" class="tab-applicant list-unstyled user-progress list-unstyled-border list-unstyled-noborder">
													<c:forEach var="entry" items="${aDatas}">
														<c:if test="${bDatas.mNum == entry.mNum}">
															<!--방장 - 글 작성자-->
															<li class="media">
																<div class="avatar-item">
																	<img alt="image" src="../assets/img/avatar/${entry.mImg}" width="50" class="mr-3 img-fluid">
																	<div class="avatar-badge">
																		<i class="fas fa-crown" style="color: #ffdd00"></i>
																	</div>
																</div>
																<div class="media-body">
																	<div class="media-title">${entry.mId}</div>
																	<div class="text-job text-muted">
																		<modoo:exp score="${entry.score}" />
																	</div>
																</div>
																<div class="media-progressbar">
																	<div class="progress-text">${entry.score}점</div>
																	<div class="progress" data-height="6" style="height: 6px;">
																		<div class="progress-bar bg-primary" data-width="<modoo:score score="${entry.score}" />%" style="width: <modoo:exp score="${entry.score}" />%;"></div>
																	</div>
																</div>
																<div class="media-cta">
																	<div class="btn btn-outline-info">방개설자</div>
																</div>
															</li>
														</c:if>
														<c:if test="${bDatas.mNum != entry.mNum}">
															<!--일반 참여자-->
															<li class="media" id="${entry.aNum}">
																<img alt="image" class="mr-3 rounded-circle" width="50" src="../assets/img/avatar/${entry.mImg}">
																<div class="media-body">
																	<div class="media-title">${entry.mId}</div>
																	<div class="text-job text-muted">
																		<modoo:exp score="${entry.score}" />
																	</div>
																</div>
																<div class="media-progressbar">
																	<div class="progress-text">${entry.score}점</div>
																	<div class="progress" data-height="6" style="height: 6px;">
																		<div class="progress-bar bg-primary" data-width="<modoo:score score="${entry.score}" />%" style="width: <modoo:exp score="${entry.score}" />%;"></div>
																	</div>
																</div>
																<!--퇴출하기 버튼은 글 작성자에게만 보임-->
																<c:if test="${bDatas.mNum == mNum}">
																	<div class="media-cta">
																		<button class="btn btn-outline-primary" id="kickUser">퇴출하기</button>
																	</div>
																</c:if>
																<c:if test="${bDatas.mNum != mNum}">
																	<div class="media-cta">
																		<div class="btn btn-outline-primary">방참가자</div>
																	</div>
																</c:if>
															</li>
														</c:if>
													</c:forEach>
												</ul>
											</div>
										</div>
										<!-- 본문 내용 -->
										<div class="match-content">${bDatas.bContent}</div>
										<!-- 댓글 -->
										<div id="c_box" class="match-comment">
											<div class="comment-title">댓글 (${fn:length(cDatas)}개)</div>
											<div class="media-links">
												<a class="textCount" style="font-size: 2px;">0</a>
												<a class="TextTotal" style="font-size: 2px;">/400</a>
											</div>
											<c:if test="${mNum == null}">
												<div class="form-group">
													<textarea class="form-control cContent" name="cContent" id="textBox" placeholder="댓글을 입력해주세요. (최대 400자)" data-height="150" style="height: 87px;" onclick="validation(this.id)" readonly></textarea>
													<button class="btn-submit" id="insertCommet" disabled>
														<i class="fas fa-comments"></i>
													</button>
												</div>
											</c:if>
											<c:if test="${mNum != null}">
												<div class="form-group">
													<textarea class="form-control cContent" name="cContent" id="textBox" placeholder="댓글을 입력해주세요. (최대 400자)" data-height="150" style="height: 87px;" onclick="validation(this.id)"></textarea>
													<button class="btn-submit" id="insertCommet">
														<i class="fas fa-comments"></i>
													</button>
												</div>
												<div class="alert alert-info hidden char">글자수는 400자까지 입력 가능합니다.</div>
												<div class="alert alert-info hidden space">댓글을 입력해주세요.</div>
												<div class="alert alert-info hidden gap">공백만 입력되었습니다.</div>
											</c:if>


											<ul class="list-unstyled list-unstyled-border list-unstyled-noborder">
												<c:forEach var="com" items="${cDatas}">
													<!-- 현재 로그인한 사람이 작성한 댓글 -->
													<c:if test="${mNum == com.mNum}">
														<li class="media" id="${com.cNum}">
															<div class="media-body">
																<div class="comment-head">
																	<div class="media-title mb-1">${com.mId}</div>
																	<c:if test="${com.cCdate == null}">
																		<div class="text-time">${com.cWdate}</div>
																	</c:if>
																	<c:if test="${com.cCdate != null}">
																		<div class="text-time">수정됨</div>
																	</c:if>
																</div>
																<div class="media-description text-muted">${com.cContent}</div>
																<div class="media-links">
																	<a data-toggle="collapse" href="#collapseExample${com.cNum}" role="button" aria-expanded="false" aria-controls="collapseExample">수정</a>
																	<div class="bullet"></div>
																	<a class="text-danger deleteBoard">삭제</a>
																	<div class="collapse" id="collapseExample${com.cNum}">
																		<div class="media-links">
																			<a class="textCount" style="font-size: 2px;">${fn:length(com.cContent)}</a>
																			<a class="TextTotal" style="font-size: 2px;">/400</a>
																		</div>
																		<div class="form-group">
																			<input type="hidden" name="cNum" id="cNum" value="${com.cNum}" />
																			<textarea class="form-control" name="cContent" id="c${com.cNum}" placeholder="댓글을 입력해주세요. (최대 400자)" data-height="150" style="height: 87px;" onclick="validation(this.id)">${com.cContent}</textarea>
																			<button class="btn btn-lg btn-submit" id="updateCommet">
																				<i class="fas fa-comments"></i>
																			</button>
																		</div>
																		<div class="alert alert-info hidden char">글자수는 400자까지 입력 가능합니다.</div>
																		<div class="alert alert-info hidden space">댓글을 입력해주세요.</div>
																		<div class="alert alert-info hidden gap">공백만 입력되었습니다.</div>
																	</div>
																</div>
															</div>
														</li>
													</c:if>
													<c:if test="${mNum != com.mNum}">
														<!-- 일반 댓글 -->
														<li class="media">
															<div class="media-body">
																<div class="comment-head">
																	<div class="media-title mb-1">${com.mId}</div>
																	<c:if test="${com.cCdate == null}">
																		<div class="text-time">${com.cWdate}</div>
																	</c:if>
																	<c:if test="${com.cCdate != null}">
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
							<!-- 하단 바 -->
							<div class="fixed-bottom">
								<modoo:bottomBar />
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
					</c:if>
				</section>
			</div>
		</div>
	</div>

	<form class="modal-part" id="modal-sue-part" action="insertSue.do" method="post" style="font-family: 'GmarketSansMedium'">
		<p class="modal-description">신고 사유 선택해주세요.</p>
		<input type="hidden" name="bNum" value="${bDatas.bNum}" />
		<input type="hidden" name="mNum" value="${mNum}" />
		<div class="radio-container">
			<c:forEach items="${scDatas}" var="cate" varStatus="i" begin="1" end="${fn:length(scDatas)}" step="1">
				<div class="custom-control custom-radio">
					<input type="radio" value="${cate.scNum}" id="sc${i.index}" name="scNum" class="custom-control-input">
					<label class="custom-control-label" for="sc${i.index}">${cate.scName}</label>
				</div>
			</c:forEach>
		</div>
	</form>



	<script type="text/javascript">
		<!-- NaverMap API -->
		$(function() {
			initMap();
			Kakao.init('516feb11cc26d2c51d7ca443d04c9c32');
		});
		
		function initMap() {
		 var mapOptions = {
			    center: new naver.maps.LatLng(${bDatas.bLatitude}, ${bDatas.bLongitude}),	//지도 초기 중심 좌표
			    zoom: 15	//지도의 초기 줌 레벨
			};
		 
		 var map = new naver.maps.Map('map', mapOptions);
		 
		 var marker = new naver.maps.Marker({
			map:map,
			position: new naver.maps.LatLng('${bDatas.bLatitude}', '${bDatas.bLongitude}'),
			icon: {
				content: '<img src="<c:url value="../assets/img/marker2.png"/>" alt=""style="width: 48px; height: 60px;">',
				size: new naver.maps.Size(32,32),
				anchor: new naver.maps.Point(16, 32)
			}
		 });
		
		}
		
		<!-- 카카오 공유-->
		function fn_share(sns) {
			var thisUrl = document.URL;
			var snsTitle = '${bDatas.bTitle}';
			 
			if(sns == 'kakaotalk') {			    
			    // 카카오링크 버튼 생성
			    Kakao.Share.sendDefault({
			        objectType: 'location',
			        address : '${bDatas.bAddress}', //주소
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
		
		<!-- 주소복사 -->
		function clip(){
			var url = '';
			var textarea = document.createElement("textarea");
			document.body.appendChild(textarea);
			url = window.document.location.href;
			textarea.value = url;
			textarea.select();
			document.execCommand("copy");
			document.body.removeChild(textarea);
			alert("주소가 복사되었습니다.")
		}
	</script>
	<script>
	<!-- 댓글 삭제 -->
	$(document).ready(function() {
		$('.deleteBoard').each(function() {
			let cNum = $(this).parent().parent().parent().prop("id");
			$(this).on('click', function(e) {
				e.preventDefault();
				console.log(cNum);
				if (confirm('정말 삭제하시겠습니까?')) {
					$.ajax({
						type: 'POST',
						url: 'deleteComment.do',
						data: {
							cNum: cNum
						},
						success: function(result) {
							if (result == 1) {
								$('#c_box').load(location.href + ' #c_box>*');
							}
						}
					});
				} 
			})
		})
	})
	<!-- 퇴출하기 -->
		$(document).ready(function() {
		$('#kickUser').each(function() {
			let aNum = $(this).parent().parent().parent().prop("id");
			$(this).on('click', function(e) {
				e.preventDefault();
				console.log(aNum);
				if (confirm('퇴출하시겠습니까?')) {
					$.ajax({
						type: 'POST',
						url: 'kickOut.do',
						data: {
							aNum: aNum
						},
						success: function(result) {
							if (result == 1) {
								$('#a_box').load(location.href + ' #a_box>*');
							}
						}
					});
				} 
			})
		})
	})
	<!-- 댓글 작성하기 -->
		$(document).ready(function() {
			$('#insertCommet').on('click', function(e) {
					e.preventDefault();
					let mNum = '${mNum}';
					let bNum = '${param.bNum}';
					let cContent = $(this).siblings( '.cContent' ).val();
					console.log('cContet: ' + cContent);
	
					if(cContent == '' ||cContent == null){
				        $(this).parent().siblings('gap').addClass('hidden');
				        $(this).parent().siblings('space').removeClass('hidden');
				        $(this).parent().siblings('.char').addClass('hidden');
					} else if(cContent == " "){
				        $(this).parent().siblings('gap').removeClass('hidden');
				        $(this).parent().siblings('space').addClass('hidden');
				        $(this).parent().siblings('.char').addClass('hidden');
					} else{
						$.ajax({
							type: 'POST',
							url: 'insertComment.do',
							data: {
								mNum: mNum,
								bNum: bNum,
								cContent: cContent
							},
							success: function(result) {
								if (result == 1) {
									$('#c_box').load(location.href + ' #c_box>*');
								} else if(result == -1) {
									console.log("실패");
								} 
							}
						});
					}
			})
	})
	
		<!-- 댓글 수정하기 -->
		$(document).ready(function() {
		$('#updateCommet').each(function() {
			let cNum = $(this).siblings( '#cNum' ).val;
			let cContent = $(this).siblings( '#form-control').val;
			$(this).on('click', function(e) {
				e.preventDefault();
				console.log(cNum, cContent);
				if(cContent == '' ||cContent == null){
			        $(this).parent().siblings('gap').addClass('hidden');
			        $(this).parent().siblings('space').removeClass('hidden');
			        $(this).parent().siblings('.char').addClass('hidden');
				} else if(cContent == " "){
			        $(this).parent().siblings('gap').removeClass('hidden');
			        $(this).parent().siblings('space').addClass('hidden');
			        $(this).parent().siblings('.char').addClass('hidden');
				} else{
					$.ajax({
						type: 'POST',
						url: 'updateCommet.do',
						data: {
							cNum: cNum,
							cContent: cContent
						},
						success: function(result) {
							if (result == 1) {
								$('#c_box').load(location.href + ' #c_box>*');
							}
						}
					});	
				}
			})
		})
	})
	
	<!-- 유효성 검사 -->
		function validation(a){
			$('#'+a).keyup(function (e) {
				let content = $(this).val();
				console.log(content);
				console.log($(this).text());
			    // 글자수 세기
			    if (content.length == 0 || content == '') {
			    	$(this).parent().siblings('.media-links').children('.textCount').text('0');
			    } else {
			    	$(this).parent().siblings('.media-links').children('.textCount').text(content.length);
			    }
			    
			    // 글자수 제한
			    if (content.length > 400) {
			    	// 400자 부터는 타이핑 되지 않도록
			        $(this).val($(this).val().substring(0, 400));
			        // 400자 넘으면 알림창 뜨도록
			        $(this).parent().siblings('gap').addClass('hidden');
			        $(this).parent().siblings('space').addClass('hidden');
			        $(this).parent().siblings('.char').removeClass('hidden');
			    };
			});
		}
	</script>
	<!-- General JS Scripts -->
	<script src="../assets/modules/jquery.min.js"></script>
	<script src="../assets/modules/popper.js"></script>
	<script src="../assets/modules/tooltip.js"></script>
	<script src="../assets/modules/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/modules/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="../assets/modules/moment.min.js"></script>
	<script src="../assets/js/stisla.js"></script>

	<!-- JS Libraies -->

	<!-- Page Specific JS File -->
	<script src="../assets/js/page/bootstrap-modal.js"></script>

	<!-- Template JS File -->
	<script src="../assets/js/scripts.js"></script>
	<script src="../assets/js/custom.js"></script>
</body>
</html>