<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Mapper Admin Main Page</title>

    <!-- Custom fonts for this template-->
    <link
      href="/resources/vendor/fontawesome-free/css/all.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"
    />

    <!-- Custom styles for this template-->
    <link href="/resources/css/admin/sb-admin-2.min.css" rel="stylesheet" />
    <c:import url="../../temp/bootStrap.jsp"></c:import>

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
  </head>
  <body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
      <!-- sidebar 불러오기 -->
      <c:import url="/WEB-INF/views/admin/adminTemp/sidebar.jsp"></c:import>

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->

        <!-- Topbar -->
        <nav>
          <c:import url="../../temp/adminHeader.jsp"></c:import>
        </nav>
        <!-- End of Topbar -->

        <!-- 페이지별 내용 -->
        <form action="/admin/adminNotice/update" method="post">
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
                    name="noticeNum"
                    value="${dto.noticeNum }"
                  />${dto.noticeNum}
                </td>
                <td>
                  <input type="text" name="subject" value="${dto.subject}" />
                </td>
                <td>${dto.adminId}</td>
              </tr>
            </tbody>
          </table>
          <table class="table table-dark table-hover">
            
            <div class="secondTable">
                <textarea
              style="width: 100%; height: 100%"
              name="contents"
              id="contents"
            >
${dto.contents}</textarea
                >
            </div>
            <div class="upBtn">
                <button type="submit" class="btn btn-outline-secondary">수정</button>
              </div>
        </form>

        <!-- 페이지별 내용 끝 -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>Copyright &copy; GDJ68 Mapper 2023</span>
            </div>
          </div>
        </footer>
        <!-- End of Footer -->
      </div>
      <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/admin/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/js/admin/demo/chart-area-demo.js"></script>
    <script src="/resources/js/admin/demo/chart-pie-demo.js"></script>
  </body>
</html>
