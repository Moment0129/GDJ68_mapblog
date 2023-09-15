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
    
    		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<style>
			* {
			font-family: 'Gothic A1', sans-serif;
			}
			#table {
				position: relative; left: 15%; 
			}
			.inf {
				position: relative; left: 28.5%;
			}
			.buttons{
				display: block;
				text-align: center;
			}
			.f6{
				display: block;
				text-align: center;
			}
			.f3{
				display: block;
				text-align: center; 
			}
			#tableForPic{
				position: relative; left: 5.5%;
			}
			#fr2{
				display: block;
				text-align: center;
			}
			.pwPosition{
				position: relative;
				right: -800px;
				top: -824px;
			}
			.pwPosition2{
				position: relative;
				top: 0;
				right: 0;
			}
			#dm{
				position: relative;
				top: -84px;
				right: -191px;
			}
			#pw1{
				position: relative;
				top: -6px;
				right: -15px;
			}
		</style>
		
		<meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="/resources/img/index/favicon.ico">
		<link rel="stylesheet" href="/resources/css/member/join.css" type="text/css" />
    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/admin/sb-admin-2.min.css" rel="stylesheet">
<c:import url="../../temp/bootStrap.jsp"></c:import>

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
	<main>



			<h3 style="margin-bottom: 45px; text-align: center; margin-top: 50px;">${requestScope.dto.id} 님의 상세정보</h3>


	
		<div class='outer-div'>
			<div class='inner-div'>


				<h5 class="inf">ID</h5>
				<input style="text-align: center;" type="text" class="td" value="${requestScope.dto.id}" name="id" id="id" readonly><br><br>
				<h5 class="inf">NAME</h5>
				<input style="text-align: center;" type="text" name="name" class="td" value="${requestScope.dto.name}" id="name" readonly><br><br>
				<h5 class="inf">NICKNAME</h5>
				<input style="text-align: center;" type="text" name="nickName" class="td" value="${requestScope.dto.nickName}" id="nickName" readonly><br><br>
				<h5 class="inf">E-MAIL</h5>
				<input style="text-align: center;" type="text" name="email" class="td" value="${requestScope.dto.email}" id="email" readonly><br><br>
				<h5 class="inf">PHONE#</h5>
				<input style="text-align: center;" type="text" class="td" name="phone" value="${requestScope.dto.phone}" id="phone" readonly><br><br>
				<h5 class="inf">BIRTHDAY</h5>
				<input style="text-align: center;" type="text" class="td" id="birth" name="birth" value="${requestScope.dto.birth}" readonly><br><br>
				<h5 class="inf">PERSONAL URL</h5>
				<input style="text-align: center;" type="text" class="td" id="url" name="url" value="http://localhost:82/feed/list/${requestScope.dto.url}" readonly><br><br>
				<h5 class="inf">PUBLICS</h5>
			<c:if test="${requestScope.dto.publics eq 1}">
				<input style="text-align: center;" type="text" class="td" id="publics" name="publics" value="공개 계정" readonly><br><br>
		   </c:if>
			<c:if test="${requestScope.dto.publics eq 0}">
				<input style="text-align: center;" type="text" class="td" id="publics" name="publics" value="비공개 계정" readonly><br><br>
		   </c:if><br><br>
		   <div class="pwPosition">
			<div class="pwPosition2"> 
			<a href="/admin/adminUser/userUpdate?id=${requestScope.dto.id}"  class="btn btn-outline-secondary" id="pw1">비밀번호초기화</a>
			<p>초기비밀번호 : a123456</p>
			</div>
			<a href="/admin/adminUser/userDelete?id=${requestScope.dto.id} " id="dm" class="btn btn-outline-danger">회원탈퇴</a>
			</div>	
			<table border="0" id="tableForPic">
				<tr>
					<td width="900" height="600">
						<div style="display: block; margin-left: auto; margin-right:auto;" class="picture">
							<c:if test="${not empty sessionScope.memberFile}">
								<img style="display: block; margin-left: auto; margin-right:auto;" alt="" src="../resources/upload/member/${memberFile.fileName}">
							</c:if>
							<c:if test="${empty sessionScope.memberFile}">
								<img style="display: block; margin-left: auto; margin-right:auto;" alt="" src="../resources/img/기본프사.png">
							</c:if>
						</div>
					</td>
				</tr>
			</table>

			</div>
			</div>
			<br>
		

			</div>
		</div>

    </main>

			
			

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
    
    <!-- <script>
			const dm = document.getElementById("dm")
			const ic = document.getElementById("ic")
			const ic2 = document.getElementById("ic2")
			const fr2 = document.getElementById("fr2")
			const fr3 = document.getElementById("fr3")
			const fr4 = document.getElementById("fr4")
			const fr6 = document.getElementById("fr6")
			const searchMember = document.getElementById("searchMember")
	
			dm.addEventListener('click', function(){
				if (confirm("회원 탈퇴하시겠습니까?")) {
					fr2.submit();
				}
			})
	
			ic.addEventListener('click', function(){
				fr3.submit();
			})

			ic2.addEventListener('click', function(){
				fr6.submit();
			}) -->
	
			<!-- // searchMember.addEventListener('click', function(){
			// 	fr4.submit();
			// }) -->
		<!-- </script> -->

</body>

</html>



	
