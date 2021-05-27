<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="./includes/header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Register</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Board Register</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="/register" method="post">
        
        <div class="form-group">
            <label>Product Name</label> <input class="form-control" name='product_name'>
          </div>
        
        <div class="form-group">
            <label>Category</label> <input class="form-control" name='category_id'>
          </div>
        
          <div class="form-group">
            <label>Title</label> <input class="form-control" name='title'>
          </div>

          <div class="form-group">
            <label>Text area</label>
            <textarea class="form-control" rows="3" name='product_info'></textarea>
          </div>

          <div class="form-group">
            <label>User</label> <input class="form-control" name='user_id'>
          </div>
          
          <div class="form-group">
            <label>Price</label> <input class="form-control" name='price'>
          </div>
          
          <div class="form-group uploadDiv">
            <label>Photo</label> <input class="form-control" type='file' name='image' multiple>
          </div>
          
          <button type="submit" id='uploadBtn' class="btn btn-default">Submit Button</button>
          <button type="reset" class="btn btn-default">Reset Button</button>
        </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<%@include file="./includes/footer.jsp"%>

<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script> -->

	<script type="text/javascript">
	
		$(document).ready(function() {
			
			var regex = new RegExp("(.*?)\.(jpg|png|PNG)$");
			
			var maxSize = 5242880;
			
			function checkExtension(fileName, fileSize){
				if(fileSize >= maxSize){
					alert("이미지 사이즈 초과");
					return false;
				}
				
				if(!regex.test(fileName)){
					alert("jpg, png 형식의 이미지를 선택해 주세요.");
					return false;
				}
				
				return true;
			}
			

			$("#uploadBtn").on("click", function(e) {
				var formData = new FormData();

				var inputFile = $("input[name='image']");

				var files = inputFile[0].files;

				console.log(files);

				//add filedate to formdata
				for (var i = 0; i < files.length; i++) {
					
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}

					formData.append("image", files[i]);

				}

				$.ajax({
					url : '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					success : function(result) {
						alert("Uploaded");
					}
				}); //$.ajax

			});
		});
	</script>
