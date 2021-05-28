<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/header.jsp"%>


<body>
	<main class="notice-main content-center">
	<div class="notice-main__wrap">
		<nav class="notice-main__nav">
			<a href="#" class="notice-part nm-choice__a notice-btn"> 공지사항 </a> <a
				href="#" class="report-part notice-btn"> 신고 </a> <a href="#"
				class="question-part notice-btn"> 자주묻는질문 </a>
		</nav>


		<c:forEach items="${list}" var="noticeBoard">
			<div class="notice-main__content">
				<ul class="notice-content__ul">
					<li class="notice-content__li nc-display__n">
						<article class="nc-display__n">

							<div class="content_head">
								<div>
									<c:out value="${noticeBoard.notice_id}" />
								</div>

								<h3>
									<a
										href='/noticeBoard/get?notice_id=<c:out value="${noticeBoard.notice_id}"/>'>
										<c:out value="${noticeBoard.notice_title}" />
									</a>
								</h3>

								<div class="content_date">
									<fmt:formatDate pattern="yyyy-MM-dd"
										value="${noticeBoard.notice_date}" />
								</div>
							</div>

							<div class="content_box">
								<p>
									<a
										href='/noticeBoard/get?notice_id=<c:out value="${noticeBoard.notice_id}"/>'>
										<c:out value="${noticeBoard.notice_contents}" />
									</a>
								</p>
							</div>

						</article>
					</li>
				</ul>
			</div>
		</c:forEach>



		<div class='row'>
			<div class="col-lg-12">

				<form id='searchForm' action="/noticeBoard/list" method='get'>
					<select name='type'>
						<option value=""
							<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
						<option value="T"
							<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
						<option value="C"
							<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
						<option value="W"
							<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
						<option value="TC"
							<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
							or 내용</option>
						<option value="TW"
							<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
							or 작성자</option>
						<option value="TWC"
							<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
							or 내용 or 작성자</option>

						<!-- 	<option value="">--</option>
									<option>value="T">제목</option>
									<option>value="C">내용</option>
									<option>value="W">작성자</option>
									<option>value="TC">제목 or 내용</option>
									<option>value="TW">제목 or 작성자</option>
									<option>value="TWC">제목 or 내용 or 작성자</option> -->
					</select> <input type='text' name='keyword'
						value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
						type='hidden' name='pageNum'
						value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
						type='hidden' name='amount'
						value='<c:out value="${pageMaker.cri.amount}"/>' />
					<button class='btn btn-default'>Search</button>
				</form>
			</div>
		</div>




		<div class='pull-right'>

			<ul class="pagination">

				<%--             <c:if test="${pageMaker.prev}">
              <li class="paginate_button previous"><a href="#">Previous</a>
              </li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}"
              end="${pageMaker.endPage}">
              <li class="paginate_button"><a href="#">${num}</a></li>
            </c:forEach>

            <c:if test="${pageMaker.next}">
              <li class="paginate_button next"><a href="#">Next</a></li>
            </c:if> --%>

				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="${pageMaker.startPage -1}">Previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="page-item  ${pageMaker.cri.pageNum == num ? "active":""} ">
						<a class="page-link" href="${num}">${num}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link"
						href="${pageMaker.endPage +1 }">Next</a></li>
				</c:if>


			</ul>
					
			<button id='regBtn' type="button" class="btn btn-success">
				공지사항 작성
			</button>
			
		</div>
		<!--  end Pagination -->
	</div>

	<form id='actionForm' action="/noticeBoard/list" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

		<input type='hidden' name='type'
			value='<c:out value="${ pageMaker.cri.type }"/>'> <input
			type='hidden' name='keyword'
			value='<c:out value="${ pageMaker.cri.keyword }"/>'>


	</form>


	<!-- Modal  추가 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">처리가 완료되었습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal --> </main>



</body>



<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var result = '<c:out value="${result}"/>';

						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							if (result === '' || history.state) {
								return;
							}

							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");
							}

							$("#myModal").modal("show");
						}

						$("#regBtn").on("click", function() {

							self.location = "/noticeBoard/register";

						});

						var actionForm = $("#actionForm");

						$(".page-item a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						$(".move")
								.on(
										"click",
										function(e) {

											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='notice_id' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/noticeBoard/get");
											actionForm.submit();

										});

						var searchForm = $("#searchForm");

						$("#searchForm button").on(
								"click",
								function(e) {

									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();

									searchForm.submit();

								});

					});
</script>






<%@include file="../includes/footer.jsp"%>
