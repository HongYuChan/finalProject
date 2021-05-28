<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery 주석처리 -->
<!--     <script src="/resources/vendor/jquery/jquery.min.js"></script> -->

<!-- Bootstrap Core JavaScript -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script
	src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script
	src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/resources/dist/js/sb-admin-2.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
	$(document).ready(
			function() {
				$('#dataTables-example').DataTable({
					responsive : true
				});
				$(".sidebar-nav").attr("class",
						"sidebar-nav navbar-collapse collapse").attr(
						"aria-expanded", 'false').attr("style", "height:1px");
			});
</script>
<body>
	<footer>
		<div class="main-footer">
			<!-- <div class="main-footer__list">
                <a href="#">공지사항</a>
                <a href="#">신고</a>
                <a href="#">자주묻는질문</a>
                <a href="#">1:1문의하기</a>
            </div> -->
			<div class="main-footer__info">
				<div class="main-footer__intro content-center">
					<div class="footer-intro__title">
						<h1>Shop</h1>
					</div>

					<div class="footer-intro__content notice">
						<button data-oper='list'>
							<span style="color: rgb(169, 169, 169);">공지사항</span>
						</button>
					</div>

					<div class="footer-intro__content report">
						<a href="#"> <span>신고</span>
						</a>
					</div>

					<div class="footer-intro__content question">
						<a href="#"> <span>자주묻는질문</span>
						</a>
					</div>

				</div>

				<div class="main-footer__detail">
					<div class="footer-detail__text">
						<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.
							Laborum officiis ullam deleniti voluptas iure recusandae illum
							labore, voluptatibus atque dolores velit tenetur molestiae ad
							blanditiis necessitatibus maiores enim illo animi!</p>
						<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
							Tempore perferendis aliquam, quod pariatur commodi vitae. Beatae
							doloribus placeat, quidem similique deserunt asperiores
							dignissimos cumque, consequatur, dolores odit illum quia odio.</p>
					</div>
				</div>

			</div>
		</div>
	</footer>
</body>
</html>
