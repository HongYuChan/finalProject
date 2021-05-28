<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href=""
	src/main/webapp/resources/css/style.css"" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
<script file="resources/css/style.css"></script>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<div>
		<div class="form-group">
			<label>Profile</label>
			<button class="modifybtn"
				onclick="location.href='/mypage/modify?user_id=<c:out value = "${member.user_id}"/>'">프로필
				수정</button>
			<div class="uploadResult">
				<ul>

				</ul>
			</div>
		</div>
		<div>
			<div class="form-gorup">
				<label>닉네임</label> <input class="form-contorl" name="nickname"
					value='<c:out value="${member.nickname}"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>이메일</label> <input class="form-control" name='id'
					value='<c:out value="${member.email}"/>' readonly="readonly">
			</div>
		</div>
	</div>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>