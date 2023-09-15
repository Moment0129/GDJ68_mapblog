<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
       <div class="header-area">
            <div class="main-header ">
                <div class="header-top top-bg d-none d-lg-block">
                   <div class="container">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-8">
                            <div class="header-info-left">
                                <ul>                          
                                    <li>help@mapper.com</li>
                                    <li>구디아카데미</li>
                                    <li>GDJ68 RED CLASS</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-1" style="max-width: none;">
                            <div class="header-info-right f-right">
                                <ul class="header-social" style="display: flex;">
								   	<c:if test="${not empty sessionScope.member}">
								        	<li style="width: 80px"><a href="/member/mypage">마이페이지</a></li>
								        	<li style="width: 70px"><a href="/member/logout">로그아웃</a></li>
								    </c:if>
								    <c:if test="${empty sessionScope.member}">
								        	<li style="width: 70px"><a href="/member/login">로그인</a></li>
								        	<li style="width: 70px"><a href="/member/beforeJoin">회원가입</a></li>
								    </c:if>
								</ul>
                            </div>
                        </div>
                       </div>
                   </div>
                </div>
               <div class="header-bottom  header-sticky">
                    <div class="container">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2 col-md-1">
                            	<div class="logo">
                                  <a href="/"><img src="/resources/img/smallLogo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-10">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>               
                                        <ul id="navigation">
                                        	<li><a href="#">MY CONTENTS</a>
                                                <ul class="submenu">
                                                    <li><a href="/feed/list/${member.url}">FEED</a></li>
                                                    <li><a href="/calendar/myCalendar/">CALENDAR</a></li>
                                                </ul>
                                            </li>                                                                                                                                     
                                            <!-- <li><a href="/">Home</a></li> -->
                                            <li><a href="/meeting/list">Meeting</a></li>
                                            <li><a href="#">Board</a>
                                                <ul class="submenu">
                                                    <li><a href="/notice/list">Notice</a></li>
                                                    <li><a href="/qna/list">Q&A</a></li>
                                                </ul>
                                            </li>
                                            
                                            
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
       
       


</header>
