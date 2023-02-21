<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>패스워드 찾기</title>

<link rel="stylesheet" type="text/css" href="../css/login-join.css">


<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

<%@include file="common/header.jsp"%>

<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/ModooShop/images/bg-img-01.png');">
	<h2 class="ltext-105 cl0 txt-center">비밀번호 찾기</h2>
</section>


<!-- Content page -->
<section class="bg0 p-t-75 p-b-120">
	<div class="container">
		<div class="sub_content">
			<div class="content_box">
				<div class="member_wrap">
					<div class="member_cont">
						<!-- 나중에 바꿔요 -->
						<form name="formReset" id="formReset" action="update.do" method="post">
							<div class="member_login_box">
								<h3>비밀번호 변경</h3>
								<p class="findPw-info">비밀번호는 10자 이상이어야 하며, 영문/숫자/특수문자 중 2개 이상을 포함해야 합니다.</p>
								<div class="login_input">
									<div class="findpw_box">
										<div class="member_warning prior_wrong">
											<input type="hidden" name="mId" value="${param.mId}">
											<input type="password" id="passwordMsg" name="mPw" autocomplete="off" placeholder="새 비밀번호" data-min-length="10" data-max-length="20" required>
											<input type="password" id="newPwRe" name="mPwRe" autocomplete="off" placeholder="새 비밀번호 확인" required>
										</div>
									</div>
								</div>
								<div class="btn-center-box" style="margin-top: 40px;">
									<button type="submit" id="btnConfirm" class="btn_member_blue hov-btn4" onclick="return ch()">확인</button>
								</div>
							</div>
							<!-- //find_password_reset_box -->
						</form>
						<!-- //btn_login_box -->
					</div>
					<!-- //member_cont -->
				</div>
				<!-- //member_wrap -->
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
</body>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
function ch(){
    let pw = $("#passwordMsg").val();
    let pwc = $("#newPwRe").val();

    let number = pw.search(/[0-9]/g);
    let english = pw.search(/[a-z]/ig);
    let spece = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{10,}$/;

    if (pw.length < 10 || pw.length > 20) {
        alert("10자리 ~ 20자리 이내로 입력해주세요.");
        return false;

    } else if (pw.search(/\s/) != -1) {
        alert("비밀번호는 공백 없이 입력해주세요.");
        return false;

    } /*else if (number < 0 || english < 0 || spece < 0) {
        alert("영문,숫자,특수문자를 혼합하여 입력해주세요.");
        return false;

    }*/ else if ((number < 0 && english < 0) || (english < 0 && spece < 0) || (spece < 0 && number < 0)) {
        alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
        return false;

    } else if (/(\w)\1\1\1/.test(pw)) {
        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
        return false;

    } else {
        if(pw != pwc){
            alert("비밀번호가 일치하지 않습니다.");
            return false
        } else{
            return true;    
        }
        
    }

    if (false === reg.test(pw)) {
        alert('비밀번호는 10자 이상이어야 하며, 영문/숫자/특수문자 중 2개 이상을 포함해야 합니다.');
        return false;
    } else {
     if(pw != pwc){
            alert("비밀번호가 일치하지 않습니다.");
            return false
        } else{
            alert("변경이 완료되었습니다!");
            return true;    
        }
    }
}
</script>
</html>