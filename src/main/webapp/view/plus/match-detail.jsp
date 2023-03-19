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

.match-content img {
	max-width: 100%;
	object-fit: cover;
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
					<c:if test="${status.mStatus==1 && bDatas.bStatus==0}">
						<div class="card-body">
							<div class="alert alert-primary alert-has-icon p-4">
								<div class="alert-icon">
									<i class="far fa-lightbulb"></i>
								</div>
								<div class="alert-body">
									<div class="alert-title">블라인드된 게시물</div>
									<p>다수 유저의 신고로 인해 관리자의 권한으로 정지당한 회원의 블라인드된 매칭 게시글입니다.</p>
									<p class="mt-3">
										<a href="boardList.do" target="_blank" class="btn bg-white text-dark">돌아가기</a>
									</p>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${status.mStatus==0 && bDatas.bStatus==0}">
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
													<input type="hidden" id="code_reddit" value="모임장소는 ${bDatas.bAddress}이고 모임일자는 ${bDatas.bDate}입니다. " autocomplete="off" />
													<button class="btn btn-icon" onclick="g_gout()" style="transform: translateX(10px);">
														<span class="fas fa-volume-up"></span>
													</button>
												</div>
												<c:if test="${bDatas.mNum != mNum && mNum ne null}">
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
										<div id="a_box">
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
															<td>모집 인원</td>
															<td>모집 실력</td>
															<td>모집 상태</td>
														</tr>
														<tr>
															<td>${fn:length(aDatas)}/${bDatas.bCnt}</td>
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
													<ul class="tab-applicant list-unstyled user-progress list-unstyled-border list-unstyled-noborder">
														<c:forEach var="entry" items="${aDatas}">
															<c:if test="${bDatas.mNum == entry.mNum}">
																<!--방장 - 글 작성자-->
																<li class="media">
																	<div class="avatar-item">
																		<img alt="writerAvatar" src="../assets/img/avatar/${entry.mImg}" width="50" class="mr-3 img-fluid">
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
																	<img alt="participantAvatar" class="mr-3 rounded-circle" width="50" src="../assets/img/avatar/${entry.mImg}">
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
																	<c:if test="${bDatas.mNum == mNum || 'admin' eq mId}">
																		<div class="media-cta">
																			<button class="btn btn-outline-primary" id="kickUser" onclick="kickuser(${entry.aNum})">퇴출하기</button>
																		</div>
																	</c:if>
																	<c:if test="${bDatas.mNum != mNum && 'admin' ne mId}">
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
										</div>
										<!-- 본문 내용 -->
										<div class="match-content">${bDatas.bContent}</div>
										<!-- 댓글 -->
										<div id="c_box" class="match-comment">

											<div class="comment-title">댓글 (${fn:length(cDatas)}개)</div>
											<div class="media-links">
												<a class="textCount" style="font-size: 2px;">0</a>
												<a class="TextTotal" style="font-size: 2px;">/300</a>
											</div>
											<div class="form-group">
												<textarea class="form-control cContent" name="cContent" id="textBox" placeholder="댓글을 입력해주세요. (최대 300자)" data-height="150" style="height: 87px; resize: none;" onclick="validation(this.id)"></textarea>
												<%-- <c:if test="${mNum == null}">
													<button class="btn-submit" id="insertCommet" onclick="loginConfirm()">
														<i class="fas fa-comments"></i>
													</button>
												</c:if>
												<c:if test="${mNum != null}">
													<button class="btn-submit" id="insertCommet" onclick="comCreate()">
														<i class="fas fa-comments"></i>
													</button>
												</c:if> --%>
												<button class="btn-submit" id="insertCommet" onclick="${mNum == null} ? loginConfirm() : comCreate()">
													<i class="fas fa-comments"></i>
												</button>
											</div>
											<div class="alert alert-info hidden char">글자수는 300자까지 입력 가능합니다.</div>
											<div class="alert alert-info hidden space">댓글을 입력해주세요.</div>
											<div class="alert alert-info hidden gap">공백만 입력되었습니다.</div>
											<ul class="list-unstyled list-unstyled-border list-unstyled-noborder" style="word-break: break-all;">
												<c:forEach var="com" items="${cDatas}">
													<c:choose>
														<c:when test="${com.mStatus == '0'}">
															<li class="media" id="${com.cNum}">
																<div class="media-body">
																	<div class="comment-head">
																		<div class="media-title mb-1">${com.mId}</div>
																		<div class="text-time">
																			<c:if test="${com.cCdate == null}">
																				<fmt:formatDate value="${com.cWdate}" pattern="yy.MM.dd (E) HH:mm" />
																			</c:if>
																			<c:if test="${com.cCdate != null}">
																				<fmt:formatDate value="${com.cCdate}" pattern="yy.MM.dd (E) HH:mm" /> (수정됨)
																	</c:if>
																		</div>
																	</div>
																	<div class="media-description text-muted">${com.cContent}</div>
																	<!-- 작성자와 현재 로그인한 사람이 같다면 -->
																	<c:if test="${mNum == com.mNum}">
																		<div class="media-links">
																			<a data-toggle="collapse" href="#collapseExample${com.cNum}" role="button" aria-expanded="false" aria-controls="collapseExample">수정</a>
																			<div class="bullet"></div>
																			<a class="text-danger deleteBoard" onclick="comDel(${com.cNum});">삭제</a>
																			<div class="collapse" id="collapseExample${com.cNum}">
																				<div class="media-links">
																					<a class="textCount" style="font-size: 2px;">${fn:length(com.cContent)}</a>
																					<a class="TextTotal" style="font-size: 2px;">/300</a>
																				</div>
																				<div class="form-group">
																					<textarea class="form-control" name="cContent" id="c${com.cNum}" placeholder="댓글을 입력해주세요. (최대 300자)" data-height="150" style="height: 87px; resize: none;"
																						onclick="validation(this.id)">${com.cContent}</textarea>
																					<button class="btn btn-lg btn-submit" id="update${com.cNum}" onclick="comUpdate(${com.cNum})">
																						<i class="fas fa-comments"></i>
																					</button>
																				</div>
																				<div class="alert alert-info hidden char">글자수는 300자까지 입력 가능합니다.</div>
																				<div class="alert alert-info hidden space">댓글을 입력해주세요.</div>
																				<div class="alert alert-info hidden gap">공백만 입력되었습니다.</div>
																			</div>
																		</div>
																	</c:if>
																</div>
															</li>
														</c:when>
														<c:otherwise>
															<li class="media">
																<div class="far fa-user media-description text-muted">&nbsp; 관리자에 의해 규제된 댓글입니다.</div>
															</li>
														</c:otherwise>
													</c:choose>
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

	<form class="modal-part" id="modal-sue-part" method="post" style="font-family: 'GmarketSansMedium'">
		<p class="modal-description">신고 사유를 선택해주세요.</p>
		<input type="hidden" name="bNum" value="${bDatas.bNum}" />
		<input type="hidden" name="mNum" value="${mNum}" />
		<div class="radio-container">
			<c:forEach items="${scDatas}" var="cate" varStatus="i" begin="0" end="${fn:length(scDatas)}" step="1">
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
				content: '<img alt="mapMaker" src="<c:url value="../assets/img/marker2.png"/>" alt=""style="width: 48px; height: 60px;">',
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
		
		<!-- 댓글 추가 -->
		function comCreate(){
					let mNum = '${mNum}';
					let bNum = '${param.bNum}';
					let cContent = $('#textBox').val();
					console.log('cContet: ' + cContent);
	
					if(cContent == '' ||cContent == null){
				        $('#insertCommet').parent().siblings('.gap').addClass('hidden');
				        $('#insertCommet').parent().siblings('.space').removeClass('hidden');
				        $('#insertCommet').parent().siblings('.char').addClass('hidden');
					} else if(cContent.trim() == ""){
				        $('#insertCommet').parent().siblings('.gap').removeClass('hidden');
				        $('#insertCommet').parent().siblings('.space').addClass('hidden');
				        $('#insertCommet').parent().siblings('.char').addClass('hidden');
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
		}
		
		<!-- 댓글 수정 -->
		function comUpdate(e){
				let cContent = $('#c'+e).val();
					console.log(e, cContent);
					if(cContent == '' ||cContent == null){
				        $('#c'+e).parent().siblings('.gap').addClass('hidden');
				        $('#c'+e).parent().siblings('.space').removeClass('hidden');
				        $('#c'+e).parent().siblings('.char').addClass('hidden');
					} else if(cContent.trim() == ""){
				        $('#c'+e).parent().siblings('.gap').removeClass('hidden');
				        $('#c'+e).parent().siblings('.space').addClass('hidden');
				        $('#c'+e).parent().siblings('.char').addClass('hidden');
					} else{
						$.ajax({
							type: 'POST',
							url: 'updateComment.do',
							data: {
								cNum: e,
								cContent: cContent
							},
							success: function(result) {
								if (result == 1) {
									$('#c_box').load(location.href + ' #c_box>*');
								} else {
									console.log("실패");
								}
							}
						});	
					}
		}
		
		<!-- 댓글 삭제 -->
		function comDel(e){
					console.log(e);
					if (confirm('정말 삭제하시겠습니까?')) {
						$.ajax({
							type: 'POST',
							url: 'deleteComment.do',
							data: {
								cNum: e
							},
							success: function(result) {
								if (result == 1) {
									$('#c_box').load(location.href + ' #c_box>*');
								}
							}
						});
					} 
		}
		
		<!-- 참여자 퇴출 -->
		function kickuser(e){
						console.log(e);
						if (confirm('정말로 퇴출하시겠습니까?')) {
							$.ajax({
								type: 'POST',
								url: 'kickOut.do',
								data: {
									aNum: e
								},
								success: function(result) {
									if (result == 1) {
										$('#a_box').load(location.href + ' #a_box>*');
									} else {
										console.log('실패');
									}
								}
							});
						} 
		}
		
		<!-- 유효성 검사 -->
		function validation(a){
			$('#'+a).keyup(function (e) {
				let content = $(this).val();
				console.log(a, content);
			    // 글자수 세기
			    if (content.length == 0 || content == '') {
			    	$(this).parent().siblings('.media-links').children('.textCount').text('0');
			    } else {
			    	$(this).parent().siblings('.media-links').children('.textCount').text(content.length);
			    }
			    
			    // 글자수 제한
			    if (content.length > 300) {
			    	// 300자 부터는 타이핑 되지 않도록
			        $(this).val($(this).val().substring(0, 300));
			        // 300자 넘으면 알림창 뜨도록
			        $(this).parent().siblings('.gap').addClass('hidden');
			        $(this).parent().siblings('.space').addClass('hidden');
			        $(this).parent().siblings('.char').removeClass('hidden');
			    };
			});
		}
		
		function loginConfirm(){
			let loginConfirm = confirm("로그인이 필요합니다. 진행하시겠습니까?");
			if(loginConfirm) {
				location.href = "login.do"
			}
		}
		
		  //음성 tts 실행
	      var voices = [];
	      function setVoiceList() {
	         voices = window.speechSynthesis.getVoices();
	      }

	      setVoiceList();

	      if (window.speechSynthesis.onvoiceschanged !== undefined) {
	         window.speechSynthesis.onvoiceschanged = setVoiceList;
	      }

	      function speech(txt) {
	         if (!window.speechSynthesis) {
	            alert("음성 재생을 지원하지 않는 브라우저입니다. 크롬, 파이어폭스 등의 최신 브라우저를 이용하세요");
	            return;
	         }

	         var lang = 'ko-KR';
	         var utterThis = new SpeechSynthesisUtterance(txt);

	         utterThis.onend = function(event) {
	            console.log('end');
	         };

	         utterThis.onerror = function(event) {
	            console.log('error', event);
	         };

	         var voiceFound = false;

	         for (var i = 0; i < voices.length; i++) {
	            if (voices[i].lang.indexOf(lang) >= 0 || voices[i].lang.indexOf(lang.replace('-', '_')) >= 0) {
	               utterThis.voice = voices[i];
	               voiceFound = true;
	            }
	         }
	         if (!voiceFound) {
	            alert('voice not found');
	            return;
	         }

	         utterThis.lang = lang;
	         utterThis.pitch = 1;
	         utterThis.rate = 0.8; //속도

	         window.speechSynthesis.speak(utterThis);
	      }

	      function g_gout() {
	         var t = document.getElementById("code_reddit");
	         speech(t.value);
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