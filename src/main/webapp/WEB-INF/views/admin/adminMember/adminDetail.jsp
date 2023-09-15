<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Mapper Admin Main Page</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/admin/sb-admin-2.min.css" rel="stylesheet">
<c:import url="../../temp/bootStrap.jsp"></c:import>

<style>

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

			<h1>adminDetail</h1>
			<!-- <button id="del" data-url="delete" class="btn btn-outline-primary c1"  for="btn-check-outlined" data-delete-name="num" data-delete-num="${dto.num}">삭제</button> -->
			
				<div class="mb-3">
					${adminDTO.adminId}
				</div>	
							
				<div class="mb-3">
					${adminDTO.adminPw}
				</div>
				
				<div class="mb-3">
					${adminDTO.adminName}
				</div>
				
				<div class="mb-3">
					${adminDTO.adminGrade}
				</div>
				
				<div class="mb-3">
					<a id="adminUpdate" href="./adminUpdate?adminId=${adminDTO.adminId}">수정</a>
				</div>
                <div class="mb-3">
					<a id="adminDelete" href="./adminDelete?adminId=${adminDTO.adminId}">삭제</a>
				</div>
                

			

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