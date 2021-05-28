<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 토큰 -->
<meta name="_csrf" th:content="${_csrf.token}">
<meta name="_csrf_header" th:content="${_csrf.headerName}">

<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	//spring security에서 포스트방식 전송시 무조건 토큰 필요 
	var token = $("meta[name='_csrf']").attr("th:content");
	var header = $("meta[name='_csrf_header']").attr("th:content");

	$(document).ready(
		function() {
			var formObj = $("form");
			var regex = new RegExp("(.*?)\.(exe|sh|zip|txt|alz)$");
			var maxSize = 1024 * 1024 * 10;
			var cloneObj = $(".uploadDiv").clone();
	
			$('#modifybtn').on("click", function(e) {
				e.preventDefault();
	
				if ($('#password').val() != $('#pwcheck').val()) {
					$('#pw_check').text('비밀번호가 일치하지 않습니다.');
					$('#pw_check').css('color', 'red');
					return false;
				} else if($('#password').val() == null || $('#pwcheck').val() == null) {
					$('#pw_check').text('비밀번호를 입력해주세요.');
					$('#pw_check').css('color', 'red');
				 	return false;
				} else {
					$('#pw2_check').text('');
					formObj.submit();
				}
	
				/* if(operation === 'remove'){
					formObj.attr("action", "/mypage/remove");
				}else if (operation === 'mainpage') {
					formObj.attr("action", "/mypage/main").attr("method", "get");
				} */
			});//button click end 
			$('#removebtn').on("click", function(e) {
				formObj.attr("action", "/mypage/remove");
			});
			$('#mainpagebtn').on(
					"click",
					function(e) {
						formObj.attr("action", "/mypage/main").attr(
								"method", "get");
					});
	
			function checkExtension(fileName, fileSize) {
				if (fileSize >= maxSize) {
					alert("파일 사이즈 초과")
					return false;
				}
	
				if (regex.test(fileName)) {
					alert("이미지 파일을 업로드해주세요")
					return false;
				}
				return true;
			}
	
			$("#uploadBtn").on("click",	function(e) {
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				console.log(files);			
				
				
				for (var i = 0; i < files.length; i++) {
					formData.append("uploadFile", files[i]);
				}
				$.ajax({
					url : '/mypage/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					beforeSend : function(xhr) {
						console.log(header);
						console.log(token);
						xhr.setRequestHeader(header, token);
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n"
								+ "message:" + request.responseText
								+ "\n" + "error:" + error);
					},
					success : function(result) {
						console.log(result);
						showUploadFile(result);
						$(".uploadDiv").html(cloneObj.html());
					}

				}); //ajax
			});
			var uploadResult = $(".uploadResult ul");
			
			function showUploadFile(uploadResultArr) {
				var str = "";
				
				$(uploadResultArr).each(function(i, obj) {
					if(!obj.image){
						str += "<li><img src='/resources/img/attach.png'></li>";
					}else{
						var fileCallPath = encodeURIComponent("/s_"+obj.uuid+"_"+obj.fileName);
						
						str += "<li><img src='display?fileName="+fileCallPath+"'></li>";
						}
				}); //each end
				uploadResult.append(str);
			}
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

	<div class="uploadResult">
		<ul>
			
		</ul>
	</div>
	<div class="uploadDiv">
		<input type="file" name="uploadFile">
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
		<div id="pw_check"></div>
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

		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

	</form>


</body>
</html>