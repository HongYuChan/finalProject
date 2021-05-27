<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>   
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- csrf 토큰 -->
<meta name="_csrf" th:content="${_csrf.token}">
<meta name="_csrf_header" th:content="${_csrf.headerName}">

<!-- custom -->
<script src="/resources/js/jquery.min.js" type="text/javascript"></script>

<title>중고마켓</title>

<!-- custom -->
    <link rel="stylesheet" href="/resources/css/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    <link rel="stylesheet" href="/resources/plugin/slick/slick.css" type="text/css">
    <link rel="stylesheet" href="/resources/plugin/slick/slick-theme.css" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    
    
    <script src="/resources/js/bootstrap.bundle.js" type="text/javascript"></script>
    <script src="/resources/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="/resources/plugin/slick/slick.js" type="text/javascript"></script>
    <script src="/resources/js/slider.js" type="text/javascript"></script>

<!-- Bootstrap Core CSS -->
<!-- <link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet"> -->

<!-- MetisMenu CSS -->
<!-- <link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet"> -->

<!-- DataTables CSS -->
<!-- <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet"> -->

<!-- DataTables Responsive CSS -->
<!-- <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">
 -->
<!-- Custom CSS -->
<!-- <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet"> -->
<!-- Custom Fonts -->
<!-- <link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css"> -->

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- main.jsp 추가 항목 -->
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/resources/plugin/slick/slick.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/js/slider.js"
	type="text/javascript"></script>


</head>

<body>


   <!-- 헤더 검색부분 -->
    <header class="header-main">
        <div class="header-main__content content-center">
            <a href="main.html">
                <h1>Shop</h1>
            </a>
            <div class="header-input">
                <input type="text" placeholder="Search" id="header-input__v1">
                <button>
                    <i class="fas fa-search fa-lg"></i>
                </button>
            </div>

            <div class="header-btn">
                <a href="#" class="header-btn__text">
                    Sale
                </a>
                <a href="#" class="header-btn__text">
                    MyShop
                </a>
                <a href="#" class="header-btn__text">
                    Chat
                </a>
               
               <!-- 로그인 로그아웃 최고! -->

               <sec:authorize access="isAnonymous()">
                <a href="/account/customLogin" class="header-btn__text">로그인</a>
                </sec:authorize>
                 <sec:authorize access="isAnonymous()">
               <a href="/account/customLogout" class="header-btn__text" >로그아웃</a>
                </sec:authorize>

                <!-- 로그인 모달 페이지 -->
                <div class="modal fade" id="modal-wrap" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="fake-div"></div>
                                <h4 class="modal-title" id="myModalLabel">Login Title</h4>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">
                                        &times;
                                    </span>
                                </button>
                            </div>
                            
                            <div class="modal-body">
                                <div class="modal-body__wrap">
                                    <div class="login-modal__input">
                                        <input type="text" id="login-input__id" class="login-input" placeholder="ID">
                                        <input type="text" id="login-input__pw" class="login-input" placeholder="Password">
                                    </div>

                                    <div class="login-modal__btn">
                                        <button type="button" id="login-btn__main" class="login-btn">
                                            Login
                                        </button>
                                        <button type="button" id="login-btn__kakao" class="login-btn">
                                            <div class="kakao-login__img"></div>
                                            Login with Kakao
                                        </button>
                                        <button type="button" id="login-btn__fb" class="login-btn">
                                            <div class="fb-login__img"></div>
                                            Login with Facebook
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="modal-footer__wrap">
                                    <div class="login-footer login-footer__signup">
                                        회원이 아니신가요? 
                                        <a href="signUp.html" class="login-signup">
                                            회원가입
                                        </a>
                                    </div>
                                    <div class="login-footer login-footer__forgot">
                                        <a href="#" class="login-forgot">아이디/비밀번호 찾기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </header>
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
