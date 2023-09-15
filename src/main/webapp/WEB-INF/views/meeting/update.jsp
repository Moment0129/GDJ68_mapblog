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
    <link
    href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
    rel="stylesheet"
  />
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
        action="./update"
        method="post"
        id="frm"
      >
        <input type="hidden" name="meetingNum" value="${dto.meetingNum }" />
        <input type="hidden" name="id" value="${sessionScope.member.id }" />
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
            value="${dto.title }"
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
            value="${dto.contents }"
          >
          ${dto.contents }</textarea
          >
        </div>
        <div class="input-group mb-3" style="width: 400px">
          <span class="input-group-text">모임날짜</span>
          <input
            type="datetime-local"
            id="meetingDate"
            class="form-control"
            aria-label="Username"
            aria-describedby="basic-addon1"
            value="${dto.meetingDate }"
          />
        </div>
        <input type="hidden" name="meetingDate" id="meetingDate2" />
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
            value="${dto.personnel}"
          />
        <input type="hidden" name="lat" id="lat" value="${dto.lat}" />
        <input type="hidden" name="lng" id="lng" value="${dto.lng}" />
        <div class="input-group mb-3" style="width: 400px; display: none;">
          <span class="input-group-text">모임장소</span>
          <input
            type="hidden"
            name="address"
            id="address"
            class="form-control"
            aria-label="Username"
            aria-describedby="basic-addon1"
            value="${dto.address}"
          />
        </div>

        <button id="updateBtn" class="btn btn-outline-secondary" type="button">
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
    <script>
      /* 
      $("#contents").summernote({
        height: 400,
        callbacks: {
          onImageUpload: function (files) {
            alert("이미지 업로드");
            //이미지를 server로 전송하고
            //응답으로 이미지경로와 파일명을 받아서
            //img 태그를 만들어서 src속성에 이미지경로는 넣는것
            let formData = new FormData(); //<form></form>
            formData.append("files", files[0]); //<input type='file' name='files'>
            $.ajax({
              type: "post",
              url: "setContentsImg",
              data: formData,
              cashe: false,
              enctype: "multipart/form-data",
              contentType: false,
              processData: false,
              success: function (result) {
                $("#contents").summernote("insertImage", result.trim());
              },
              error: function () {
                console.log("error");
              },
            });
          },
          onMediaDelete: function (files) {
            let path = $(files[0]).attr("src"); // /resources/upload/notice/파일명
            $.ajax({
              type: "post",
              url: "./setContentsImgDelete",
              data: {
                path: path,
              },
              success: function (result) {
                console.log(result);
              },
              error: function () {
                console.log("error");
              },
            });
          },
        },
      }); */

      /* $("#contents").summernote("code"); */
      const frm = document.getElementById("frm");
      const btn = document.getElementById("updateBtn");
      const title = document.getElementById("title");
      
      const meetingDate = document.getElementById("meetingDate");
      const meetingDate2 = document.getElementById("meetingDate2");
      let personnelCheckResult = false;
      let meetingDateCheckResult = false;

      var checkResult = [false, false];

      btn.addEventListener("click", function () {
        console.log(title.value == "");
        console.log(title.value.length == 0);
        if (title.value == "") {
          alert("제목은 필수 입니다.");
          title.focus();
        } else {
          let s = meetingDate.value.replace("T", " ");
          meetingDate2.value = s;
          if (document.getElementById("meetingDate").value != "") {
      checkResult[1] = true;
    } else {
      alert("날짜를 입력해 주세요.");
      document.getElementById("meetingDate").focus();
    }
    if (document.getElementById("personnel").value != "") {
      checkResult[0] = true;
      document.getElementById("personnel").focus();
    } else {
      alert("모집인원을 입력해주세요.");
    }
    let c = checkResult.includes(false);
    if (!c) {
      //form전송
      console.log("form전송");
      frm.submit();
    } else {
    }}
      });
    </script>

    <script src="../resources/js/meeting/update.js" defer></script>
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
