<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="../mainPageCss/owl.carousel.min.css">
<link rel="stylesheet" href="../mainPageCss/magnific-popup.css">
<link rel="stylesheet" href="../mainPageCss/font-awesome.min.css">
<link rel="stylesheet" href="../mainPageCss/themify-icons.css">
<link rel="stylesheet" href="../mainPageCss/nice-select.css">
<link rel="stylesheet" href="../mainPageCss/flaticon.css">
<link rel="stylesheet" href="../mainPageCss/gijgo.css">
<link rel="stylesheet" href="../mainPageCss/animate.css">
<link rel="stylesheet" href="../mainPageCss/slicknav.css">
<link rel="stylesheet" href="../mainPageCss/mainPage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/f73ccf4d61.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../boardCss/noticeListBoard.css">
<script type="text/javascript" src="../js/board.js"></script>
</head>
<body>
	<header>
		<div class="header-area">
			<div id="sticky-header" class="main-header-area">
				<div class="container-fluid p-0">
					<div class="row align-items-center no gutters">
						<div class="col-xl-2 col-lg-2">
							<div class="logo-img">
								<a href="#">
									<img src="" alt>
								</a>
							</div>
						</div>
						<div class="col-xl-7 col-lg-7">
							<div class="main-menu d-done d-lg-block">
								<nav>
									<ul id="navigation">
										<li>
											<a class="active" href="mainPage.do">
												Home
											</a>
										</li>
										<li>
											<a class="active" href="noticeListAction.do">
												Notice
											</a>
										</li>
										<li>
											<a class="active" href="#">
												MyPage
											</a>
										</li>
										<li>
											<a class="active" href="http://localhost:8088/">
												Chatting
											</a>
										</li><li>
											<a class="active" href="insertProductForm.do">
												Product
											</a>
										</li>
									</ul>
								</nav>
							</div>
						</div>
						<div class="col-xl-3 col-lg-3 d-done d-lg-block">
							<div class="log_chat_area d-flex align-items-center">
								<a href="loginForm.do" class="login popup-with-form">
									<i class="fas fa-sign-in-alt"></i>
									<span>log in</span>
								</a>
								<div class="live_chat_btn">
									<a href="insertSignUpForm.do">
										<i class="fas fa-user-plus"></i>
										<span>Sign Up</span>
									</a>
								</div>
							</div>
						</div>
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none">
								<div class="slicknav_menu">
									<a href="#" aria-haspopup="true" role="button" tabindex="0" class="slicknav_btn slicknav_collapsed" style="outline: none;">
										<span class="slicknav_menutxt">Menu</span>
										<span class="slicknav_icon">
											<span class="slicknav_icon-bar"></span>
											<span class="slicknav_icon-bar"></span>
											<span class="slicknav_icon-bar"></span>
										</span>
									</a>
									<ul class="slicknav_nav slicknav_hidden" area-hidden="true" role="menu" style="display: none;">
										<li></li>
										<li></li>
										<li></li>
										<li></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
<section class="boardSection">

	<div class="searchBox">
			<form action="noticeListAction.do" method="post">
				<div>
					<input type="checkbox" name="area" value="notice_title">제목
				</div>
				<div>
					<input type="checkbox" name="area" value="notice_writer">작성자
				</div>
				<div>
					<input class="form-control" type="text" name="searchKey" size="10">
				</div>
	           	<div>
		           	<button class="btn_1 boxed-btn" type="submit" value="">
		           		search
		           	</button>
	           	</div>
			</form>
	</div>
	
	<table  class="boardTable" id="noticeBoardTable">
		<tr class="headRow">
			<td>글번호</td>
			<td>글제목</td>
			<td>작성자</td>
			<td>작성일자</td>
		</tr>
		<c:forEach var="noticeBoard" items="${noticeListModel.list}">
		<tr class="bodyRow">	
			
			<td class="writeNo">${noticeBoard.notice_id }</td>
			<td class="writeTitle"><a href="noticeDetailBoard.do?notice_id=${noticeBoard.notice_id }">${noticeBoard.notice_title }</a></td>
			<td class="writer">${noticeBoard.notice_writer }</td>
			<td>
				<fmt:parseDate var="dt" value="${noticeBoard.notice_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
				<fmt:formatDate value="${dt }" pattern="yyyy/MM/dd"/>
			</td>
		</tr>
		</c:forEach>
	</table>

	<br><br>
	
	<div class="pagingBox">
		<!-- 페이징 처리 -->
		<!-- 이전 영역 -->
		<c:if test="${noticeListModel.startPage > 5 }">
			<a href="noticeListAction.do?pageNum=${noticeListModel.startPage-1 }"><i class="fas fa-caret-left"></i></a>
		</c:if>
		
		<!-- 페이지 목록 -->
		<c:forEach var="pageNo" begin="${noticeListModel.startPage }" end="${noticeListModel.endPage}">

			<c:choose>
				<c:when test="${noticeListModel.requestPage==pageNo }">
					<a href="noticeListAction.do?pageNum=${pageNo }">
						<i class="fas fa-circle"></i>
					</a>
				</c:when>
				<c:otherwise>
					<a href="noticeListAction.do?pageNum=${pageNo }">
						<i class="far fa-circle"></i>
					</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<!-- 이후 영역 -->
		<c:if test="${noticeListModel.endPage <noticeListModel.totalPageCount }">
			<a href="noticeListAction.do?pageNum=${noticeListModel.endPage+1 }">  
			<i class="fas fa-caret-right"></i></a>
		</c:if>
	</div>

	<div class="writebtn">
		<a class="genric-btn success-border circle" href="noticeInsertFormAction.do">글쓰기</a>
	</div>
</section>

</body>
</html>

















