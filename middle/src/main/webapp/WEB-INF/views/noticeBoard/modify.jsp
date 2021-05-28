<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">게시글 수정</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

      <form role="form" action="/noticeBoard/modify" method="post">
      
        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
	    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
      
 
			<div class="form-group">
			  <label>글번호</label> 
			  <input class="form-control" name='notice_id' 
			     value='<c:out value="${noticeBoard.notice_id }"/>' readonly="readonly">
			</div>
			
			<div class="form-group">
			  <label>제목</label> 
			  <input class="form-control" name='notice_title' 
			    value='<c:out value="${noticeBoard.notice_title }"/>' >
			</div>
			
			<div class="form-group">
			  <textarea class="form-control" rows="3" name='notice_contents' ><c:out value="${noticeBoard.notice_contents}"/></textarea>
			</div>
			
			<div class="form-group">
			  <label>글 쓴이</label> 
			  <input class="form-control" name='notice_writer'
			    value='<c:out value="${noticeBoard.notice_writer}"/>' readonly="readonly">            
			</div>
			
			
			          
			
			  <button type="submit" data-oper='modify' class="btn btn-success">수정 완료</button>
			  <button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
			  <button type="submit" data-oper='list' class="btn btn-info">목록</button>
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

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/noticeBoard/remove");
	      
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/noticeBoard/list").attr("method","get");
	      
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
