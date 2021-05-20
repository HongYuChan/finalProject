<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>modify page</h1>

<div class="form-group">
	<label>ID</label>
	<ul>
		<li>${member.id}</li>
	</ul>
</div>
<form role="form" action="/mypage/modify" method="post">
	<div class="form-group">
		<label>비밀번호</label>
		<input type="password" name="password">
	</div>
	<!-- <div class="form-group">
		<label>비밀번호 확인</label>
		<input type="password" name="passconfirm">
	</div> -->
	
	<div class="form-group">
		<label>닉네임</label>
		<input type="text" name="nickname" value='<c:out value="${member.nickname}"/>'>
	</div>
	
	<div class="form-group">
		<label>이메일</label>
		<input type="email" name="email" value='<c:out value="${member.email}"></c:out>'>
	</div>
	<button type="submit" data-oper="modify" class="modifybtn">수정하기</button>
	<button type="submit" data-oper="remove" class="removebtn">회원탈퇴</button>
	<button type="submit" data-oper="main" class="mainpagebtn">돌아가기</button>
</form>

<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form");
	
	$('button').on("click", function(e) {
		e.preventDefault();
	var operation = $(this).data("oper");
	
	if(operation === 'remove'){
		formObj.attr("action", "/mypage/remove");
	}else if (operation === 'main') {
		formObj.attr("action", "/mypage/main").attr("method", "get");


	}
	formObj.submit();
	});
});
</script>