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

        <style>
            .place-img {
                width: 100%; padding-bottom: 56.26%; position: relative;
            }
            .place-img img {
                position: absolute; left:0; top:0; object-fit: cover;
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


    <main>

        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="slider-active">
                <div class="single-slider hero-overly  slider-height d-flex align-items-center" data-background="/resources/img/index/hero/h1_hero.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-9 col-lg-9 col-md-9">
                                <div class="hero__caption">
                                    <c:if test="${adminBannerDTO2 ne null}">
                                        <h1>${adminBannerDTO2.mainTitle}</h1>
                                        <p>${adminBannerDTO2.subTitle}</p>
                                    </c:if>
                                    <c:if test="${adminBannerDTO2 eq null}">
                                        <h1>Grand Open Mapper!</h1>
                                        <p>Mapper를 통해 일상을 기록하세요</p>
                                    </c:if>
                                    
                                 </div>
                            </div>
                        </div>
                      
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->
        <!-- Our Services Start -->
        <div class="our-services servic-padding">
            <div class="container">
                <div class="row d-flex justify-contnet-center">
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-tour"></span>
                            </div>
                            <div class="services-cap">
                                <h5>Project Team is<br>Mapper</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-pay"></span>
                            </div>
                            <div class="services-cap">
                                <h5>99% Trusted<br>Mapper</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-experience"></span>
                            </div>
                            <div class="services-cap">
                                <h5>3+ Months of Development Study<br>Experience</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-good"></span>
                            </div>
                            <div class="services-cap">
                                <h5>98% Our Service<br>are Happy</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <!-- Our Services End -->

         
         
                        <!-- 조회수 많은 Places Start -->
                        <div class="favourite-place place-padding" style="border-bottom: solid 1px #eee;">
                            <div class="container">
                                <!-- Section Tittle -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="section-tittle text-center">
                                            <span>Many people see it</span>
                                            <h2>조회수 많은 게시글</h2>
                                        </div>
                                    </div>
                                </div>
                            <div class="row">
                                <!-- 2주 내 작성 조회수 많은 게시글 시작 -->
                                <c:forEach items="${hitRank}" var="hitRank" varStatus="i">
                                <div class="col-xl-4 col-lg-4 col-md-6">
                                    <div class="single-place mb-30">
                                        <div class="place-img">
                                                <img src="/resources/upload/feed/${hitRank.fileName}" alt="${hitRank.fileName}" />
                                        </div>
                                        <div class="place-cap">
                                            <div class="place-cap-top">
                                                <span><i class="fas fa-star"></i><span>조회수 TOP${i.count}</span> </span>
                                                <h3><a href="/feed/detail?feedNum=${hitRank.feedNum}">${hitRank.title}</a></h3>
                                                <p class="dolor">HIT ${hitRank.hit} / LIKE ${hitRank.likes}</p>
                                            </div>
                                            <div class="place-cap-bottom">
                                                <ul>
                                                    <li><i class="far fa-clock"></i>${hitRank.createDate}</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                                <!-- 2주 내 작성 조회수 많은 게시글 끝 -->
                            </div>
                        </div>
                    </div>


                    <!-- 2주 내 작성 좋아요 많은 Places Start -->
                    <div class="favourite-place place-padding" style="border-bottom: solid 1px #eee;">
                        <div class="container">
                            <!-- Section Tittle -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="section-tittle text-center">
                                        <span>Many people like it</span>
                                        <h2>좋아요 많은 게시글</h2>
                                    </div>
                                </div>
                            </div>
                        <div class="row">
                    <!-- 2주 내 작성 좋아요 많은 게시글 -->
                    <c:forEach items="${likesRank}" var="likesRank" varStatus="i">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                    <img src="/resources/upload/feed/${likesRank.fileName}" alt="${likesRank.fileName}" />
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>좋아요 TOP${i.count}</span> </span>
                                    <h3><a href="/feed/detail?feedNum=${likesRank.feedNum}">${likesRank.title}</a></h3>
                                    <p class="dolor">HIT ${likesRank.hit} / LIKE ${likesRank.likes}</p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>${likesRank.createDate}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <!-- 2주 내 작성 좋아요 많은 게시글 끝 -->
                        </div>
                    </div>
                </div>


                <!-- 최근 글 top6 Places Start -->
                <div class="favourite-place place-padding" style="border-bottom: solid 1px #eee;">
                    <div class="container">
                        <!-- Section Tittle -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section-tittle text-center">
                                    <span>Latest best feed</span>
                                    <h2>가장 인기있는 최근 피드</h2>
                                </div>
                            </div>
                        </div>
                    <div class="row">
                    <!-- 최근 글 top6 -->
                    <c:forEach items="${newRank}" var="newRank" varStatus="i">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                    <img src="/resources/upload/feed/${newRank.fileName}" alt="${newRank.fileName}" />
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>NEW FEED TOP${i.count}</span> </span>
                                    <h3><a href="/feed/detail?feedNum=${newRank.feedNum}">${newRank.title}</a></h3>
                                    <p class="dolor">HIT ${newRank.hit} / LIKE ${newRank.likes}</p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>${newRank.createDate}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <!-- 최근 글 top6 끝 -->
                    </div>
                </div>
            </div>

                <!-- 인플루언서 TOP 3 (조회수 기준) Places Start -->
                <div class="favourite-place place-padding" style="border-bottom: solid 1px #eee;">
                    <div class="container">
                        <!-- Section Tittle -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section-tittle text-center">
                                    <span>Most hit influencer</span>
                                    <h2>가장 많이 본 인플루언서</h2>
                                </div>
                            </div>
                        </div>
                    <div class="row">
                    <!-- 인플루언서 TOP 3 (조회수 기준) -->
                    <c:forEach items="${hitMember}" var="hitMember" varStatus="i">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>가장 많이 본 인플루언서 TOP${i.count}</span> </span>
                                    <h3><a href="/feed/list/${hitMember.url}">${hitMember.nickName}</a></h3>
                                    <p class="dolor">HIT ${hitMember.hit} / LIKE ${hitMember.likes}</p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>${hitMember.createDate}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <!-- 인플루언서 TOP 3 (조회수 기준) 끝 -->
                        </div>
                    </div>
                </div>

                <!-- 인플루언서 TOP 3 (좋아요 수 기준) Places Start -->
                <div class="favourite-place place-padding">
                    <div class="container">
                        <!-- Section Tittle -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section-tittle text-center">
                                    <span>Most like influencer</span>
                                    <h2>가장 좋아하는 인플루언서</h2>
                                </div>
                            </div>
                        </div>
                    <div class="row">
                    <!-- 인플루언서 TOP 3 (좋아요 수 기준) -->
                    <c:forEach items="${likesMember}" var="likesMember" varStatus="i">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>가장 좋아하는 인플루언서 TOP${i.count}</span> </span>
                                    <h3><a href="/feed/list/${likesMember.url}">${likesMember.nickName}</a></h3>
                                    <p class="dolor">HIT ${likesMember.hit} / LIKE ${likesMember.likes}</p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>${likesMember.createDate}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <!-- 인플루언서 TOP 3 (좋아요 수 기준) 끝 -->
                    </div>
                </div>
            </div>

        <!-- Favourite Places End -->
        <!-- Video Start Arera -->
        <div class="video-area video-bg pt-200 pb-200"  data-background="/resources/img/index/service/video-bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="video-caption text-center">
                            <div class="video-icon">
                                <a class="popup-video" href="https://www.youtube.com/watch?v=1aP-TXUpNoU" tabindex="0"><i class="fas fa-play"></i></a>
                            </div>
                            <p class="pera1">Love where you're going in the perfect time</p>
                            <p class="pera2">Tripo is a World Leading Online</p>
                            <p class="pera3"> Tour Booking Platform</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Video Start End -->
        <!-- Support Company Start-->
        <div class="support-company-area support-padding fix">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-lg-6">
                        <div class="support-location-img mb-50">
                            <img src="/resources/img/index/service/support-img.jpg" alt="">
                            <div class="support-img-cap">
                                <span>Since 1992</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <div class="right-caption">
                            <!-- Section Tittle -->
                            <div class="section-tittle section-tittle2">
                                <span>About Our Company</span>
                                <h2>We are Go Trip <br>Ravels Support Company</h2>
                            </div>
                            <div class="support-caption">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud</p>
                                <div class="select-suport-items">
                                    <label class="single-items">Lorem ipsum dolor sit amet
                                        <input type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="single-items">Consectetur adipisicing sed do
                                        <input type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="single-items">Eiusmod tempor incididunt
                                        <input type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="single-items">Ad minim veniam, quis nostrud.
                                        <input type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <a href="#" class="btn border-btn">About us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Support Company End-->
        <!-- Testimonial Start -->
        <!-- Testimonial Start -->
        <div class="testimonial-area testimonial-padding" data-background="/resources/img/index/testmonial/testimonial_bg.jpg">
            <div class="container ">
                <div class="row d-flex justify-content-center">
                    <div class="col-xl-11 col-lg-11 col-md-9">
                        <div class="h1-testimonial-active">
                            <!-- Single Testimonial -->
                            <div class="single-testimonial text-center">
                                <!-- Testimonial Content -->
                                <div class="testimonial-caption ">
                                    <div class="testimonial-top-cap">
                                        <img src="/resources/img/index/icon/testimonial.png" alt="">
                                        <p>Logisti Group is a representative logistics operator providing full range of ser
                                            of customs clearance and transportation worl.</p>
                                    </div>
                                    <!-- founder -->
                                    <div class="testimonial-founder d-flex align-items-center justify-content-center">
                                        <div class="founder-img">
                                            <img src="/resources/img/index/testmonial/Homepage_testi.png" alt="">
                                        </div>
                                        <div class="founder-text">
                                            <span>Jessya Inn</span>
                                            <p>Co Founder</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Single Testimonial -->
                            <div class="single-testimonial text-center">
                                <!-- Testimonial Content -->
                                <div class="testimonial-caption ">
                                    <div class="testimonial-top-cap">
                                        <img src="/resources/img/index/icon/testimonial.png" alt="">
                                        <p>Logisti Group is a representative logistics operator providing full range of ser
                                            of customs clearance and transportation worl.</p>
                                    </div>
                                    <!-- founder -->
                                    <div class="testimonial-founder d-flex align-items-center justify-content-center">
                                        <div class="founder-img">
                                            <img src="/resources/img/index/testmonial/Homepage_testi.png" alt="">
                                        </div>
                                        <div class="founder-text">
                                            <span>Jessya Inn</span>
                                            <p>Co Founder</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->
        <!-- Blog Area Start -->
        <div class="home-blog-area section-padding2">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>Our Recent news</span>
                            <h2>Tourist Blog</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="home-blog-single mb-30">
                            <div class="blog-img-cap">
                                <div class="blog-img">
                                    <img src="/resources/img/index/blog/home-blog1.jpg" alt="">
                                </div>
                                <div class="blog-cap">
                                    <p> |   Traveling</p>
                                    <h3><a href="single-blog.html">Tips For Taking A Long-Term Trip With Kids.</a></h3>
                                    <a href="#" class="more-btn">Read more »</a>
                                </div>
                            </div>
                            <div class="blog-date text-center">
                                <span>24</span>
                                <p>Now</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="home-blog-single mb-30">
                            <div class="blog-img-cap">
                                <div class="blog-img">
                                    <img src="/resources/img/index/blog/home-blog2.jpg" alt="">
                                </div>
                                <div class="blog-cap">
                                    <p> |   Traveling</p>
                                    <h3><a href="single-blog.html">Tips For Taking A Long-Term Trip With Kids.</a></h3>
                                    <a href="#" class="more-btn">Read more »</a>
                                </div>
                            </div>
                            <div class="blog-date text-center">
                                <span>24</span>
                                <p>Now</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Blog Area End -->

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