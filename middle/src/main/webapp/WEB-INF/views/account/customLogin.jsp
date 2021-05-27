<%@include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://
www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="_csrf" th:content="${_csrf.token}">
<meta name="_csrf_header" th:content="${_csrf.headerName}">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

	<h1>custom login page</h1>
	<h2><c:out value = "${error}"/></h2>
	<h2><c:out value = "${logout}"/></h2>
	
	<form method='post' action="/login">
		
		<div>
		<label>아이디</label>
			<input type='text' name='username'>
		</div>
		<div>
		<label>비밀번호</label>
			<input type='password' name='password'>
		</div>
		<div>
		<button value="N">로그인</button>
		</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	
	</form>

</body>
</html>
<%@include file="../includes/footer.jsp"%>