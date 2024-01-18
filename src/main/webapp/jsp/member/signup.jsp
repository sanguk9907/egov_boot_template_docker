<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="member_whole">
	<div class="signup_whole">
		<div class="find_title">
			<p>회원가입</p>
		</div>
		<div class="signup_inner">
			<form:form modelAttribute="signupVO" action="/member/signup"
				method="post">
				<div class="stage_box">
					<div class="display_flex flex_align_c flex_between">
						<label for="stage1" class="stage_label1"> <input
							type="checkbox" id="stage1" hidden="hidden" disabled checked>
							<span></span> <span class="text">회원약관</span>
						</label> <label for="stage2" class="stage_label2"> <input
							type="checkbox" id="stage2" hidden="hidden" disabled> <span></span>
							<span class="text">양식작성</span>
						</label> <label for="stage3" class="stage_label3"> <input
							type="checkbox" id="stage3" hidden="hidden" disabled> <span></span>
							<span class="text">승인대기</span>
						</label>
					</div>
				</div>
				<!-- 약관 동의 -->
				<div class="agreement_area">
					<div class="inner_text">
						<p>
							회원의 신상정보에 대해서는 ‘개인정보보호법’에 따라 완벽한<br> 보안을 유지할 것입니다. 회원으로
							가입하시려면 먼저 이용약관,<br> 개인정보 수집 · 이용 동의에 동의하셔야 합니다.<br>
							회원가입은 홈페이지 상에서만 이루어 집니다.<br> 아래의 이용약관, 개인정보 수집 · 이용동의를 반드시
							읽어보신 후,<br> 가입신청을 해주시기 바랍니다.
						</p>
					</div>
					<div class="agreement_inner">
						<div class="inner_box">
							<p class="title">이용약관</p>
							<div class="agreement_text">
								<div class="text_inner">
									<p>회원의 신상정보에 대해서는 ‘개인정보보호법’에 따라 완벽한보안을 유지할 것입니다. 회원으로
										가입하시려면 먼저 이용약관,개인정보 수집 · 이용 동의에 동의하셔야 합니다. 회원가입은 홈페이지 상에서만 이루어
										집니다.아래의 이용약관, 개인정보 수집 · 이용동의를 반드시 읽어보신 후,가입신청을 해주시기 바랍니다.이용약관
										내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용 이용약관 내용
										이용약관 내용 이용약관 내용</p>
								</div>
							</div>
							<div class="check_area display_flex flex_center flex_end">
								<label for="radio1" class="display_flex flex_start flex_align_c"
									onclick="termsRadio1()"> <form:radiobutton
										name="radio1" id="radio1" value="Y" hidden="hidden"
										path="agree_check1" /> <span class="radio_span"></span> <span
									class="checkbox_text">동의함</span>
								</label> <label for="radio2"
									class="display_flex flex_start flex_align_c"
									onclick="termsRadio1()"> <form:radiobutton
										name="radio1" id="radio2" value="N" hidden="hidden"
										path="agree_check1" checked="true" /> <span></span> <span
									class="checkbox_text">동의하지않음</span>
								</label>
							</div>
						</div>
						<div class="inner_box">
							<p class="title">개인정보 수집·이용 동의</p>
							<div class="agreement_text">
								<div class="text_inner">
									<p>회원의 신상정보에 대해서는 ‘개인정보보호법’에 따라 완벽한보안을 유지할 것입니다. 회원으로
										가입하시려면 먼저 이용약관,개인정보 수집 · 이용 동의에 동의하셔야 합니다. 회원가입은 홈페이지 상에서만 이루어
										집니다.아래의 이용약관, 개인정보 수집 · 이용동의를 반드시 읽어보신 후,가입신청을 해주시기 바랍니다.
										이용약관내용이용약관내용이용약관내용이용약관내용이용약관내용이용약관내용이용약관내용</p>
								</div>
							</div>
							<div class="check_area display_flex flex_center flex_end">
								<label for="radio3" class="display_flex flex_start flex_align_c"
									onclick="termsRadio2()"> <form:radiobutton
										name="radio2" id="radio3" value="Y" hidden="hidden"
										path="agree_check2" /> <span></span> <span
									class="checkbox_text">동의함</span>
								</label> <label for="radio4"
									class="display_flex flex_start flex_align_c"
									onclick="termsRadio2()"> <form:radiobutton
										name="radio2" id="radio4" value="N" hidden="hidden"
										path="agree_check2" checked="true" /> <span></span> <span
									class="checkbox_text">동의하지않음</span>
								</label>
							</div>
						</div>
						<button type="button" class="signup_next"
							onclick="signupNext(), signupNextBtn()" disabled>다음단계로</button>
					</div>
				</div>
				<!-- 회원정보 입력 -->
				<div class="essential_area" hidden="hidden">
					<div class="inner_text">
						<p>필수정보 입력</p>
					</div>
					<div class="check_area display_flex flex_end flex_align_c">
						<label for="classify1"
							class="display_flex flex_start flex_align_c" onclick="classify()">
							<form:radiobutton hidden="hidden" name="classify" id="classify1"
								value="ROLE_ADMIN" path="mb_group" /> <span></span> <span
							class="checkbox_text">한국 수목원 정원 관리원</span>
						</label> 
						<!-- 시드뱅크는 계정 1 -->
						<label for="classify2"
							class="display_flex flex_start flex_align_c" onclick="classify()">
							<form:radiobutton hidden="hidden" name="classify" id="classify2"
								value="ROLE_BANK" path="mb_group" /> <span></span> <span
							class="checkbox_text">시드뱅크</span>
						</label>
						<label for="classify3"
							class="display_flex flex_start flex_align_c" onclick="classify()">
							<form:radiobutton hidden="hidden" name="classify" id="classify3"
								value="ROLE_USER" path="mb_group" /> <span></span> <span
							class="checkbox_text">기타(식물원, 연구소 등)</span>
						</label>
					</div>
					<form:errors path="mb_group"
						style="font-size:8px; color:#ff0000; display:block; float:right;" />
					<div class="form_inner">
						<div class="signup_form">
							<div class="input_box">
								<p>이름</p>
								<form:input type="text" placeholder="이름을 입력해주세요."
									class="name_input" onkeyup="signupChk1()" path="mb_name" value="${signupVO.mb_name}"/>
								<form:errors path="mb_name" class="input_error" />
								<span id="name_chk" hidden>이름을 입력해주세요.</span>
								<span id="name_kor" hidden>이름은 한글만 사용 가능합니다.</span>
							</div>
							<div class="input_box">
								<p>소속 기관</p>
								<form:input type="text" class="belong_input"
									placeholder="ex) 한국수목원정원관리원" onkeyup="signupChk2()"
									path="mb_belong"  value="${signupVO.mb_belong}"/>
								<form:errors path="mb_belong" class="input_error" />
								<span hidden>소속을 입력해주세요.</span>
							</div>
							<div class="input_box">
								<div class="add_data">
									<div class="title">
										<p>소속 기관 주소</p>
									</div>
									<div class="data_box">
										<div class="input_flex_whole signup_addr">
											<input type="hidden" id="mb_lat" name="mb_lat" value="${signupVO.mb_lat}">
											<input type="hidden" id="mb_lng" name="mb_lng" value="${signupVO.mb_lng}">
											<div class="input_flex display_flex flex_nowrap flex_between flex_align_c">
												<form:input type="text" class="zip_input" placeholder="우편번호"
													onkeyup="signupChk4()" path="mb_addr_zip"  value="${signupVO.mb_addr_zip}" readonly="true"/>
												<form:errors path="mb_addr" class="input_error" hidden="true"/>
												<button type="button" id="confirm_adr" onclick="openAddressSearch(this)">주소 검색</button>
											</div>
											<form:input type="text" class="addr1_input" placeholder="주소"
												onkeyup="signupChk5()" path="mb_addr"  value="${signupVO.mb_addr}" readonly="true"/>
											<form:errors path="mb_addr" class="input_error" />
											<input type="text" placeholder="상세주소를 입력해주세요." name="mb_addr2" value="${signupVO.mb_addr2}" class="addr2_input">
											<!-- hidden_address - 참고항목 -->
											<div id="wrap" class="address_wrap"></div>
											
											
										</div>
									</div>
								</div>
							</div>
							<div class="input_box">
								<p>직위</p>
								<form:input type="text" class="rank_input" placeholder="ex) 사원"
									onkeyup="signupChk3()" path="mb_position"  value="${signupVO.mb_position}"/>
								<form:errors path="mb_position" class="input_error" />
								<span hidden>직위를 입력해주세요.</span>
							</div>
							<div class="input_box">
								<p>이메일</p>
								<div class="display_flex flex_between flex_align_c">
									<form:errors path="mb_email" class="input_error_next" hidden="true" />
									<form:input type="email" placeholder="이메일를 입력해주세요."
										id="email_input" data-id="email_input" class="email_input"
										onkeyup="inputKeyup(this)" path="mb_email"  value="${signupVO.mb_email}"/>
									<button type="button" class="email_btn1" onclick="emailBtn1()"
										disabled>인증번호 전송</button>
								</div>
								<div class="display_flex flex_between flex_align_c">
									<form:input type="number" placeholder="인증번호를 입력해주세요."
										id="email_num" data-id="email_num" class="email_num"
										onkeyup="inputKeyup(this)" path="mb_email_check"
										readonly="true"  value="${signupVO.mb_email_check}"/>
									<form:errors path="mb_email_check" class="input_error" />
									<button type="button" class="email_btn2" onclick="emailBtn2()"
										disabled>인증하기</button>
								</div>
								<span>${email_check_error}</span>
							</div>
							<div class="input_box">
								<p>비밀번호</p>
								<form:password class="mb_pass1" id="signup_pw_input1"
									placeholder="영문 대문자 포함 비밀번호 입력"
									path="mb_pass1" onkeyup="pwChk1()"/>
								<form:errors path="mb_pass1" class="input_error" />
								<span hidden>비밀번호는 8 ~ 20자 내의 영문자, 숫자, 특수문자 [ $@$!%*#?& ] 를 필수로 사용해야합니다.</span>
								<!-- <span class="pw_no" hidden="hidden">영문 대문자를 포함하여 비밀번호를 설정해 주세요.</span> -->
							</div>
							<div class="input_box">
								<p>비밀번호 확인</p>
								<form:password class="mb_pass2" id="signup_pw_input2"
									placeholder="비밀번호 확인" path="mb_pass2" onkeyup="pwChk2()"/>
								<form:errors path="mb_pass2" class="input_error pass_check2"/>
								<%-- <span id="password_unmatch">${password_error}</span> --%>
								<span class="pw_chk_no" hidden="hidden">비밀번호가 맞지않습니다.</span>
							</div>
						</div>
					</div>
					<form:hidden path="mb_public" value=""/>
					<form:hidden path="mb_private" value=""/>
					<form:button type="button" onclick="signup_form_submit()" class="request_btn" id="signup_button" disabled="true">회원등록요청</form:button>
			</form:form>
		</div>
	</div>
</div>
</div>

<!-- 약관동의 -->
<input type="hidden" id="terms_radio1" value="${signupVO.agree_check1 eq 'Y' ? 'ok' : 'no'}">
<input type="hidden" id="terms_radio2" value="${signupVO.agree_check2 eq 'Y' ? 'ok' : 'no'}">

<!-- 필수정보입력 -->
<input type="hidden" id="classify_chk" value="${empty signupVO.mb_group ? 'no' : 'ok'}">
<input type="hidden" id="signup_input1" value="${empty signupVO.mb_name ? 'no' : 'ok'}">
<input type="hidden" id="signup_input2" value="${empty signupVO.mb_belong ? 'no' : 'ok'}">
<input type="hidden" id="signup_input3" value="${empty signupVO.mb_position ? 'no' : 'ok'}">

<input type="hidden" id="signup_input4" value="${empty signupVO.mb_addr_zip ? 'no' : 'ok'}">
<input type="hidden" id="signup_input5" value="${empty signupVO.mb_addr ? 'no' : 'ok'}">

<!-- 이메일/ 비밀번호 -->
<input type="hidden" id="email_chk" value="${empty signupVO.mb_email ? 'no' : 'ok'}">
<input type="hidden" id="email_chk2" value="${empty signupVO.mb_email_check ? 'no' : 'ok'}">
<input type="hidden" id="pw_txt1" value="">
<input type="hidden" id="pw_txt2" value="">

<!-- address js -->
<input type="hidden" id="signup_val" value="signup"> 

<c:choose>
	<c:when test="${agree_check eq 'true'}">
		<script type="text/javascript">
			document.addEventListener("DOMContentLoaded", function() {
				$("#radio1").prop("checked", true);
				$("#radio3").prop("checked", true);
				signupNextBtn();
				signupNext();
			});
		</script>
	</c:when>

	<c:when test="${agree_check eq 'false'}">
		<script type="text/javascript">
			document.addEventListener("DOMContentLoaded", function() {
				alertShow("필수약관에 동의해주세요.");
				requestBtn();
			});
		</script>
	</c:when>
</c:choose>
<c:if test="${not empty password_error}">
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		$(".pass_check2").remove();
		requestBtn();
	});
	</script>
</c:if>
<c:if test="${not empty aleady_email_error}">
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		$("#email_input").remove();
		requestBtn();
	});
	</script>
</c:if>
<c:if test="${not empty signup_error}">
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		alertShow("${signup_error}");
	});
	</script>
</c:if>
<c:if test="${not empty addr_error}">
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		errorShow("오류","${addr_error}");
	});
	</script>
</c:if>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		$(".input_error").prev("input").css("border-color","#ff0000");
		$(".input_error_next").next("input").css("border-color","#ff0000");
		requestBtn();
	});
</script>
<!-- scripts -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=595f5411cd84d2dda5e2d9d36b36db1c&libraries=services"></script>