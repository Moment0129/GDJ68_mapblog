<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Travel HTML-5 Template </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="/resources/img/index/favicon.ico">

		<!-- CSS here -->
            <link rel="stylesheet" href="/resources/css/index/bootstrap.min.css">
            <link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
            <link rel="stylesheet" href="/resources/css/index/flaticon.css">
            <link rel="stylesheet" href="/resources/css/index/slicknav.css">
            <link rel="stylesheet" href="/resources/css/index/animate.min.css">
            <link rel="stylesheet" href="/resources/css/index/magnific-popup.css">
            <link rel="stylesheet" href="/resources/css/index/fontawesome-all.min.css">
            <link rel="stylesheet" href="/resources/css/index/themify-icons.css">
            <link rel="stylesheet" href="/resources/css/index/slick.css">
            <link rel="stylesheet" href="/resources/css/index/nice-select.css">
            <link rel="stylesheet" href="/resources/css/index/style.css">

			<link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

			<style>
				.outer-div {
				  width : 100%;
				  height : 100%;
				}
				
				.inner-div {
				  width : 200px;
				  height : 100%;
				  margin: auto;
				}

				 * {
                font-family: 'Gothic A1', sans-serif;
                }

				#ip {
				width: 500px;
				height: 32px;
				font-size: 15px;
				border: 0;
				border-radius: 15px;
				outline: none;
				padding-left: 10px;
				background-color: rgba(238, 238, 238, 0.973); 
				position: relative; right: 80%; 
				}

				.border-btn {
					position: relative; left: 10%;
				}
			</style>
   </head>

   <body>
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="/resources/img/찐막.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->

        <!-- Header Start -->

		<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>


        <!-- Header End -->

	<!-- Main start -->
    <main>
		<br><br>
		<div class="col-lg-12 text-center">
			<h2 style="font-size:60px">LOGIN</h2>
		 </div>

		<c:if test="${not empty sessionScope.updateResult}">
			<div class="col-lg-12 text-center">
			<br><h2> 회원정보가 수정되었습니다. 다시 로그인해주세요.</h2>
			</div><br>
		</c:if>
	   <c:if test="${empty sessionScope.updateResult}">
		</c:if>
		<c:if test="${not empty sessionScope.loginFailed}">
			<br><div class="col-lg-12 text-center">
			<h2> 회원 정보가 맞지 않습니다. 다시 시도해주세요.</h2>
			</div><br>
		</c:if>
	   <c:if test="${empty sessionScope.updateResult}">
		</c:if>

		<div class='outer-div'>
			<div class='inner-div'>
				<form action="./login" method="post">
					
					<label></label>
					<input type="text" id="ip" name="id" placeholder="ID를 입력하세요" value="user05" style="font-size: larger; text-align:center;">

					<label></label>
					<input type="password" id="ip" name="pw" placeholder="PW를 입력하세요" value="12341234" style="font-size: larger; text-align:center;">
					<br><br>
					<input type="submit" class="btn border-btn" value="로그인">
				</form>

		<br>
		<a href="./find" style="color: rgb(24, 110, 136); position:relative;left:10%;">아이디/비밀번호 찾기</a><br><br>
		<span id="naver_id_login"><a href="../naver/login">
		<img width="200" height="50" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></span>
		
		<span id="kakao_id_login"><a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=9df9221dadf27f4338ac3350e1787ae9&redirect_uri=http://localhost:82/kakao/login">
		<img width="200" height="50" src="/resources/img/kakaoLogin.png"/></a></span>
			</div>
		</div>
		<br><br><br><br><br><br><br><br><br>
    </main>

        <!-- Footer Start-->

		<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>

        <!-- Footer End-->


	<!-- JS here -->
	
		<!-- All JS Custom Plugins Link Here here -->
        <script src="/resources/js/index/vendor/modernizr-3.5.0.min.js"></script>
		
		<!-- Jquery, Popper, Bootstrap -->
		<script src="/resources/js/index/vendor/jquery-1.12.4.min.js"></script>
        <script src="/resources/js/index/popper.min.js"></script>
        <script src="/resources/js/index/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="/resources/js/index/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="/resources/js/index/owl.carousel.min.js"></script>
        <script src="/resources/js/index/slick.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="/resources/js/index/wow.min.js"></script>
		<script src="/resources/js/index/animated.headline.js"></script>
        <script src="/resources/js/index/jquery.magnific-popup.js"></script>

		<!-- Scrollup, nice-select, sticky -->
        <script src="/resources/js/index/jquery.scrollUp.min.js"></script>
        <script src="/resources/js/index/jquery.nice-select.min.js"></script>
		<script src="/resources/js/index/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="/resources/js/index/contact.js"></script>
        <script src="/resources/js/index/jquery.form.js"></script>
        <script src="/resources/js/index/jquery.validate.min.js"></script>
        <script src="/resources/js/index/mail-script.js"></script>
        <script src="/resources/js/index/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="/resources/js/index/plugins.js"></script>
        <script src="/resources/js/index/main.js"></script>
        
    </body>
</html>