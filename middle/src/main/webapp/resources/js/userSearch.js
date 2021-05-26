//spring security에서 포스트방식 전송시 무조건 토큰 필요 
const
token = $("meta[name='_csrf']").attr("th:content");
const
header = $("meta[name='_csrf_header']").attr("th:content");

function search_check(num) {
	if (num == '1') {
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";
	} else {
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}

// 아이디 & 스토어 값 저장하기 위한 변수
var idV = "";
// 아이디 값 받고 출력하는 ajax
var idSearch_click = function() {
	$.ajax({
		type : "POST",
		url:"/account/userSearch/",
		contentType : "application/json; charset=utf-8",
		data: JSON.stringify({
			name : $("#inputName_1").val(),
			phone_number : $("#inputPhone_1").val()
		}),
		beforeSend : function(xhr) {//토큰 ajax 적용
			xhr.setRequestHeader(header, token);
		},
		success : function(data) {
			if (data == 0) {
				$('#id_value').text("회원 정보를 확인해주세요!");
			} else {
				$('#id_value').text(data);
				// 아이디값 별도로 저장
				idV = data;
			}
		}
	});
}