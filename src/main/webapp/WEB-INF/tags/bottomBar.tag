<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${not empty mNum}">
	<c:if test="${mId != 'admin'}">
		<!-- 일반유저 접속시 -->
		<!-- 지난게임이 아닐 시 -->
		<c:if test="${bDatas.bAction != 2}">
			<!-- 글작성자 접속 시 -->
			<c:if test="${mNum == bDatas.mNum}">
				<a class="correct" href="updateBoard.do?bNum=${bDatas.bNum}&type=update">수정</a>
				<a class="delete" href="boardDelete.do?bNum=${bDatas.bNum}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
				<!-- 모집 중 -->
				<c:if test="${bDatas.bAction == 0}">
					<a class="complete" href="updateBoardAction.do?bNum=${bDatas.bNum}&bAction=1">매치 완료하기</a>
				</c:if>
				<!-- 모집완료 -->
				<c:if test="${bDatas.bAction == 1}">
					<a class="complete" href="updateBoardAction.do?bNum=${bDatas.bNum}&bAction=0">매치 완료 취소하기</a>
				</c:if>
			</c:if>
			<!-- 일반유저 접속 시 -->
			<c:if test="${mNum != bDatas.mNum}">
				<!-- 모집 중 -->
				<c:if test="${bDatas.bAction == 0}">
					<c:if test="${bDatas.apply == 0}">
						<a class="complete" href="insertApplicant.do?bNum=${bDatas.bNum}&mNum=${mNum}" style="width: 100%">매치 신청하기</a>
					</c:if>
					<c:if test="${bDatas.apply == 1}">
						<a class="complete" href="myEntryDelete.do?aNum=${bDatas.aNum}" style="width: 100%">매치 신청 취소하기</a>
					</c:if>
				</c:if>
				<c:if test="${bDatas.bAction == 1}">
					<!-- 모집완료 -->
					<c:if test="${bDatas.apply == 1}">
						<a class="complete" href="myEntryDelete.do?aNum=${bDatas.aNum}" style="width: 100%">매치 신청 취소하기</a>
					</c:if>
				</c:if>
			</c:if>
		</c:if>
	</c:if>

	<!-- 관리자 접속 시 -->
	<c:if test="${mId == 'admin'}">
		<a class="complete" href="boardDelete.do?bNum=${bDatas.bNum}" style="width: 100%">삭제하기</a>
	</c:if>
</c:if>