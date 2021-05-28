<!-- 로그인 모달 페이지 -->
<div class="modal fade" id="modal-wrap" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="fake-div"></div>
				<h4 class="modal-title" id="myModalLabel">Login Title</h4>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"> &times; </span>
				</button>
			</div>

			<div class="modal-body">

				<div class="modal-body__wrap">
					
					<form method='post' action="/login">
					
						<div class="login-modal__input">

							<input type="text" id="login-input__id" class="login-input"
								placeholder="ID" name='username'> <input type="password"
								id="login-input__pw" class="login-input" placeholder="Password" name='password'>
						</div>

						<div class="login-modal__btn">
						
							<button value="N" id="login-btn__main"
								class="login-btn">Login</button>
								
							<button type="button" id="login-btn__kakao" class="login-btn">
								<div class="kakao-login__img"></div>
								Login with Kakao
							</button>
							<button type="button" id="login-btn__fb" class="login-btn">
								<div class="fb-login__img"></div>
								Login with Facebook
							</button>
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
	value="${_csrf.token}" />
						
					</form>
				</div>

			</div>
			<div class="modal-footer">
				<div class="modal-footer__wrap">
					<div class="login-footer login-footer__signup">
						회원이 아니신가요? <a href="/account/memberJoin" class="login-signup"> 회원가입 </a>
					</div>
					<div class="login-footer login-footer__forgot">
						<a href="#" class="login-forgot">아이디/비밀번호 찾기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
