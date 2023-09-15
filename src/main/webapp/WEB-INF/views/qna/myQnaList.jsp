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
        width: 80%;
        margin: 100px auto;
      }
      .pagination {
        width: 18%;
        margin: 0 auto;
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

    <!-- Header End -->

    <!-- Main start -->
    <main>
      <table class="table table-striped" id="tableSize">
        <thead>
          <th>번호</th>
          <th>제목</th>
          <th>일자</th>
        </thead>
        <tbody>
          <c:forEach items="${list}" var="q">
            <tr>
              <td>${q.qnaNum}</td>

              <td>
                <a href="../qna/detail?qnaNum=${q.qnaNum}">${q.qnaTitle}</a>
              </td>

              <td>${q.qnaDate}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item ${pager.pre?'':'disabled'}">
            <a
              class="page-link"
              href="../qna/myQnaList?page=${pager.page-1}"
              aria-label="Previous"
            >
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>

          <c:forEach begin="${pager.startNum }" end="${pager.lastNum}" var="i">
            <li class="page-item">
              <a class="page-link" href="#" data-num="${i}">${i}</a>
            </li>
          </c:forEach>

          <li class="page-item ${pager.next?'':'disabled'}">
            <a
              class="page-link"
              href="#"
              data-num="${pager.page+1}"
              aria-label="Next"
            >
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>
      <%--
      <nav>
        <c:if test="${not empty member}">
          <a class="btn btn-outline-secondary" href="./add">공지추가</a>
        </c:if>
      </nav>
      --%>
    </main>

    <!-- Footer Start-->

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
