// 모든 공백 체크 정규식
var empJ = /\s/g;
// 아이디 정규식
var idJ = /^[a-z0-9][a-z0-9]{4,12}$/;
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/;
// 이름 정규식
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
// 별명 정규식
var nicknameJ = /^[가-힣]{2,10}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;

const
token = $("meta[name='_csrf']").attr("th:content");
const
header = $("meta[name='_csrf_header']").attr("th:content");

var address = $('#detailaddress');

// 아이디 중복확인
function fn_idCheck() {
	$.ajax({
		url : "/account/idCheck/",
		type : "post",
		contentType : "application/json; charset=utf-8",
		data : JSON.stringify({
			id : $("#id").val()
		}),
beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(data) {
			console.log(data);
			//console.log(JSON.parse(data));

			if (data == 1) {
				alert("중복된 아이디입니다.");
			} else if (data == 0) {
				$("#idCheck").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		},
		error : function(xhr, status, er) {

			console.log(er);

		}
	});//ajax end

	console.log("id check success")
}// fn_idcheck end

$(document).ready(
		function() {
			var address = $('#detailaddress');

			// 취소
			$(".cencle").on("click", function() {
				location.href = "/product/main";
			});

			$('form').on(
					'submit',
					function() {
						var inval_Arr = new Array(8).fill(false);
						if (idJ.test($('#id').val())) {
							inval_Arr[0] = true;
						} else {
							inval_Arr[0] = false;
							alert('아이디를 확인하세요.');
							return false;
						}
						// 비밀번호가 같은 경우 && 비밀번호 정규식
						if (($('#password').val() == ($('#pw2').val()))
								&& pwJ.test($('#password').val())) {
							inval_Arr[1] = true;
						} else {
							inval_Arr[1] = false;
							alert('비밀번호를 확인하세요.');
							return false;
						}
						// 이름 정규식
						if (nameJ.test($('#name').val())) {
							inval_Arr[2] = true;
						} else {
							inval_Arr[2] = false;
							alert('이름을 확인하세요.');
							return false;
						}
						// 별명 정규식
						if (nicknameJ.test($('#nickname').val())) {
							inval_Arr[3] = true;
						} else {
							inval_Arr[3] = false;
							alert('별명을 확인하세요.');
							return false;
						}

						// 이메일 정규식
						if (mailJ.test($('#email').val())) {
							console.log(phoneJ.test($('#email').val()));
							inval_Arr[4] = true;
						} else {
							inval_Arr[4] = false;
							alert('이메일을 확인하세요.');
							return false;
						}
						// 휴대폰번호 정규식
						if (phoneJ.test($('#phone_number').val())) {
							console.log(phoneJ.test($('#phone_number').val()));
							inval_Arr[5] = true;
						} else {
							inval_Arr[5] = false;
							alert('휴대폰 번호를 확인하세요.');
							return false;
						}
						// 주소확인
						if (address.val() == '') {
							inval_Arr[6] = false;
							alert('주소를 확인하세요.');
							return false;
						} else
							inval_Arr[6] = true;
						// 중복체크

						var idCheckVal = $("#idCheck").val();
						if (idCheckVal == "N") {
							alert("중복확인 버튼을 눌러주세요.");
							inval_Arr[7] = false;
						} else if (idCheckVal == "Y") {
							$("#regForm").submit();
							inval_Arr[7] = true;
						}
						// 전체 유효성 검사
						var validAll = true;
						for (var i = 0; i < inval_Arr.length; i++) {
							if (inval_Arr[i] == false) {
								validAll = false;
							}
						}

						if (validAll == true) {
							// 유효성 모두 통과
							alert('가족이 되어주셔 감사합니다.');
						} else {
							alert('정보를 다시 확인하세요.')
						}
					});
			// id
			$('#id').blur(function() {
				if (idJ.test($('#id').val())) {
					console.log('true');
					$('#id_check').text('');
				} else {
					console.log('false');
					$('#id_check').text('4~12자의 영문 소문자, 숫자만 사용 가능합니다.');
					$('#id_check').css('color', 'red');
				}
			});
			// 비밀번호
			$('#password').blur(function() {
				if (pwJ.test($('#password').val())) {
					console.log('true');
					$('#pw_check').text('');
				} else {
					console.log('false');
					$('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
					$('#pw_check').css('color', 'red');
				}
			});
			// 1~2 패스워드 일치 확인
			$('#pw2').blur(function() {
				if ($('#password').val() != $(this).val()) {
					$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
					$('#pw2_check').css('color', 'red');
				} else {
					$('#pw2_check').text('');
				}
			});
			// 이름에 특수문자 들어가지 않도록 설정
			$("#name").blur(
					function() {
						if (nameJ.test($(this).val())) {
							console.log(nameJ.test($(this).val()));
							$("#name_check").text('');
						} else {
							$('#name_check').text(
									'한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
							$('#name_check').css('color', 'red');
						}
					});
			// 별명 설정
			$('#nickname').blur(function() {
				if (nicknameJ.test($('#nickname').val())) {
					console.log('true');
					$('#nickname_check').text('');
				} else {
					console.log('false');
					$('#nickname_check').text('2~10자의 한글만 사용 가능합니다.');
					$('#nickname_check').css('color', 'red');
				}
			});

			// 이메일
			$("#email").blur(function() {
				if (mailJ.test($(this).val())) {
					$("#email_check").text('');
				} else {
					$('#email_check').text('이메일 양식을 확인해주세요.');
					$('#email_check').css('color', 'red');
				}
			});

			// 휴대전화
			$('#phone_number').blur(function() {
				if (phoneJ.test($(this).val())) {
					console.log(nameJ.test($(this).val()));
					$("#phone_check").text('');
				} else {
					$('#phone_check').text('휴대폰번호를 확인해주세요 ');
					$('#phone_check').css('color', 'red');
				}
			});

		});

// 우편번호 찾기 버튼 클릭시 발생 이벤트
function execPostCode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullRoadAddr = data.roadAddress;
			// 도로명 주소 변수
			var extraRoadAddr = '';
			// 도로명 조합형 주소 변수
			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}
			// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if (fullRoadAddr !== '') {
				fullRoadAddr += extraRoadAddr;
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			console.log(data.zonecode);
			console.log(fullRoadAddr);
			/*
			 * var a = console.log(data.zonecode); var b =
			 * console.log(fullRoadAddr); if(a == null || b = null){ alert("주소를
			 * 확인하세요."); return false; }
			 */

			$("[name=oaddress]").val(data.zonecode);
			$("[name=address]").val(fullRoadAddr);
			document.getElementById('oaddress').value = data.zonecode;
			// 5자리 새우편번호 사용
			document.getElementById('address').value = fullRoadAddr;
			// document.getElementById('detailaddress').value =
			// data.jibunAddress;
		}
	}).open();
}
