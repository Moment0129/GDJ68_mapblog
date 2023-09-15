
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
                main{
                    height: 1500px;
                }
                #thead{
                    width: 80%;
                    margin: 0 auto;
                    
                }
                .secondTable{
                    
                    width: 80%;
                    height: 600px;
                    margin: 40px auto;
                    border: 1px solid #ccc;
                }
                .tableBoard{
                    
                    width: 80%;
                    height: 600px;
                    margin: 0 auto;
                }
                
                .commentPosition{
                    position: relative;
                    top: 360px;
                    left:0;
                }
                #comment{
                    height: 57px;
                    width: 235px;
                    margin: 0 auto;
                    border-radius: 15px;
                }
                #commentAdd{
                    position: absolute;
                    top: 10px;
                    left: 1088px;
                }
                #upBtn{
                    position: relative;
                    top: 158px;
                    left: 344px
                }
                #delBtn{
                    position: relative;
                    top: 121px;
                    left: 413px;
                }
                #more{
                    margin: 0 auto;
                    width: 80%;
                    text-align: center;
                }
                #commentList {
                    margin: 0 auto;
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
        <c:import url="../temp/bootStrap.jsp"></c:import>
		<c:import url="/WEB-INF/views/temp/header.jsp"></c:import>


        <!-- Header End -->

	<!-- Main start -->
    <main>
        

	

	<div class="tableBoard">
	<table class="table table-striped table-hover" id="thead">
		<thead>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			
			
		</thead>
		<tbody>
				<tr>
					<td data-add-num="${dto.qnaNum}" id="up">${dto.qnaNum}</td>
					<td>${dto.qnaTitle}</td>
					<td>${dto.nickName}</td>
					<td>${dto.qnaDate}</td>
				</tr>
				</tbody>
			</table>
         
            
				<div class="secondTable">

				    <div>${dto.qnaContents}</div>
				    <c:forEach items="${dto.fileDTOs}" var="f">	
						<img src="../resources/upload/qna/${f.fileName}" style="width: 450px; height: 450px;">
					</c:forEach> 
				  
				</div>
            
				 	
		</div>
	
	<c:choose>
    <c:when test="${dto.memberId eq member.id or not empty adminMember}">
        <a href="./update?qnaNum=${dto.qnaNum}" class="btn btn-outline-secondary" id="upBtn">수정</a>
    

        <form action="./delete?qnaNum=${dto.qnaNum}" method="post">
            <button type="submit" class="btn btn-outline-danger" id="delBtn">삭제</button>
        </form>
 
    </c:when>
</c:choose>
	

	<%-- <button id="update" data-url="update" class="c1">수정</button>
	<button id="del" data-url="delete" data-delete-name="num" data-delete-num="${dto.num}" class="c1">삭제</button> --%>


	<div class="commentPosition">
		<c:if test="${not empty member}">
			<div class="mb-3">		
				<input type="text" name="contents" class="form-control" id="comment">
				<button id="commentAdd" class="btn btn-outline-secondary">댓글등록</button>
			</div>
		</c:if>
		<div>
			<table id="commentList" class="table table-success table-striped" style="margin-bottom: 20px">
				
			</table>
			
				<div id="more">
	
				</div>

		</div>
	</div>


    </main>

        <!-- Footer Start-->

		<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>

        <!-- Footer End-->


	<!-- JS here -->
	
		<!-- All JS Custom Plugins Link Here here -->
        <script src="/resources/js/index/vendor/modernizr-3.5.0.min.js"></script>
		<script src="/resources/js/qna/qnaDetail.js"></script>
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