console.log("Reply Module........");

var replyService = (function() {

	function add(reply, callback) {
		console.log("reply............");

		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset = utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},// function success
			
			  error : function(xhr, status, er) 
			  { if (error) { error(er); }//if error
			  }//function error
			})// ajax
	}// function add
	
	function getList(param, callback, error){
		var bno = param.bno;
		var page = param.page || 1;
		
		$.getJSON("/replies/pages/"+ bno + "/" + page + ".json",
				function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status,err){
			if(error){
				error();
			}// if error
		}// fail function
		);//fail
	}//getList
	
	function remove(rno, callback, error){
		$.ajax({
			type : 'delete',
			url : '/replies/'+rno,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}//if success
			},//function success
			error : function(xhr, status, er){
				if(error){
					error(er);
				}//if error
			}//function error
		});//ajax
	}//remove
	
	
	return {
		add : add,
		getList : getList,
		remove : remove
	};
})();