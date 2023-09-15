<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  .nav > li > a {
    text-decoration: none;
    color: black;
  }
</style>
<header>
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="">
        <img
          alt="Bootstrap"
          width="100"
          height="60"
          src="/resources/img/logo3-1.png"
        />
      </a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <ul class="nav">
            <c:if test="${not empty adminMember}">
              <li>
                <p>
                  ${adminMember.adminGrade} ${adminMember.adminName}님
                  환영합니다.
                </p>
              </li>
            </c:if>
          </ul>
        </ul>

        <nav>
          <ul class="nav">
            <c:if test="${not empty adminMember}">
              <li class="nav-item text-white me-3">
                <a href="/admin/member/adminLogout">로그아웃</a>
              </li>
              <li class="nav-item text-white me-3">
                <a href="/admin/member/adminMyPage">내정보</a>
              </li>
            </c:if>
          </ul>
        </nav>
      </div>
    </div>
  </nav>
</header>
