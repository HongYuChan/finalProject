<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" th:content="${_csrf.token}">
<meta name="_csrf_header" th:content="${_csrf.headerName}">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- java script -->
<script src="/resources/js/Join.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
	<article class="container" style="margin: 0 auto;
    width:80%;">
	<br>
		<div class="page-header">
			<div class="col-md-6 col-md-offset-3">
				<h3>회원가입</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
			<form action="/account/memberCreate" method="post" id="usercheck"
				name="member">
				<div class="form-group">
					<label for="id">아이디</label> <input type="text" class="form-control"
						id="id" name="id" placeholder="ID" />
					<div class="check_font" id="id_check"></div>
					
					<button class="btn btn-secondary" type="button" id="idCheck" onclick="fn_idCheck()" value="N">중복확인</button>
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label> <input type="password"
						class="form-control" id="password" name="password"
						placeholder="PASSWORD" />
					<div class="check_font" id="pw_check"></div>
				</div>
				<div class="form-group">
					<label for="pw2">비밀번호 확인</label> <input type="password"
						class="form-control" id="pw2" name="pw2"
						placeholder="Confirm Password" />
					<div class="check_font" id="pw2_check"></div>
				</div>
				<div class="form-group">
					<label for="name">이름</label> <input type="text"
						class="form-control" id="name" name="name" placeholder="Name" />
					<div class="check_font" id="name_check"></div>
				</div>
				<div class="form-group">
					<label for="nickname">별명</label> <input type="text"
						class="form-control" id="nickname" name="nickname"
						placeholder="NickName" />
					<div class="check_font" id="nickname_check"></div>
				</div>
				<div class="form-group">
					<label for="email">이메일 주소</label> <input type="email"
						class="form-control" id="email" name="email" placeholder="E-mail" />
					<div class="check_font" id="email_check"></div>
				</div>
				<div class="form-group">
					<label for="phone">휴대폰 번호('-'없이 번호만 입력해주세요)</label> <input
						type="tel" class="form-control" id="phone_number"
						name="phone_number" placeholder="Phone Number" />
					<div class="check_font" id="phone_check"></div>
				</div>
				<div class="form-group">
					<input class="form-control" style="width: 40%; display: inline;"
						placeholder="우편번호" name="oaddress" id="oaddress" type="text"
						readonly="readonly" />
					<button type="button" class="btn btn-secondary"
						onclick="execPostCode();">
						<i class="fa fa-search"></i> 우편번호 찾기
					</button>
				</div>
				<div class="form-group">
					<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
						name="address" id="address" type="text" readonly="readonly" />
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="상세주소" name="detailaddress"
						id="detailaddress" type="text" />
				</div>
				<div class="form-group text-center">
					<!-- <button type="submit" class="btn btn-primary">회원가입</button> -->
						<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/>
						<button class="btn btn-primary" type="submit">회원가입</button>
						<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
				
				</div>
			</form>
		</div>
	</article>
</body>

</html>