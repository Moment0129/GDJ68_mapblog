<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Travel HTML-5 Template</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="manifest" href="site.webmanifest" />
    <link
      rel="shortcut icon"
      type="image/x-icon"
      href="/resources/img/index/favicon.ico"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b5744597ccc65933ecad3607daed47e&libraries=services"
    ></script>
    <link
      href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <!-- CSS here -->
    <link rel="stylesheet" href="/resources/css/index/bootstrap.min.css" />
    <link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css" />
    <link rel="stylesheet" href="/resources/css/index/flaticon.css" />
    <link rel="stylesheet" href="/resources/css/index/slicknav.css" />
    <link rel="stylesheet" href="/resources/css/index/animate.min.css" />
    <link rel="stylesheet" href="/resources/css/index/magnific-popup.css" />
    <link
      rel="stylesheet"
      href="/resources/css/index/fontawesome-all.min.css"
    />
    <link rel="stylesheet" href="/resources/css/index/themify-icons.css" />
    <link rel="stylesheet" href="/resources/css/index/slick.css" />
    <link rel="stylesheet" href="/resources/css/index/nice-select.css" />
    <link rel="stylesheet" href="/resources/css/index/style.css" />
    <style>
      footer {
        float: left;
        width: 100%;
      }
      main {
        height: 1500px;
      }
      #position {
        margin-right: 30px;
        float: right;
        width: 250px;
      }
      form > div {
        margin: 10px 0;
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
            <img src="/resources/img/찐막.png" alt="" />
          </div>
        </div>
      </div>
    </div>
    <!-- Preloader Start -->

    <!-- Header Start -->

    <c:import url="/WEB-INF/views/temp/header.jsp"></c:import>
    <c:import url="../temp/bootStrap.jsp"></c:import>
    <!-- Header End -->

    <!-- Main start -->
    <main>
      <div class="input-group mb-3" id="position">
        <input
          type="text"
          class="form-control"
          placeholder="주소를 입력하세요"
          aria-label="Recipient's username"
          aria-describedby="button-addon2"
          id="adrs"
        /><button id="btn2" type="button" class="btn btn-outline-secondary">
          검색
        </button>
      </div>
      <div id="map" style="width: 100%; height: 800px"></div>
      <div id="clickLatlng"></div>
      <p id="result"></p>

      <form
        class="mb-5 text-center form-control"
        action="./add"
        method="post"
        id="frm"
        style="border: 0px"
      >
        <input type="hidden" name="id" value="${sessionScope.member.id }" />
        <input
          type="hidden"
          name="nickName"
          value="${sessionScope.member.nickName }"
        />
        <div class="input-group mb-3">
          <span class="input-group-text" id="basic-addon1">제목</span>
          <input
            type="text"
            name="title"
            id="title"
            class="form-control"
            placeholder="제목을 입력하세요"
            aria-label="Username"
            aria-describedby="basic-addon1"
          />
        </div>
        <div class="input-group">
          <span class="input-group-text">내용</span>
          <textarea
            class="form-control"
            aria-label="With textarea"
            name="contents"
            id="contents"
            cols="30"
            rows="10"
          ></textarea>
        </div>
        <div class="input-group mb-3" style="width: 400px">
          <span class="input-group-text">모임날짜</span>
          <input
            type="datetime-local"
            id="meetingDate"
            class="form-control"
            aria-label="Username"
            aria-describedby="basic-addon1"
          />
        </div>
        <div class="input-group mb-3" style="width: 400px">
          <span class="input-group-text">정원</span>
          <input
            type="number"
            id="personnel"
            min="2"
            max="10"
            name="personnel"
            class="form-control"
            aria-label="Username"
            aria-describedby="basic-addon1"
          />
        </div>
        <input type="hidden" name="meetingDate" id="meetingDate2" />
        <input type="hidden" name="lat" id="lat" />
        <input type="hidden" name="lng" id="lng" />
        <div class="input-group mb-3" style="width: 400px">
          <span class="input-group-text">모임장소</span>
          <input
            type="hidden"
            name="address"
            id="address"
            class="form-control"
            aria-label="Username"
            aria-describedby="basic-addon1"
          />
        </div>
        <button id="btn" class="btn btn-outline-secondary" type="button">
          등록
        </button>
      </form>
    </main>

    <!-- Footer Start-->

    <c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>

    <!-- Footer End-->

    <!-- JS here -->

    <!-- All JS Custom Plugins Link Here here -->
    <script src="/resources/js/index/vendor/modernizr-3.5.0.min.js"></script>

    <script src="../resources/js/meeting/addTest.js" defer></script>
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
