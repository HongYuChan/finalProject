<%@include file="../includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugin/slick/slick.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/plugin/slick/slick-theme.css"
	type="text/css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">



</head>
<body>

	<!-- 헤더 검색부분 -->
	<!-- <header class="header-main">
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
			<a href="#" class="header-btn__text"> Sale </a> <a href="#"
				class="header-btn__text"> MyShop </a> <a href="#"
				class="header-btn__text"> Chat </a> <a href="#"
				class="header-btn__text"> Login </a>
		</div>
	</div>
	</header>
 -->
	<main>
	<div class="main-wrap">
		<div class="main-slide">
			<!-- slide bar -->
			<div id="slider-div" class="content-center">
				<c:forEach items="${list }" var="product" end="4">
					<a href="/get?product_id=${product.product_id }">
						<div class="slider-img">
							<c:forEach items="${product.image.split(',') }" var="img" end="0">
							<img src='resources\upload\<fmt:formatDate pattern="yyyy\MM\dd"
											value="${product.create_date}" />\<c:out value="${img }"/>' alt="img${product.product_id }">
							</c:forEach>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
		<section class="main-body content-center"> <!-- 상단 추천 상품 -->
		<div class="main-recomm">
			<div class="main-recomm__box">
				<a href="#" class="recomm-box">
					<div></div>
				</a> <a href="#" class="recomm-box">
					<div></div>
				</a> <a href="#" class="recomm-box">
					<div></div>
				</a>

			</div>
		</div>
		<!-- 상품 목록 -->
		<div class="main-product">
			<div class="main-product__list">

				<c:forEach items="${list}" var="product">
					<a href="/get?product_id=${product.product_id }" class="list-box">
						<div class="list-box__img">							
							<c:forEach items="${product.image.split(',') }" var="img" end="0">
							<img src='resources\upload\<fmt:formatDate pattern="yyyy\MM\dd"
											value="${product.create_date}" />\<c:out value="${img }"/>' alt="상품이미지">
							</c:forEach>
						</div>

						<div class="list-box__text">
							<div class="list-box__title">
								<c:out value="${product.title}" />
							</div>
							<div class="list-box__info">
								<div class="list-box__price">
									<c:out value="${product.price}" />
								</div>
								<div class="list-box__time">
									<span><fmt:formatDate pattern="yyyy-MM-dd"
											value="${product.create_date}" /></span>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>

			</div>
		</div>
		</section>
	</div>
	</main>

	<%@include file="../includes/footer.jsp"%>
</body>
</html>