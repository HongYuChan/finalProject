<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">noticeBoard Read</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">noticeBoard Read Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

          <div class="form-group">
          <label>notice_id</label> <input class="form-control" name='notice_id'
            value='<c:out value="${noticeBoard.notice_id}"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>notice_Title</label> <input class="form-control" name='notice_title'
            value='<c:out value="${noticeBoard.notice_title}"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>notice_Text area</label>
          <textarea class="form-control" rows="3" name='notice_contents'
            readonly="readonly"><c:out value="${noticeBoard.notice_contents}" /></textarea>
        </div>

        <div class="form-group">
          <label>notice_Writer</label> <input class="form-control" name='notice_writer'
            value='<c:out value="${noticeBoard.notice_writer}"/>' readonly="readonly">
        </div>

<%-- 		<button data-oper='modify' class="btn btn-default">
        <a href="/board/modify?bno=<c:out value="${board.bno}"/>">Modify</a></button>
        <button data-oper='list' class="btn btn-info">
        <a href="/board/list">List</a></button> --%>


<button data-oper='modify' class="btn btn-default">Modify</button>
<button data-oper='list' class="btn btn-info">List</button>
<%-- 
<form id='operForm' action="/noticeBoard/modify" method="get">
  <input type='hidden' id='notice_id' name='notice_id' value='<c:out value="${noticeBoard.notice_id}"/>'>
</form>
 --%>

<form id='operForm' action="/noticeBoard/modify" method="get">
  <input type='hidden' id='notice_id' name='notice_id' value='<c:out value="${noticeBoard.notice_id}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
 
</form>



      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript" >

console.log("========JSTEST========")

var notice_idValue = '<c:out value="${noticeBoard.notice_id}"/>';

//for replyService add test
replyService.add(
		{reply: "JS Test", replyer: "tester", notice_id:notice_idValue},
		function(result) {
			alert("RESULT: " + result);
		}
);
</script>

<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/noticeBoard/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#notice_id").remove();
    operForm.attr("action","/noticeBoard/list")
    operForm.submit();
    
  });  
});
</script>


<%@include file="../includes/footer.jsp"%>
