<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Main Page</h1>
	<div>
		<div class="form-group">
			<label>Profile</label>
			<button class="modifybtn"
			onclick="location.href='/mypage/modify?user_id=<c:out value = "${member.user_id}"/>'">프로필 수정</button>
			<img class="form-contorl" name="Profile"
			src='<c:out value="${member_img.url}"/>'>
		</div>
		
		<div class="form-gorup">
			<label>닉네임</label>
			<input class="form-contorl" name="nickname" 
			value='<c:out value="${member.nickname}"/>' readonly="readonly">
		</div>
		<div class="form-group">
			<label>이메일</label> 
			<input class="form-control" name = 'id'
			value='<c:out value="${member.email}"/>' readonly="readonly">
		</div>
		
		<%-- <div class="form-group">
			<label>마지막 거래내역</label>
			<input class="form-contorl" name="last-trade"
			value='<c:out value="${trade. }"></c:out>'>
		</div> --%>
		
		
		
	</div>
</body>
</html>