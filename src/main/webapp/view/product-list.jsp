<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="modoo" tagdir="/WEB-INF/tags"%>
<div class="bg0 m-t-23 p-b-140" id="md-product">
	<div id="product-list" class="container">
	<script>

	function search() {
		var pName = $('input[name=search-product]').val();

		console.log("검색 입력 : " + pName);

		$('.isotope-grid').isotope({filter : '*'});
		$('.btn-category').removeClass('how-active1');
		$('#btn-0').addClass('how-active1');

		var cateNum = '${param.cateNum}';

		var filterSortBy = $('#sortbyFilter').find('.tag1-active').data('value');
		var filterPrice = $('#priceFilter').find('.tag1-active').data('value');
		var filterTags = $('#tagsFilter').find('.tag1-active').data('value');

		if (filterPrice == null) {
			filterPrice = 0;
		}
		if (filterTags == null) {
			filterTags = 0;
		}
		if (filterSortBy == null) {
			filterSortBy = 0;
		}

		console.log(filterSortBy + " " + filterPrice + " " + filterTags);

		$.ajax({
			type : 'POST', //POST 방식으로 보낼래
			url : 'searchFilter.do', // 임의로 했음
			async : false,
			data : {
				pName : pName,
				cateNum : cateNum,
				filterSortBy : filterSortBy,
				filterPrice : filterPrice,
				filterTags : filterTags
			},
			success : function(result) {
				console.log("검색결과 확인");
				var html = jQuery('<div>').html(result);
				var contents = html.find("#md-product").html();
				$("#md-product").html(contents);
			}
		});

	}
	
	$('#btn-filterSearch').click(function() {
		var cateNum = '${param.cateNum}';

		var filterSortBy = $('#sortbyFilter').find('.tag1-active').data('value');
		var filterPrice = $('#priceFilter').find('.tag1-active').data('value');
		var filterTags = $('#tagsFilter').find('.tag1-active').data('value');

		if (filterPrice == null) {
			filterPrice = 0;
		}
		if (filterTags == null) {
			filterTags = 0;
		}
		if (filterSortBy == null) {
			filterSortBy = 0;
		}

		console.log(filterSortBy + ' : ' + filterPrice + ' : ' + filterTags);

		$('.isotope-grid').isotope({
			filter : '*'
		});
		$('.btn-category').removeClass('how-active1');
		$('#btn-0').addClass('how-active1');

		$.ajax({
			type : 'POST', //POST 방식으로 보낼래
			url : 'searchFilter.do', // 임의로 했음
			async : false,
			data : {
				cateNum : cateNum,
				filterSortBy : filterSortBy,
				filterPrice : filterPrice,
				filterTags : filterTags
			},
			success : function(result) {
				console.log("필터결과 확인");
				var html = jQuery('<div>').html(result);
				var contents = html.find("#md-product").html();
				$("#md-product").html(contents);
			}
		});
	})

	
	
	$('#sortbyFilter').find("a").click(function() {

		if ($(this).hasClass("tag1-active") === true) {
			$(this).removeClass("tag1-active");
		} else {
			//모든 class 초기화
			$('#sortbyFilter').find("a").not(this).removeClass("tag1-active");

			//선택한 탭만 class 추가
			$(this).addClass("tag1-active");
		}
	});

	$('#priceFilter').find("a").click(function() {
		if ($(this).hasClass("tag1-active") === true) {
			$(this).removeClass("tag1-active");
		} else {
			//모든 class 초기화
			$('#priceFilter').find("a").not(this).removeClass("tag1-active");

			//선택한 탭만 class 추가
			$(this).addClass("tag1-active");
		}
	});

	$('#tagsFilter').find("a").click(function() {
		if ($(this).hasClass("tag1-active") === true) {
			$(this).removeClass("tag1-active");
		} else {
			//모든 class 초기화
			$('#tagsFilter').find("a").not(this).removeClass("tag1-active");
			//선택한 탭만 class 추가
			$(this).addClass("tag1-active");
		}
	});
