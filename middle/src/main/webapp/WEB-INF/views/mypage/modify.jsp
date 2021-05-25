<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form");
	
	$('button').on("click", function(e) {
		e.preventDefault();
		
		$('#upload').on("click", function(){
			var formData = new FormData();
			var inputFile = $("input[name='profile_picture']");
			var files = inputFile[0].files;
			
			formData = append("profile_picture",files);
		)};
		
		$.ajax({
			url:'/mypage/profileUploadAjax',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			success: function (result) {
				alert("Uploaded");
			}; //end success
		}); //end ajax
		
		var operation = $(this).data("oper");
		
		if(operation === 'remove'){
			formObj.attr("action", "/mypage/remove");
		}else if (operation === 'mainpage') {
			formObj.attr("action", "/mypage/main").attr("method", "get");
		}
		$('.pw').focusout(function() {
			var newpw = $("#password").val();
			var pwcheck =$("#pwcheck").val();
			if(newpw != null || pwcheck !=null ){
				if(newpw == pwcheck){
					formObj.submit();
				}else{
					console.log('12222')
				};
			}else{
				console.log('1111')
			};
		});	//function end
	});//button click end
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

	<!-- <form action="/mypage/profileUpload" method="post" enctype="multipart/form-data">
		<input type="file" name="profile_picture">
		<input type="submit" name="profileUpload" value="사진 추가"> 
	</form> -->
	<div class='uploadDiv'>
		<input type="file" name="profile_picture">
		<button id="upload">사진 추가</button>
	</div>

	<form role="form" action="/mypage/modify" method="post">
		<div class="form-group">
			<input type="hidden" name="user_id"
				value='<c:out value="${member.user_id}"/>'>
		</div>
		<div class="form-group">
			<label>새로운 비밀번호</label> <input type="password" name="password"
				class="pw" id="password">
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