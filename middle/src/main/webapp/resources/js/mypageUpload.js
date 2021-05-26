$(document).ready(function() {
	$('#upload').on("click", function(e){
		var formData = new FormData();
		var inputFile = $("input[name='profile_picture']");
		var files = inputFile[0].files;
		
		formData = append("profile_picture",files[0]);
	)}; //end click function
			
	$.ajax({
		url:'/mypage/profileUploadAjax',
		processData : false,
		contentType : false,
		data : formData,
		type : 'POST',
		success: function (result) {
			alert("Uploaded");
		}; // end success
	}); // end ajax
});