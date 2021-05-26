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
		
		$('pwcheck').bulr()
		formObj.submit();
		
	});//button click end
});