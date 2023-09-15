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
      main {
        height: 1500px;
      }
      #thead {
        width: 80%;
        margin: 0 auto;
      }
      .secondTable {
        width: 80%;
        height: 600px;
        margin: 40px auto;
        border: 1px solid #ccc;
      }
      .tableBoard {
        width: 80%;
        height: 600px;
        margin: 0 auto;
      }

      .commentPosition {
        position: relative;
        top: 360px;
        left: 0;
      }
      #comment {
        height: 57px;
        width: 235px;
        margin: 0 auto;
        border-radius: 15px;
      }
      #commentAdd {
        position: absolute;
        top: 10px;
        left: 1088px;
      }
      .upBtn {
        margin: 0 auto;
        width: 80%;
        text-align: center;
      }
      #delBtn {
        position: relative;
        top: 121px;
        left: 413px;
      }
      #more {
        margin: 0 auto;
        width: 80%;
        text-align: center;
      }
    </style>

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
    <c:import url="../temp/bootStrap.jsp"></c:import>

    <c:import url="/WEB-INF/views/temp/header.jsp"></c:import>

    <!-- Header End -->

    <!-- Main start -->
    <main>
      <form action="./update" method="post">
        <table class="table table-striped table-hover" id="thead">
          <thead>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
          </thead>
          <tbody>
            <tr>
              <td>
                <input
                  type="hidden"
                  name="qnaNum"
                  value="${dto.qnaNum}"
                />${dto.qnaNum}
              </td>
              <td>
                <input type="text" name="qnaTitle" value="${dto.qnaTitle}" />
              </td>
              <td>${dto.memberId}</td>
            </tr>
          </tbody>
        </table>
        <div>
          <div class="secondTable">
            <textarea
              style="width: 100%; height: 100%"
              name="qnaContents"
              id="contents"
            >
${dto.qnaContents}</textarea
            >
          </div>
        </div>
        <div class="upBtn">
          <button type="submit" class="btn btn-outline-secondary">수정</button>
        </div>
      </form>
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
