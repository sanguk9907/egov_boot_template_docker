<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form modelAttribute="changePass" action="/member/pw_find" method="post">
	<div class="member_whole">
		<div class="find_whole pw_find_whole">
			<div class="find_title">
				<p>비밀번호 찾기</p>
			</div>
			<!-- 처음 보여지는 div - pw_find1 / 비밀번호 재설정 - pw_find2 / 찾을 수 없음 - pw_find3  -->
			<div class="find_box">
				<div class="pw_find1">
					<p class="title">
						비밀번호를 잊어버리셨나요?
						<br>
						하단의 정보를 상세히 입력하세요.
					</p>
					<div class="input_whole">
						<div class="email_box">
							<p class="input_title">이메일</p>
							<div class="find_pw">
								<input type="email" class="find_email" placeholder="아이디 입력" onkeyup="findEmail()" id="find_email" name="find_email"></input>
								<button type="button" class="find_btn1" disabled onclick="numSend()">인증번호 보내기</button>
							</div>
							<div class="find_pw">
								<input type="text" class="email_num" id="email_num" name="email_num" placeholder="인증번호 입력" onkeyup="findEmailNum()" readonly />
								<button type="button" onclick="findPwChk()" class="find_btn2" disabled>인증하기</button>
							</div>
						</div>
					</div>
					<div class="subtext_box">
						<p class="subtext1">개인키 인증</p>
						<p class="subtext2">드래그 앤 드롭(또는 파일선택)으로개인키를 인증해주세요.</p>
					</div>
					<div class="upload_box">
						<div class="file_btn">
							<div id="drop">
								<label for="thumb_pic" class="input_file">
								<input type="file" accept=".txt" id="thumb_pic" hidden="hidden" name="private_key" onchange="handleFiles(this.files)">
								<img src="/images/icon/trunk_default.svg" alt="기본 이미지" class="trunk_default">
								</label>
								<div id="thumbnails"></div>
							</div>
						</div>
					</div>
					<button type="button" class="find_btn" onclick="findNext()">확인</button>
				</div>
				<!-- 새로운 비밀번호 설정 -->
				<div class="pw_find2" hidden="hidden">
					<p class="title">비밀번호를 재설정하세요</p>

					<div class="input_whole">
						<p>새로운 비밀번호</p>
						<form:password onkeyup="findPwChk1()" placeholder="새로운 비밀번호 입력" path="pass_1" />
						<form:errors path="pass_1"></form:errors>
						<span class="pw_no" hidden="hidden">비밀번호는 8 ~ 20자 내의 영문자, 숫자, 특수문자 [ $@$!%*#?& ] 를 필수로 사용해야합니다.</span>
						<p>비밀번호 재입력</p>
						<form:password onkeyup="findPwChk2()" placeholder="비밀번호 재입력" path="pass_2" />
						<form:errors path="pass_2"></form:errors>
						<span></span>
						<span class="pw_chk_no" hidden="hidden">비밀번호가 맞지않습니다.</span>
					</div>
					<input type="hidden" id="mb_private" name="mb_private" value="${private_key}" />
					<form:button type="submit" class="find_btn new_pw" disabled="true">확인</form:button>
				</div>
				<!-- 비밀번호 없을때 -->
				<div class="pw_find3" hidden="hidden">
					<p class="title">
						회원 정보를 찾을 수 없습니다.
						<br>
						회원가입 페이지로 이동 하시겠습니까?
					</p>
					<a href="/member/signup" class="find_btn id_btn2">회원가입</a>
				</div>
			</div>
		</div>
	</div>
</form:form>


<input type="hidden" id="email_chk" value="">
<input type="hidden" id="email_chk2" value="">
<input type="hidden" id="key_chk" value="">

<input type="hidden" id="pw_chk1" value="">
<input type="hidden" id="pw_chk2" value="">

<c:if test="${not empty status}">
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			$(".pw_no").remove();
			$(".pw_chk_no").remove();
			$('.pw_find1').hide();
			$('.pw_find2').show();
			$('.pw_find3').hide();
		});
	</script>
</c:if>

<c:if test="${status eq 'pass_error'}">
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			$("#pass_2").next("span").text("${message}")
		});
	</script>
</c:if>

<c:if test="${status eq 'complete'}">
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			$('#popup_type').val('pw_change_ok');
			alertShow('비밀번호가 성공적으로 바뀌었습니다.<br/>새로운 비밀번호로 로그인해주세요.');
		});
	</script>
</c:if>