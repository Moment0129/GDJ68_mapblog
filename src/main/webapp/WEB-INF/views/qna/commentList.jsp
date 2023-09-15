<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <style>
	.float{
		background-color: white !important;
	}
	#dleD {
		content: '';
		display: block;
		clear: both;
		text-align: center;
		background-color: #ccc !important;
	}
	.commentListPosition{
		text-align: center;
	    margin: 0 auto;
	    width: 100%;
		background-color: white !important;
	}
	.commentListPosition > li {
		display: inline-block;
	}
	.commentPostion > div {
		margin: 0 15px;
	}

</style>
<c:import url="../temp/bootStrap.jsp"></c:import>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<c:forEach items="${comment}" var="com" varStatus="i">
	<c:choose>
		<c:when test="${i.first}">
			<div class="delD" id="totalPage" data-totalPage="${pager.totalPage}">
		</c:when>
		<c:otherwise>
			<div class="dleD">
		</c:otherwise>
		
		
	</c:choose>
	
		<%-- <div  style="width: 50px; height: 50px"><img class="float" style="width: 100%; height: 100%" alt="" src="../resources/upload/member/${memberFile.fileName}"></div> --%>
		<ul class="commentListPosition">
		<li class="float">${com.nickName}</li>
		<li class="float" id="updateDiv">${com.contents}</li>
		<li class="float">${com.commentDate}</li>
		
		<c:if test="${com.id eq member.id}">
		<li class="float">
		<button class="updateBtn btn btn-outline-secondary" data-commentnum="${com.commentNum}">수정</button>
		<button data-num-del="${com.commentNum}" id="del" class="btn btn-outline-danger">삭제</button>
	</li>


   		
		</c:if>
	</ul>
		
		
	</tr>

</div>
</c:forEach>





