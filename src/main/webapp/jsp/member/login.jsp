<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="member_whole">
	<div class="login_section">
		<div class="login_imgBox">
			<div class="login_logo">
				<img src="/images/logo/logo.svg" alt="한국수목원정원관리원 로고">
			</div>
			<img src="/images/icon/login_img.svg" alt="로그인 배경이미지"
				class="login_img">
		</div>
		
		<div class="section_inner">
				<form action="/login" method="post" class="login_form">
					<p class="title">로그인</p>
					<p class="subtext">서비스를 이용하려면 로그인해주세요.</p>
					<div class="input_box display_flex flex_align_c flex_start">
						<img src="/images/icon/id_icon.svg" alt="아이디 아이콘" class="input_icon">
						<input type="email" class="input_tag id_input" name="id" placeholder="아이디 입력">
					</div>
					<div class="input_box display_flex flex_align_c flex_start">
						<img src="/images/icon/pw_icon.svg" alt="비밀번호 아이콘" class="input_icon">
						<input type="password" class="input_tag pw_input" name="pwd" placeholder="비밀번호 입력">
					</div>
					<label for="storage_chk" class="id_storage display_flex flex_align_c flex_end">
						<input type="checkbox" id="storage_chk" class="storage_input" hidden="hidden"  name="save_id"/>
						<span></span>
						<span class="text">아이디 저장</span>
					</label>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="login_btn">
					<div class="btn_inner">
						<button type="submit" class="login_bottom">로그인</button>
						<div class="find_box display_flex flex_center flex_align_c">
							<a href="/member/id_find" class="find_link">아이디 찾기</a> <a
								href="/member/pw_find" class="find_link">비밀번호 찾기</a>
						</div>
					</div>
					<a href="/member/signup" class="signup_link">회원가입</a>
				</div>
				</form>
		</div>
	</div>
</div>
		<c:if test="${DUPLICATE_LOGIN eq 'true'}">													
		 <script type="text/javascript">
		 document.addEventListener("DOMContentLoaded", () => { alertShow("현재 다른 기기에서 로그인되어 로그인이 종료되었습니다.") });
	    </script>
	</c:if>
	
	<c:if test="${not empty exception}">
	    <script type="text/javascript">
		    document.addEventListener("DOMContentLoaded", () => { alertShow("${exception}") });
	    </script>
	</c:if>
	<script>
	
	document.addEventListener("DOMContentLoaded", () => {
		const saveEmail = getCookie("userEmail");
		if(saveEmail){
			$("#storage_chk").prop("checked",true);
			$(".id_input").val(saveEmail)
		}
	});
	</script>