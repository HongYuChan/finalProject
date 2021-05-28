<%@include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/account/logout" method="post">
		<div class="modal-body">로그아웃 하시겠습니까?</div>
		<div class="modal-footer">
			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token }" />
			<button class="btn btn-primary">확인</button>
		</div>
	</form>



</body>
</html>
<%@include file="../includes/footer.jsp"%>