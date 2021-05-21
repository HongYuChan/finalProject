<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form");
	
	$('button').on("click", function(e) {
		e.preventDefault();
		var operation = $(this).data("oper");
		
		if(operation === 'remove'){
			formObj.attr("action", "/mypage/remove");
		}else if (operation === 'mainpage') {
			formObj.attr("action", "/mypage/main").attr("method", "get");
		}
		$('.pw').focusout(function() {
			var oldpw = $("#old_pw").val();
			var newpw = $("#new_pw").val();
			var pwcheck =$("#pwcheck").val();
			
			if(oldpw != /* 여기에 db에서 데이터 가져와야함 */){
				if(newpw != "" || pwcheck !="" ){
					if(newpw == pwcheck){
						formObj.submit();
					}else{
						alert("비밀번호가 다릅니다")
					};
				}else{
					alert("빈칸없이 작성해주세요")
				};
			}else{
				alert("비밀번호가 다릅니다")
			}
		});	
	
	});
});
</script>

</head>
<body>
	<h1>modify page</h1>

	<div class="form-group">
		<label>ID</label>
		<ul>
			<li>${member.id}</li>
		</ul>
	</div>
	<form role="form" action="/mypage/modify" method="post">
		<div class="form-group">
			<input type="hidden" name="user_id"
				value='<c:out value="${member.user_id}"/>'>
		</div>
		<div>
			<label>현재 비밀번호</label> <input type="password" name="password"
				class="pw" id="old_pw">
		</div>
		<div class="form-group">
			<label>새로운 비밀번호</label> <input type="password" name="newPw"
				class="pw" id="new_pw">
		</div>
		<div class="form-group">
			<label>비밀번호 확인</label> <input type="password" name="newPwConfirm"
				class="pw" id="pwcheck">
		</div>
		<div class="form-group">
			<label>닉네임</label> <input type="text" name="nickname"
				value='<c:out value="${member.nickname}"/>'>
		</div>

		<div class="form-group">
			<label>이메일</label> <input type="email" name="email"
				value='<c:out value="${member.email}"></c:out>'>
		</div>
		<button type="submit" data-oper="modify" class="modifybtn">수정하기</button>
		<button type="submit" data-oper="remove" class="removebtn">회원탈퇴</button>
		<button type="submit" data-oper="mainpage" class="mainpagebtn">돌아가기</button>
	</form>
</body>
</html>