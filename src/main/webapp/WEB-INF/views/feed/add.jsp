<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Travel HTML-5 Template </title>

        <c:import url="../temp/bootStrap.jsp"></c:import>

        <!-- Kakao Map -->
        <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d19d0bc22748e1c8a814e507a6e96ed2&libraries=services"></script>
    
        <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
        <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
    
        <!-- include summernote css/js -->
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>


        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <style>
                

            ::-webkit-scrollbar,::-webkit-scrollbar-track {
                border-radius: 0;
                background: #eee;
                width: 5px;
                height: 5px
            }
            
            ::-webkit-scrollbar-thumb {
                border-radius: 5px;
                background-color: #999;
            }
            
            ::-webkit-scrollbar-thumb:hover {
                cursor: pointer;
                background-color: #000;
            }
                        html,body{background-color: #fff;}
                        .main-header{
                            background-color: #fff;
                        }
                        .hidden {
                position: absolute!important;
                text-indent: -99999px!important;
                opacity: 0!important;
                width: 0!important;
                height: 0!important;
                line-height: 0!important;
                padding: 0!important;
                margin: 0!important;
                border: none!important;
                overflow: hidden!important;
                outline: 0!important;
                box-shadow: none!important;
                background: none!important;
                clip: rect(0,0,0,0)!important;
                justify-self: center!important;
                align-self: center!important;
                        }
                        button {
                            border: none;
                            outline: 0;
                            font-size: inherit;
                            font-family: inherit;
                            color: inherit;
                            text-align: inherit;
                        }
                        
            .inputFile,
            #Preview,
            #Preview li{
                float:left
            }
            .inputFile{
                margin-bottom: 10px;
            }
            .addImgBtn{
                width: 80px !important;
                height: 80px !important;
                line-height: 71px !important;
                background-color: #fff !important;
                color: #b7b7b7 !important;
                border: 2px solid #b7b7b7;
                font-size: 35px !important;
                padding: 0 !important;
            }

            #Preview{
                margin-left: 20px;
                width: 650px;
            }
            #Preview li{
                margin-left: 10px;
                margin-bottom: 10px;
                position: relative;
                border: 1px solid #ececec;
                cursor:move
            }
            .delBtn{
                position: absolute;
                top: 0;
                right: 0;
                font-size: 13px;
                background-color: #000;
                color: #fff;
                width: 18px;
                height: 18px;
                line-height: 16px;
                display: inline-block;
                text-align: center;
                cursor: pointer;
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

        <section class="container mt-5">
	
            <h1 class="a mb-5 text-center">Add Page</h1>
            
    
            <!-- Kakao Map -->
    
            <div class="postArea">
                <style>
                    .postArea {
                        display: flex;
                        gap: 40px;
                    }
                    @media screen and (min-width:1201px) {
                        .postArea > * {
                            width: 50%;
                        }
                        
                    }
                    #map {
                        width: 100%;
                        padding-bottom: 100%;
                    }
                    @media screen and (max-width:1200px) {
                        .postArea {flex-direction: column;}
                    }
                </style>
                <div>
                    <!-- 검색 -->
                    <div class="input-group mb-3" style="gap:10px;">
                        <input type="text" id="adrs" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
                        <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn btn2" style="flex: none; height: 40px; width: 70px !important;padding: 0; line-height:1;" type="button" id="btn2 button-addon2" >검색</button>
                    </div>
            
                    <!-- 지도 -->
                    <div id="map" class="mt-3"></div>
                    <div class="hidden" id="clickLatlng"></div>
                    <p id="result"></p>
                </div>
            
                <div>
                    <form action="./add" method="post" id="addFrm" enctype="multipart/form-data">
                        
                        <!-- 작성자 (숨김) -->
                        <input type="hidden" name="id" value="${sessionScope.member.id}">

                        <!-- url (숨김) -->
                        <input type="hidden" id="url" value=${sessionScope.member.url}>
                        
                        <!-- 여행날짜 -->
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1">여행날짜</span>
                            <label for="tripDate" class="form-label"></label>
                            <input type="date" name="tripDate" class="form-control" id="tripDate" placeholder="연도 / 월 / 일">
                        </div>
                        
                        <!-- 위도/경도 (숨김) -->
                        <input type="hidden" name="lat" id="lat">
                        <input type="hidden" name="lng" id="lng">
            
                        <!-- 제목 -->
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1">제목</span>
                            <input type="text" name="title" id="title" class="form-control" placeholder="제목을 입력해주세요.">
                        </div>
            
                        <!-- 내용 -->
                        <div class="input-group mb-3">
                            <textarea class="form-control" name="contents" id="contents" aria-label="With textarea" rows="10"></textarea>
                        </div>
                        
                    <!-- publics -->
                    <div class="btn-group mb-3" role="group" aria-label="Basic radio toggle button group" style="display: flex;justify-content: center;">
                        <input type="radio" value="0" class="btn-check publics" name="publics" id="publics0" autocomplete="off">
                        <label class="btn btn-outline-primary" for="publics0">전체공개</label>
                    
                        <input type="radio" value="1" class="btn-check publics" name="publics" id="publics1" autocomplete="off">
                        <label class="btn btn-outline-primary" for="publics1">팔로워만</label>
                    
                        <input type="radio" value="2" class="btn-check publics" name="publics" id="publics2" autocomplete="off">
                        <label class="btn btn-outline-primary" for="publics2">비공개</label>
                    </div>
                    
                    <!-- Upload file *************************************** -->
                    <div class="mb-1" style="margin:0 auto; width:fit-content;">
                        <button type="button" class="btn btn-primary" id="add">File 추가</button>
                    </div>
        
                    <!-- 파일첨부 추가되는 영역 -->
                    <div id="fileList" class="my-5">
                        <div class="input-group mb-3">
                            <input type="file" name="photos" class="form-control">
                        </div>
        
                    </div>

                        <div style="display: flex; gap:10px;padding-bottom: 40px; justify-content: center;">
                            <button class="btn btn-primary" type="button" id="addBtn">등록</button>
                            <button class="btn btn-primary" type="button" id="cancle">취소</button>
                        </div>
                    
                    </form>
                </div>
            </div>
          
        </section>


        <script src="/resources/js/feed/feedFile.js"></script>
        <script src="/resources/js/feed/feedAdd.js"></script>
        <script src="/resources/js/feed/feedAddMap.js" defer></script>


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
		<script>

		$(document).on("change", ":file[name=photos]", function() {
			console.log("들어옴");
            // get(0)을 써야 파일 자체를 가져올 수 있음.
            // 안 써주면 파일명만 받아와짐!
			let file = $(this).get(0).files[0];
			let _this = $(this);
			let reader = new FileReader();
			let div = $("<div>", {width:"100%"}).addClass("thumb");
			$(this).prev("div.thumb").remove();
			reader.onload = function(e) {
                //                                                                                        closet : 상위요소 중 가장 첫번째
				div.append($("<img>", {src:e.target.result, width:"100px", height:"100px"})).prependTo($(_this).closest(".input-group"));
			}
			reader.readAsDataURL(file);
		});

		</script>
    </body>
</html>