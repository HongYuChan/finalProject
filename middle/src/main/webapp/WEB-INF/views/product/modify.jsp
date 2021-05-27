<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시글 수정</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<!-- <div class="panel-heading">Board Modify</div> -->
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="/modify" method="post">

					<input type='hidden' name='pageNum'
						value='<c:out value="${cri.pageNum }"/>'> <input
						type='hidden' name='amount'
						value='<c:out value="${cri.amount }"/>'> <input
						type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
					<input type='hidden' name='keyword'
						value='<c:out value="${cri.keyword }"/>'>


					<div class="form-group">
						<label>product_id</label> <input type="hidden" class="form-control"
							name='product_id' value='<c:out value="${product.product_id }"/>'
							readonly="readonly">
					</div>

					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'
							value='<c:out value="${product.title }"/>'>
					</div>

					<div class="form-group">
						<label>상품명</label> <input class="form-control"
							name='product_name'
							value='<c:out value="${product.product_name }"/>'>
					</div>

					<div class="form-group">
						<label>가격</label> <input class="form-control" name='price'
							value='<c:out value="${product.price }"/>'>
					</div>

					<div class="form-group">
						<label>상품 정보</label>
						<textarea class="form-control" rows="3" name='product_info'><c:out
								value="${product.product_info}" /></textarea>
					</div>

					<div class="form-group">
						<label>Writer</label> <input type="hidden" class="form-control" name='user_id'
							value='<c:out value="${product.user_id}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>카테고리</label> <input class="form-control"
							name='category_id'
							value='<c:out value="${product.category_id}"/>'>
					</div>

					<div class="form-group uploadDiv">
						<label>이미지</label> <input class="form-control" type='file'
							name='image' value='resources\upload\<fmt:formatDate pattern="yyyy\MM\dd"
											value="${product.create_date}" />\<c:out value="${product.image }"/>' multiple>
					</div>



					<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
					<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
					<button type="submit" data-oper='list' class="btn btn-info">List</button>
				</form>


			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form");

		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "/remove");
				/* formObj.attr("action", "/product/remove"); */

			} else if (operation === 'list') {
				//move to list
				formObj.attr("action", "/main").attr("method", "get");
				/* formObj.attr("action", "/product/list").attr("method","get"); */

				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();

				formObj.empty();

				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}

			formObj.submit();
		});

	});
</script>





<%@include file="../includes/footer.jsp"%>
