<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>당신의 아이디는?</title>
<script src="/resources/js/userIdSearchModal.js/"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
</head>
<body>
	<div id="background_modal" class="background_modal">
		<div class="modal_contents">
			<h4>
				<b>아이디는</b>
				<span class="close">&times;</span>
			</h4>
			<br>
			<h2 id="id_value"></h2>
			<br>
			<h4>
			<b>입니다.</b>
			</h4>
			<button type="button" id="pwSearch_btn"
				class="btn peach-gradient btn-rounded waves-effect">
				<i class="fa fa-envelope"></i>비밀번호 찾기
			</button>
		</div>
	</div>
</body>
</html>