<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugin/slick/slick.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugin/slick/slick-theme.css" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css" type="text/css">
    <script src="<%=request.getContextPath()%>/resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/resources/plugin/slick/slick.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/resources/js/slider.js" type="text/javascript"></script>
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
                <a href="#" class="header-btn__text">
                    Login
                </a>
            </div>
        </div>
    </header>


    <main class="product-main">
        <section class="product-slider__wrap">
            <div id="product-slider" class="content-center">
            	<c:forEach items="${product.image.split(',') }" var="img">
                	<div class="product-slider__img">
                    	<img src='resources\upload\<fmt:formatDate pattern="yyyy\MM\dd"
											value="${product.create_date}" />\<c:out value="${img }"/>' alt="제품사진">
                	</div>
                </c:forEach>
            </div>
        </section>

        <div class="product-info">
            <div class="product-info__user">
                <div class="user-profile">
                    <div class="product-user__profile">
                        <img src="https://d1unjqcospf8gs.cloudfront.net/assets/users/default_profile_80-7e50c459a71e0e88c474406a45bbbdce8a3bf2ed4f2efcae59a064e39ea9ff30.png" alt="판매자 이미지">
                    </div>
                    <div class="product-user__text">
                        <div>
                            userId
                        </div>
                        <div>
                            userAddress
                        </div>
                    </div>
                </div>

                <div class="user-score">
                    <div class="product-score__icon">
                        <i class="fas fa-star fa-2x"></i>
                    </div>
                    <div class="product-score__int">
                        <span>4.0</span>
                    </div>
                </div>

            </div>

            <div class="product-info__detail content-center">
                <h1><c:out value="${product.title }"/></h1>
                <p class="product-detail__time list-box__time"><fmt:formatDate pattern="yyyy-MM-dd"
											value="${product.create_date}" /></p>
                <p class="product-detail__price list-box__price"><c:out value="${product.price }"/></p>
                <p><c:out value="${product.product_info }"/></p>             
            </div>


        </div>
    </main>


    <footer>
        <div class="main-footer">
            <!-- <div class="main-footer__list">
                <a href="#">공지사항</a>
                <a href="#">신고</a>
                <a href="#">자주묻는질문</a>
                <a href="#">1:1문의하기</a>
            </div> -->
            <div class="main-footer__info">
                <div class="main-footer__intro content-center">
                    <div class="footer-intro__title">
                        <h1>Shop</h1>
                    </div>

                    <div class="footer-intro__content notice">
                        <a href="notice.html">
                            <span>공지사항</span>
                        </a>
                    </div>

                    <div class="footer-intro__content report">
                        <a href="#">
                            <span>신고</span>
                        </a>
                    </div>

                    <div class="footer-intro__content question">
                        <a href="#">
                            <span>자주묻는질문</span>
                        </a>
                    </div>

                </div>

                <div class="main-footer__detail">
                    <div class="footer-detail__text">
                        <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Laborum officiis ullam deleniti voluptas iure recusandae illum labore, voluptatibus atque dolores velit tenetur molestiae ad blanditiis necessitatibus maiores enim illo animi!</p>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore perferendis aliquam, quod pariatur commodi vitae. Beatae doloribus placeat, quidem similique deserunt asperiores dignissimos cumque, consequatur, dolores odit illum quia odio.</p>
                    </div>
                </div>

            </div>
        </div>
    </footer>
</body>
</html>