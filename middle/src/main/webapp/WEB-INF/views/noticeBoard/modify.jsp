<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">noticeBoard Modify</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">noticeBoard Modify</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

      <form role="form" action="/noticeBoard/modify" method="post">
      
        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
	    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
      
 
			<div class="form-group">
			  <label>notice_id</label> 
			  <input class="form-control" name='notice_id' 
			     value='<c:out value="${noticeBoard.notice_id }"/>' readonly="readonly">
			</div>
			
			<div class="form-group">
			  <label>notice_Title</label> 
			  <input class="form-control" name='notice_title' 
			    value='<c:out value="${noticeBoard.notice_title }"/>' >
			</div>
			
			<div class="form-group">
			  <label>notice_Text area</label>
			  <textarea class="form-control" rows="3" name='notice_contents' ><c:out value="${noticeBoard.notice_contents}"/></textarea>
			</div>
			
			<div class="form-group">
			  <label>notice_Writer</label> 
			  <input class="form-control" name='notice_writer'
			    value='<c:out value="${noticeBoard.notice_writer}"/>' readonly="readonly">            
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
