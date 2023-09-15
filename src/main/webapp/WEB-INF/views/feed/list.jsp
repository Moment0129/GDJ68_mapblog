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
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d19d0bc22748e1c8a814e507a6e96ed2&libraries=services"></script>


        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- <link rel="manifest" href="site.webmanifest"> -->
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
            .overlaybox {position:relative;width:360px;height:350px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png') no-repeat;padding:15px 10px;}
            .overlaybox div, ul {overflow:hidden;margin:0;padding:0;}
            .overlaybox li {list-style: none;}
            .overlaybox .boxtitle {color:#fff;font-size:16px;font-weight:bold;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png') no-repeat right 120px center;margin-bottom:8px;}
            .overlaybox .first {position:relative;width:247px;height:136px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumb.png') no-repeat;margin-bottom:8px;}
            .first .text {color:#fff;font-weight:bold;}
            .first .triangle {position:absolute;width:48px;height:48px;top:0;left:0;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/triangle.png') no-repeat; padding:6px;font-size:18px;}
            .first .movietitle {position:absolute;width:100%;bottom:0;background:rgba(0,0,0,0.4);padding:7px 15px;font-size:14px;}
            .overlaybox ul {width:247px;}
            .overlaybox li {position:relative;margin-bottom:2px;background:#2b2d36;padding:5px 10px;color:#aaabaf;line-height: 1;}
            .overlaybox li span {display:inline-block;}
            .overlaybox li .number {font-size:16px;font-weight:bold;}
            .overlaybox li .title {font-size:13px;}
            .overlaybox ul .arrow {position:absolute;margin-top:8px;right:25px;width:5px;height:3px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/updown.png') no-repeat;} 
            .overlaybox li .up {background-position:0 -40px;}
            .overlaybox li .down {background-position:0 -60px;}
            .overlaybox li .count {position:absolute;margin-top:5px;right:15px;font-size:10px;}
            .overlaybox li:hover {color:#fff;background:#d24545;}
            .overlaybox li:hover .up {background-position:0 0px;}
            .overlaybox li:hover .down {background-position:0 -20px;}
            .row-cols-md-3>*{width: 50%;margin:0;}
            #container{
            	text-align: right;
            	display: flex;
            	justify-content: flex-end;
            }
            .dotolContainer {
                padding: 20px;

            }
            @media screen and (orientation:portrait) {
            .dotolContainer article {
                flex-direction: column;
            }
            .dotolContainer article > * {
                max-width: 100%;
            }
            }
            .mapArea{
                padding: 10px;
                box-shadow: .2em .2em .4em rgba(0,0,0,0.15);
                border: solid 1px #e5e6e9;
                background-color: #fff;
                height: fit-content;
            }

            .genric-btn.info {
                color: #fff;
                background: #38a4ff;
                border: 1px solid transparent
            }

            .genric-btn.info:hover {
                color: #38a4ff;
                border: 1px solid #38a4ff;
                background: #fff
            }

        </style>
   </head>

   <body>
        <script>




        let clickCount = 0; 
        /* function addFollow(){
            $.ajax({
                url: '/feed/list',
                type: 'get',
                data: {
                    nowUrl: location.href
                }
                
            })
        } */
        
        function addFollow(){
            $.ajax({
                url: '/feed/follow/add',
                type: 'post',
                data: {
                    nowUrl: location.href
                }, 
                success: function(){
                    alert("팔로우 추가 성공")
                    location.reload();
                    
                }
            })
        }
        
        function deleteFollow(){
            $.ajax({
                url: '/feed/follow/deleteFollow',
                type: 'post',
                data: {
                    nowUrl: location.href
                },
                success: function(){
                    alert("팔로우 취소 성공")
                    location.reload();
                }
            })
        }
        /* document.addEventListener("DOMContentLoaded", function() {
            const followBtn = document.getElementById("actionBtn");
            let isFollowing = getFollowStatusFromCookie();

            followBtn.addEventListener('click',function(){
                if(isFollowing){
                    deleteFollow();
                    
                }
                else{
                    addFollow();
                    
                }
                toggleFollowBtn();
                saveFollowStatusToCookie(isFollowing);
            })
            function toggleFollowBtn() {
                isFollowing = !isFollowing;
                followBtn.textContent = isFollowing ? "팔로우" : "언팔로우";
            }

            toggleFollowBtn();
            
        }); */

        function getFollowStatusFromCookie() {
        // 쿠키에서 팔로우 상태를 가져오는 코드를 작성
        const cookies = document.cookie.split('; ');
        for (const cookie of cookies) {
            const [name, value] = cookie.split('=');
            if (name === 'followStatus') {
                return value === 'true'; // 팔로우 상태가 'true'면 true, 그렇지 않으면 false 반환
            }
        }
        return false; // 쿠키에 팔로우 상태가 없을 경우 기본값으로 false 반환
    }

    function saveFollowStatusToCookie(isFollowing) {
        // 팔로우 상태를 쿠키에 저장하는 코드를 작성
        const expirationDate = new Date(Date.now() + 365 * 24 * 60 * 60 * 1000); // 쿠키 만료일을 1년 후로 설정
        document.cookie = `followStatus=${isFollowing}; expires=${expirationDate.toUTCString()}; path=/`;
    }
    </script>
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
                <div>
                    <!-- <h1 class="a  text-center">Feed List</h1> -->
            
                   
                </div>
            
                <%--
                <c:forEach items="${member}" var="m">
                <div>${m.nickName}</div>
                </c:forEach>
                --%>
        
        <div class="container" id="container">
             <div id="followList"></div> 
            <c:choose>
                <c:when test="${member.url eq follow.toUser}"></c:when>
                <c:otherwise>
                    <c:if test="${followStatus < 1}">
                    <button type="button " onclick="addFollow()">팔로우</button>
                    </c:if>
                    <c:if test="${followStatus > 0}">
                    <button type="button" onclick="deleteFollow()">삭제</button>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </div>
    
        <!-- div.container start -->
        <div class="dotolContainer">
        <div class="conatiner">
            <input type="hidden" id="page" value="${pager.page}" />
            <!-- div.row g-2 start -->
            <article class="container row g-2" style="gap: 20px;
            flex-wrap: nowrap;margin: 0 auto;">
                <!-- kakao map -->
                <div class="container col-md-6 mapArea">
                    <h4 class="hidden">리스트 영역</h4>
                    <div style="display: flex; margin-bottom: 20px;align-items: center; gap:10px;">
                        <input type="text" id="adrs" style="width: 100%; border: none;border: 1px solid #000; height: 40px;" />
                        <button id="btn2" class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" type="button" style="flex: none; height: 40px; width: 70px !important;padding: 0; line-height:1;">검색</button>
                    </div>
                    <div id="map" style="width:100%;height:0;padding-bottom: 100%;"></div>
                        <c:forEach items="${list}" var="d" varStatus="i">
                            <div class="a" data-feedNum="${d.feedNum}" data-contents="${d.contents}" data-title="${d.title}" data-lat="${d.lat}" data-lng="${d.lng}" id="${i.index}"></div>
                        </c:forEach>
    
                        <div id="address"></div>
                        <c:if test="${not empty member}">
                            <div style="display: flex;justify-content: flex-end;padding-top: 20px;">
                                <a class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" href="../add">글쓰기</a>
                            </div>
                        </c:if>
                    </div>
    
                    <div class="col-md-6" style="padding: 0;margin: 0;;">
                        
                        <ul id="blogContents" class="row row-cols-md-3 g-3" style="width:100%;margin: 0;">
                            <style>
                                
                                .card {padding: 10px; border: 1px solid #e5e6e9; box-shadow: .2em .2em .4em rgba(0,0,0,0.15);}
                                .card-body{padding: 1.25rem 0 0;}
                                .card-body h5{text-overflow: ellipsis; width: 100%;overflow: hidden;white-space: nowrap;}
                                .cardImg{ 
                                    display: block;position: relative;left:0;top:0;
                                    width: 100%;padding-bottom: 70%;
                                    overflow: hidden;
                                }
                                .cardImg img {
                                    position: absolute;
                                    left:0;top:0;
                                    object-fit: cover;
                                    transition: all 0.15s;
                                }     
                                .cardImg:hover img 
                                {
                                    transform: scale(1.05);
                                }                       
                            </style>
                            <c:forEach items="${list}" var="f" varStatus="i">
                            
                            <!-- feedNum hidden처리 -->
                            <input type="hidden" id="feedNum" name="feedNum" value="${f.feedNum}">

                            <!-- 위도/경도 (숨김) -->
                            <input type="hidden" name="lat" id="lat" value="${f.lat}">
                            <input type="hidden" name="lng" id="lng" value="${f.lng}">

                            <!-- tripDate (숨김) -->
                            <input type="hidden" id="tripDate" value="${f.tripDate}">

                                <li>
                                    <figure class="card">
                                        
                                        <a id="detailLink" class="cardImg" href="../detail?feedNum=${f.feedNum}">
                                            <c:if test="${f.thumbnail == null }">
                                                <img  src="/resources/img/99A85F3C5C0DC6AD29.jpeg" width="100%" height="100%" />
                                            </c:if>
                                            <c:if test="${f.thumbnail != null }">
                                                <img  src="/resources/upload/feed/${f.thumbnail}" width="100%" height="100%" />
                                            </c:if>
                                        </a>
                                        <figcaption  class="card-body">
                                            <h5>${f.title}</h5>
                                            <div style="display: flex;justify-content: space-between;">
                                                <small class="text-muted text-start">${f.createDate}</small>
                                                <div style="display: flex;">
                                                    <div style="color: e5e6e9;"> ♡ ${f.likes} </div>
                                                    <!-- <button type="button" id="findMarker" class="showMapbBtn btn-sm btn-outline-secondary justify-content-end">지도보기</button> -->
                                                </div> 
                                            </div>
                                        </figcaption>

                                        <div style="clear:both"></div>
                                    </figure>
                                </li>
                            </c:forEach>
                        </ul>


    
        <!-- 전체 페이지 수 -->
        <input type="hidden" name="totalPage" id="totalPage" value="${pager.totalPage}">
    
        <!-- Pager -->
        <nav class="container" aria-label="Page navigation example">
            <h4 class="hidden">navigation area</h4>
            <ul class="pagination justify-content-center">
                <c:if test="${pager.pre}">
                    <li class="page-item"><a class="page-link" href="/feed/list/${url}?page=${pager.startNum-1}">Previous</a></li>
                </c:if>
                <!-- pager.startNum : ${pager.startNum}, pager.lastNum : ${pager.lastNum} -->
                <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                <li class="page-item move"><a class="page-link" href="/feed/list/${url}?page=${i}&kind=${param.kind}&search=${param.search}">${i}</a></li>
                </c:forEach>
                <c:if test="${pager.next}">
                <li class="page-item move"><a class="page-link" href="/feed/list/${url}?page=${pager.lastNum+1}">Next</a></li>
                </c:if>
            </ul>
        </nav>
        <!-- 검색 Search (수정 후) -->
        <!-- Search Box -->
        <div class="row" style="margin-top: 20px;">
            <div class="col-xl-12">
                <!-- form -->
                <form id="searchform" action="/feed/list/${url}" class="search-box" method="get" style="padding: 0;">
                    <style>
                        form.search-box .search-form a,
                        form.search-box .select-form .nice-select {
                            height: 40px;
                            line-height: 0;
                            display: flex;
                            align-items: center;
                            border: solid 1px 014b85;
                        }
                        form.search-box .search-form a {
                            justify-content: center;
                        }
                        form.search-box .input-form input {
                            height: 40px;
                        }
                    </style>
                    <div class="select-form mb-30">
                        <div class="select-itms">
                            <select name="kind" id="kind">
                                <option value="">전체</option>
                                <option value="title" ${pager.kind eq "title" ? "selected" : "" }>제목</option>
                                <option value="contents" ${pager.kind eq "kind" ? "selected" : "" }>내용</option>
                            </select>
                        </div>
                    </div>
                    <div class="input-form mb-30">
                        <input type="text" name="search" style="border:solid 1px #e8e8e8;;" value="${pager.search}" />
                    </div>
                    <div class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn mb-30" style="width:90px !important;padding: 0;height: 40px; display:flex; justify-content: center;
                    align-items: center;">
                        <a href="#" onclick="$('#searchform').submit();">Search</a>
                    </div>   
                </form>   
            </div>
        </div>
                    </div>
                    
    
    
            </article>
            <!-- div.row g-2 end -->
    
        </div>
        <!-- div.container end -->
    </div>
    
    
    
    
        <!-- 글쓰기 버튼 -->
    
    

        <script src="/resources/js/feed/feedListMap.js" defer></script>
        <script src="/resources/js/feed/feedList.js"></script>


    </main>

        <!-- Footer Start-->

		<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>

        <!-- Footer End-->


	<!-- JS here -->
		
		<!-- All JS Custom Plugins Link Here here -->
        <script src="/resources/js/index/vendor/modernizr-3.5.0.min.js"></script>
		<script src="/resources/js/follow/followList.js"></script>
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