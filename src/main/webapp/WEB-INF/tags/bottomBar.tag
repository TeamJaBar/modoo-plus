<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute type="java.lang.Integer" name="aDatas"%>
<%@ attribute type="java.lang.Integer" name="bDatas"%>
<%@ attribute type="java.lang.Integer" name="member"%>

<!-- 지난게임이 아닐 시 -->
<c:if test="${bDatas.bAction != 3}">
	<!-- 글작성자 접속 시 -->
	<c:if test="${member.mNum == bDatas.mNum}">
		<a class="correct" href="#">수정</a>
		<a class="delete" href="deleteBoardUser.do?bNum=${bDatas.bNum}">삭제</a>
		<!-- 모집 중 -->
		<c:if test="${bDatas.bAction == 1}">
			<a class="complete" href="updateBoardAction.do?bNum=${bDatas.bNum}&bAction=0">매치 완료하기</a>
		</c:if>
		<!-- 모집완료 -->
		<c:if test="${bDatas.bAction == 0}">
			<a class="complete" href="updateBoardAction.do?bNum=${bDatas.bNum}&bAction=1">매치 완료 취소하기</a>
		</c:if>
	</c:if>
	<!-- 일반유저 접속 시 -->
	<c:if test="${member.mNum != bDatas.mNum}">
		<!-- 모집 중 -->
		<c:if test="${bDatas.bAction == 1}">
			<c:if test="${member.mNum != aDatas.mNum}">
				<a class="complete" href="insertApplicant.do?bNum=${bDatas.bNum}&mNum=${member.mNum}" style="width: 100%">매치 신청하기</a>
			</c:if>
			<c:if test="${member.mNum == aDatas.mNum}">
				<a class="complete" href="deleteApplicantEntry.do?aNum=${aDatas.aNum}" style="width: 100%">매치 신청 취소하기</a>
			</c:if>
		</c:if>
		<!-- 모집완료 -->
		<c:if test="${bDatas.bAction == 0}">
			<c:if test="${member.mNum == aDatas.mNum}">
				<a class="complete" href="deleteApplicantEntry.do?aNum=${aDatas.aNum}" style="width: 100%">매치 신청 취소하기</a>
			</c:if>
		</c:if>
	</c:if>
</c:if>
<!-- 관리자 접속 시 -->
<c:if test="${member.mNum == 'admin'}">
	<a class="delete" href="deleteBoardAd.do?bNum=${bDatas.bNum}" style="width: 100%">삭제하기</a>
</c:if>