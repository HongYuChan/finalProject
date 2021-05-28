ie<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<meta name="_csrf" th:content="${_csrf.token}">
<meta name="_csrf_header" th:content="${_csrf.headerName}">

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">

				<form role="form" action="/noticeBoard/register" method="post">
					<div class="form-group">
						<label>제목</label> <input class="form-control" name='notice_title'>
					</div>

					<div class="form-group">
						<textarea class="form-control" rows="3" name='notice_contents'></textarea>
					</div>

					<div class="form-group">
						<label>글쓴이</label> 
						<input class="form-control" name='notice_writer'>
					</div>
					<button type="submit" class="btn btn-success">작성 완료</button>
					<button type="reset" class="btn btn-warning">초기화</button>
					
						<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/>
						
				</form>

			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->
<%@include file="../includes/footer.jsp"%>
