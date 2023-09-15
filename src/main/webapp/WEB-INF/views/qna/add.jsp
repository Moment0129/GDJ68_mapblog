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
    <style>
      .sel {
        position: relative;
        left: 813px;
        top: -62px;
      }
      main {
        text-align: center;
        height: 1200px;
      }
      .frm > div {
        margin: 0 auto;
      }
      #nick {
        height: 41px;
        border-radius: 6px;
        /* border-left: none; */
        margin-top: 8px;
      }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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

    <!-- Header End -->

    <!-- Main start -->
    <main>
      <h1>add Page</h1><form
        action="./add"
        method="post"
        enctype="multipart/form-data"
        class="frm"
      >
        <div class="input-group mb-3" style="width: 845px">
          <span class="input-group-text" id="basic-addon2">제목</span
          ><input
            type="text"
            name="qnaTitle"
            class="form-control"
            placeholder="제목을 입력하세요"
            aria-label="Username"
            aria-describedby="basic-addon1"
          />
        </div>

        <div class="input-group">
          <span
            class="input-group-text"
            id="basic-addon2"
            style="margin-left: 516.759px"
            >내용</span
          ><textarea
            class="form-control"
            aria-label="With textarea"
            rows=""
            cols=""
            name="qnaContents"
            id="contents"
            style="width: 100%"
          ></textarea>
        </div>

        <div class="input-group mb-3" style="margin-top: 15px">
          <input type="hidden" name="memberId" value="${member.id}" />
          <span
            class="input-group-text"
            id="basic-addon1"
            style="margin: 10px 0 5px 516.759px"
            >작성자</span
          >
          <input
            readonly
            type="text"
            name="nickName"
            value="${member.nickName}"
            id="nick"
          />
        </div>
        <div>
          <select name="privateContents" class="sel">
            <option value="0">비밀글</option>
            <option value="1" selected>공개글</option>
          </select>
        </div>
        <div>
          <button type="button" class="my btn btn-danger" id="fileBtn">
            File추가
          </button>
        </div>
        <div id="fileList" class="my-5"></div>

        <p>
          <!-- 	<select name="bookSale">
			<option value="1">판매가능</option>
			<option value="0" selected>판매중지</option>
		</select> -->
        </p>

        <button type="submit" class="btn btn-outline-secondary">등록</button>
      </form>
    </main>

    <!-- Footer Start-->

    <c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>

    <!-- Footer End-->

    <!-- JS here -->

    <!-- All JS Custom Plugins Link Here here -->
    <script src="/resources/js/index/vendor/modernizr-3.5.0.min.js"></script>
    <script src="/resources/js/temp/fileAdd.js"></script>
    <script>
      $("#contents").summernote({
        height: 400,
        callbacks: {
          onImageUpload: function (files) {
            alert("이미지 업로드");
            // 이미지를 서버로 전송하고 응답으로 이미지 경로와 파일명을 받아서 img 태그를 만들어서 src 속성에 이미지 경로를 넣는 코드

            let formData = new FormData();
            formData.append("files", files[0]);
            $.ajax({
              type: "post",
              url: "setContentsImg",
              data: formData,
              cache: false,
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
      });
    </script>
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