</script>
		<script src="../js/main.js"></script>
		<div class="flex-w flex-sb-m p-b-52">
			<div class="flex-w flex-l-m filter-tope-group m-tb-10">
				<button id="btn-0" class="btn-category stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">전체 상품</button>
				<c:forEach var="category" items="${cList}">
					<c:if test="${category.cateM != NULL}">
						<button id="btn-${category.cateNum}" class="btn-category stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".${category.cateNum}">${category.cateM}</button>
					</c:if>
				</c:forEach>
			</div>
			<div class="flex-w flex-c-m m-tb-10">
				`
				<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
					<i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
					<i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
					Filter
				</div>
				<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
					<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
					<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
					Search
				</div>
			</div>
			<!-- Search product -->
			<div class="dis-none panel-search w-full p-t-10 p-b-15">
				<div class="bor8 dis-flex p-l-15">
					<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search" onKeyup="javascript:if(window.event.keyCode==13){search()}">
				</div>
			</div>
			<!-- Filter -->
			<div class="dis-none panel-filter w-full p-t-10">
				<div class="wrap-filter bg10 w-full p-lr-40 p-tb-27 p-lr-15-sm">
					<div id="sortbyFilter" class="filter-col1 p-r-15 p-b-27">
						<div class="mtext-102 cl2 p-b-15">Sort By</div>
						<a href="#" class="hov-tag1 stext-118 cl6 size-304 bor7 p-lr-15 p-tb-3 trans-04 m-b-8 m-r-8" id="sortBy" data-value="11"> 추천순 </a>
						<a href="#" class="hov-tag1 stext-118 cl6 size-304 bor7 p-lr-15 p-tb-3 trans-04 m-b-8 m-r-8" id="sortBy" data-value="12"> 판매인기순 </a>
						<a href="#" class="hov-tag1 stext-118 cl6 size-304 bor7 p-lr-15 p-tb-3 trans-04 m-b-8 m-r-8" id="sortBy" data-value="13"> 낮은가격순 </a>
						<a href="#" class="hov-tag1 stext-118 cl6 size-304 bor7 p-lr-15 p-tb-3 trans-04 m-b-8 m-r-8" id="sortBy" data-value="14"> 높은가격순 </a>
					</div>
					<div id="priceFilter" class="filter-col2 p-r-15 p-b-27 m-t-10">
						<div class="mtext-102 cl2 p-b-15">Price</div>
						<a href="#" class="hov-tag1 stext-118 cl6 size-304 bor7 p-lr-15 p-tb-3 trans-04 m-b-8 m-r-8" id="price" data-value="21"> All </a>
						<a href="#" class="hov-tag1 stext-118 cl6 size-304 bor7 p-lr-15 p-tb-3 trans-04 m-b-8 m-r-8" id="price" data-value="22"> 0 ~ 10,000 &#8361; </a>
						<a href="#" class="hov-tag1 stext-118 cl6 size-304 bor7 p-lr-15 p-tb-3 trans-04 m-b-8 m-r-8" id="price" data-value="23"> 10,000 ~ 20,000 &#8361; </a>
						<a href="#" class="hov-tag1 stext-118 cl6 size-304 bor7 p-lr-15 p-tb-3 trans-04 m-b-8 m-r-8" id="price" data-value="24"> 20,000 ~ 30,000 &#8361; </a>
						<a href="#" class="hov-tag1 stext-118 cl6 size-304 bor7 p-lr-15 p-tb-3 trans-04 m-b-8 m-r-8" id="price" data-value="25"> 30,000 ~ 40,000 &#8361; </a>
						<a href="#" class="hov-tag1 stext-118 cl6 size-304 bor7 p-lr-15 p-tb-3 trans-04 m-b-8 m-r-8" id="price" data-value="26"> 40,000 &#8361; ~ </a>
					</div>
					<div class="filter-col4 p-b-27 m-t-10">
						<div class="mtext-102 cl2 p-b-15">Tags</div>
						<div id="tagsFilter" class="flex-w p-t-4 m-r--5">
							<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5" id="tags" data-value="31"> 1인용 </a>
							<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5" id="tags" data-value="32"> 2인용 </a>
						</div>
					</div>
					<div class="flex-c">
							<button id="btn-filterSearch" class="stext-106 cl0 size-102 bg1 bor2 hov-btn4 p-lr-15">검색</button>
						</div>
				</div>
			</div>
		</div>
		<c:if test="${fn:length(searchResult) == 0}">
			<div class="empty mtext-111">검색 결과가 없습니다.</div>
		</c:if>
		<c:if test="${fn:length(searchResult) != 0}">
			<div class="row isotope-grid">
				<c:forEach var="product" items="${searchResult}">
					<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ${product.cateNum}">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<img src="${product.pImg}" width="180" alt="${product.pName}">
								<a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn3 p-lr-15 trans-04 js-show-quickview "> Quick View </a>
							</div>
							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l ">
									<a href="productDetail.do?pNum=${product.pNum}" id="${product.pNum}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">${product.pName}</a>
									<%-- <input type="submit" hidden>
								<div name="pName">${product.pName}</div> --%>
									<span class="stext-105 cl3">
										<fmt:formatNumber value="${product.selPrice}" type="number" />
										&#8361;
									</span>
								</div>
								<modoo:dib dib="${product.dib}" />
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</div>
<!--===============================================================================================-->
<script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="../js/main.js"></script>
<script>
	$('.isotope-grid').isotope({
		itemSelector : '.isotope-item',
		layoutMode : 'fitRows',
		percentPosition : true,
		animationEngine : 'best-available',
		fitRows : {
			gutter : '.gutter-sizer'
		},
		masonry : {
			columnWidth : '.isotope-item'
		}
	});
</script>