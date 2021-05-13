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
<link rel="stylesheet" href="../boardCss/noticeInsertBoard.css">
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
	
	<section class="noticeInsertSection">
		<form action="noticeInsertAction.do" method="post">
			<input class="notice_writer" type="text" name="notice_writer" placeholder="작성자 닉네임 "><br>
			<input class="notice_title" "text" name="notice_title" placeholder="공지사항 제목을 작성하세요"><br>
			<br>
			<textarea rows="6" cols="70" name="notice_contents" placeholder="공지할 내용을 작정하세요"></textarea>
			<br>
			<input class="genric-btn success circle"  type="submit" value="문의하기">
		</form>
	</section>
</body>
</html>