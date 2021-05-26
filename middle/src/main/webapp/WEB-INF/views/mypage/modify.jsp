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
		var regex = new RegExp("(.*?)\.(exe|sh|zip|txt|alz)$");
		var maxSize = 1024*1024*10;
		
		$('#modifybtn').on("click", function(e) {
			e.preventDefault();
			formObj.submit();
			
			/* if(operation === 'remove'){
				formObj.attr("action", "/mypage/remove");
			}else if (operation === 'mainpage') {
				formObj.attr("action", "/mypage/main").attr("method", "get");
			} */
		});//button click end 
		$('#removebtn').on("click", function(e) {
			formObj.attr("action", "/mypage/remove");
		});
		$('#mainpagebtn').on("click", function (e) {
			formObj.attr("action", "/mypage/main").attr("method", "get");
		});
		
		function checkExtension(fileName, fileSize) {
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과")
				return false;
			}
			
			if(regex.test(fileName)){
				alert("이미지 파일을 업로드해주세요")
				return false;
			}
			return true;
		}
		
		$("#uploadBtn").on("click", function(e) {
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			for(var i=0; i<files.length; i++){
				formData.append("uploadFile",files[i]);
			}
			$.ajax({
				url:'/mypage/uploadAjaxAction',
				processData : false,
				contentType: false,
				data: formData,
				type: 'POST',
				success: function(result) {
					alert("Uploaded");
				}
			}); //ajax
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

	<div class="uploadDiv">
		<input type="file" name="uploadFile" >
	</div>
	<button id="uploadBtn">사진 추가</button>
	
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
		<button type="submit" data-oper="modify" class="modifybtn"
			id="modifybtn">수정하기</button>
		<button type="submit" data-oper="remove" class="removebtn"
			id="removebtn">회원탈퇴</button>
		<button type="submit" data-oper="mainpage" class="mainpagebtn"
			id="mainpagebtn">돌아가기</button>
	</form>
</body>
</html>