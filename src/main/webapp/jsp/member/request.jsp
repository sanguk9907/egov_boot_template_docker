<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="member_whole">
		<div class="signup_whole">
			<div class="find_title">
				<p>회원가입</p>
			</div>
			<div class="signup_inner">
				<div class="stage_box">
					<div class="display_flex flex_align_c flex_between">
						<label for="stage1" class="stage_label1">
							<input type="checkbox" id="stage1" hidden="hidden" disabled >
							<span></span>
							<span class="text">회원약관</span>
						</label>
						<label for="stage2" class="stage_label2">
							<input type="checkbox" id="stage2" hidden="hidden" disabled>
							<span></span>
							<span class="text">회원등록요청</span>
						</label>
						<!-- 승인대기일때 stage_label3 - show / stage_label4 - hide  -->
						<c:if test="${signupVO.mb_group eq 'ROLE_ADMIN' }">
						<label for="stage3" class="stage_label3">
							<input type="checkbox" id="stage3" hidden="hidden" disabled checked>
							<span></span>
							<span class="text">승인대기</span>
						</label>
						</c:if>
						<!-- 가입완료일때 stage_label3 - hide / stage_label4 - show  -->
						<c:if test="${signupVO.mb_group ne 'ROLE_ADMIN' }">
						<label for="stage4" class="stage_label4">
							<input type="checkbox" id="stage3" hidden="hidden" disabled checked>
							<span></span>
							<span class="text">가입완료</span>
						</label>
						</c:if>
					</div>
				</div>
				<div class="request_whole">
					<img src="/images/icon/request_chk_icon.svg" alt="회원등록요청 완료 체크 아이콘">
					<c:if test="${signupVO.mb_group eq 'ROLE_ADMIN' }">
						<p class="subtext1 request_on">회원등록요청이 완료되었습니다.<br>
							승인완료까지 시간이 걸립니다.
						</p>
					</c:if>
					<c:if test="${signupVO.mb_group ne 'ROLE_ADMIN' }">
						<p class="subtext1 request_ok">가입이 완료되었습니다.<br>
							하단의 개인키 다운로드 버튼을 눌러주세요.
						</p>
					</c:if>
					<!-- 가입이 완료 되었을때 request_ok - show/ request_on - hide  -->
					
					<p class="subtext2">*아래 개인키를 다운로드 받은 후 안전한 곳에 보관해주세요.<br>
						<span>개인키 분실 시 책임은 본인에게 있습니다.</span>
					</p>
					<button type="button" class="individual_key" onclick="download_private_key()">개인키 다운로드</button>
					<button type="button" onclick="loginGo()" class="check_btn">확인</button>
				</div>
			</div>
		</div>
	</div>