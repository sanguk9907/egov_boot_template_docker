<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- alert 팝업 -->
<div class="common_pop_whole common_alert_whole">
	<div class="common_alert_bg"></div>
	<div class="common_alert_box">
		<p class="common_alert_txt">내용</p>
		<button type="button" class="common_alert_ok" onclick="alertPopOk()">확인</button>
	</div>
</div>


<!-- confirm 팝업 -->
<div class="common_pop_whole common_confirm_whole">
	<div class="common_confirm_bg"></div>
	<div class="common_confirm_box">
		<p class="common_confirm_txt">내용</p>
		<p class="common_confirm_txt2">서브 내용</p>
		<div class="display_flex flex_nowrap flex_center flex_align_c">
			<button type="button" class="common_confirm_btn" id="common_confirm_ok" onclick="confirmOk()">예</button>
			<button type="button" class="common_confirm_btn" id="common_confirm_no" onclick="commonHide()">닫기</button>
		</div>
	</div>
</div>


<!-- stand by -->
<div class="common_pop_whole common_stanby_whole">
	<div class="common_stanby_bg"></div>
	<div class="common_stanby_box">
		<p class="common_stanby_txt">제목문구</p>
		<p class="common_stanby_txt2">서브문구</p>
		<div class="loading_icon">
			<span></span>
			<span></span>
			<span></span>
			<span></span>
			<span></span>
			<span></span>
			<span></span>
			<span></span>
		</div>
	</div>
</div>


<!-- 오류코드 -->
<div class="common_pop_whole common_error_whole">
	<div class="common_error_bg"></div>
	<div class="common_error_box">
		<img src="/images/icon/error_icon_rd.svg" alt="">
		<p class="common_error_txt">[오류코드]</p>
		<p class="common_error_txt2">오류문구</p>
		<div class="display_flex flex_nowrap flex_center flex_align_c">
			<button type="button" class="common_error_ok" id="common_error_ok" onclick="errorOk()">확인</button>
		</div>
	</div>
</div>


<input type="hidden" id="popup_type" value="">

<!--약관-->
<div class="conditions_popup">
	<div class="conditions_bg">
		<div class="loading_whole">
			<p class="conditions_title">약관이름</p>
			<img src="/images/logo/header_logo_web_wh.svg" alt="" class="conditions_logo">
			<p class="conditions_txt">
				약관 로딩 중입니다.
				<br />
				잠시만 기다려주세요.
			</p>
		</div>
	</div>
	<div class="conditions_box">
		<div class="conditions_load"></div>
		<div class="conditions_btn_whole display_flex flex_nowrap flex_center flex_align_c">
			<button type="button" onclick="termHide()" class="conditions_btn">닫기</button>
		</div>
	</div>
</div>



<!-- 이미지 크게보기 -->
<div class="big_popup" hidden="hidden">
	<div class="big_popup_bg" onclick="nftBigHide()"></div>
	<div class="big_popup_img">
		<img src="" alt="" class="">
	</div>
</div>


<!-- 이력관리(history) 이벤트 이력 팝업 -->
<div class="event_history_popup common_pop_whole">
	<div class="event_history_bg"></div>
	<div class="event_history_whole">
		<div class="event_history_inner">
			<h3 class="popup_title">이벤트 이력</h3>
			<div class="sub_title_box">
				<div class="display_flex flex_start flex_align_s">
					<p>종자명</p>
					<p>${detail.species_kr}(${detail.species})</p>
				</div>
				<div class="display_flex flex_start flex_align_s">
					<p>등록일</p>
					<c:set var="substringResult" value="${fn:substring(detail.regdate, 0, 19)}" />
					<p>${fn:replace(substringResult,'-','.')}</p>
				</div>
				<div class="display_flex flex_start flex_align_s">
					<p>작성자</p>
					<p>${detail.mb_name}</p>
				</div>
			</div>
			<!-- history_content_whole 내부 스크롤  -->
			<div class="history_content_whole">
				<div class="history_content_inner">
					<div class="history_content">
						<h4>현재위치</h4>
						<div class="history_list">
							<ul>
								<li>
									<p>기관</p>
									<p>${detail.organization}</p>
								</li>
								<li>
									<p>주소</p>
									<c:if test="${detail.user_addr1 ne null}">
										<p>${detail.user_addr1}${detail.user_addr2 eq null ? '' : ', '}${detail.user_addr2}</p>
									</c:if>
									<c:if test="${detail.user_addr1 eq null}">
										<p>${detail.now_addr1}${detail.now_addr2 eq null ? '' : ', '}${detail.now_addr2}</p>
									</c:if>
								</li>
								<li>
									<p>위도</p>
									<p>${detail.latitude}</p>
								</li>
								<li>
									<p>경도</p>
									<p>${detail.longitude}</p>
								</li>
							</ul>
						</div>
					</div>
					<div class="history_content history_occur">
						<h4>
							이벤트 발생
							<span>${eventList.size()}</span>
							건
						</h4>
						<!-- history_list - 반복 -->
						<c:forEach items="${eventList}" var="list">
							<div class="history_list">
								<p class="day">
									<c:set var="substringResult" value="${fn:substring(list.regdate, 0, 19)}" />
									${fn:replace(substringResult,'-','.')}
								</p>
								<ul>
									<li>
										<p>기관</p>
										<p>${list.mb_belong}</p>
									</li>
									<li>
										<p>주소</p>
										<p>${list.mb_addr}${list.mb_addr2 eq null or empty list.mb_addr2 ? '' : ', '}${list.mb_addr2}</p>
									</li>
									<li>
										<p>위도</p>
										<p>${list.mb_lat}</p>
									</li>
									<li>
										<p>경도</p>
										<p>${list.mb_lng}</p>
									</li>
									<li>
										<p>내용</p>
										<p>${list.situation}</p>
									</li>
								</ul>
							</div>
						</c:forEach>

						<!-- <div class="history_list">
							<p class="day">0000.00.00</p>
							<ul>
								<li>
									<p>기관</p>
									<p>데일리연구소</p>
								</li>
								<li>
									<p>주소</p>
									<p>대전광역시 아무구 아무동 123</p>
								</li>
								<li>
									<p>위도</p>
									<p>32.8387482364896238746823</p>
								</li>
								<li>
									<p>경도</p>
									<p>123.384234234</p>
								</li>
							</ul>
						</div> -->
					</div>
				</div>
			</div>
			<div class="popup_cloes_box">
				<button type="button" class="popup_cloes" onclick="commonHide()">닫기</button>
			</div>
		</div>
	</div>
</div>



<!-- 현황관리 팝업 -->
<div class="data_change_whole common_pop_whole">
	<div class="data_change_bg"></div>
	<div class="data_change_box">
		<p class="data_change_title">현황관리</p>
		<div class="data_change_inner">
			<div class="data_change_wflex w_display_flex flex_nowrap flex_start flex_align_c">
				<p class="data_change_subtitle">
					<span>종자명</span>
					종자명(종자영문명)
				</p>
				<p class="data_change_subtitle">
					<span>등록일</span>
					0000.00.00 00:00:00
				</p>
				<p class="data_change_subtitle">
					<span>작성자</span>
					이름
				</p>
			</div>
			<div class="data_change_wflex data_change_content">
				<a href="/other/seed/detail" class="seed_detail">상세페이지로 이동 ></a>
				<div class="signature_situation display_flex flex_start flex_align_c">
					<p class="signature_title">1차 서명현황</p>
					<p class="situation_text">승인대기중/승인완료</p>
				</div>
			</div>

			<!-- 서명현황 리스트 -->
			<div class="common_signature_whole">
				<p class="common_signature_maintitle">서명현황</p>
				<div class="common_signature_box">
					<div class="common_signature_title common_signature_border">
						<div class="common_signature_flex display_flex flex_nowrap flex_between flex_align_c">
							<p>Transfer TRX</p>
							<p>
								<span>0</span>
								TRX
							</p>
						</div>
						<div class="common_signature_copy display_flex flex_nowrap flex_between flex_align_c">
							<p>Initiated by:</p>
							<div class="display_flex flex_nowrap flex_end flex_align_c">
								<input type="text" class="common_signature_input" id="common_signature_transfer1" value="TLakdhfueikfkahksdhlftLakdhfueikfkahksdhlf" readonly>
								<button type="button" class="common_signature_copy_btn" onclick="copyValue1()">
									<span></span>
								</button>
							</div>
						</div>
						<div class="common_signature_copy display_flex flex_nowrap flex_between flex_align_c">
							<p>Received by:</p>
							<div class="display_flex flex_nowrap flex_end flex_align_c">
								<input type="text" class="common_signature_input" id="common_signature_transfer2" value="TLakdhfueikfkahksdhlftLakdhfueikfkahksdhlf" readonly>
								<button type="button" class="common_signature_copy_btn" onclick="copyValue2()">
									<span></span>
								</button>
							</div>
						</div>
						<div class="common_signature_copy display_flex flex_nowrap flex_between flex_align_c">
							<p>Time:</p>
							<p>0000-00-00 00:00:00</p>
						</div>
						<div class="common_signature_copy display_flex flex_nowrap flex_between flex_align_c">
							<p>Hash:</p>
							<div class="display_flex flex_nowrap flex_end flex_align_c">
								<input type="text" class="common_signature_input" id="common_signature_transfer3" value="TLakdhfueikfkahksdhlftLakdhfueikfkahksdhlf" readonly>
								<button type="button" class="common_signature_copy_btn" onclick="copyValue3()">
									<span></span>
								</button>
							</div>
						</div>
					</div>
					<div class="common_signature_progress common_signature_border">
						<p>Progress: 2/10</p>
						<p>(Broadcast when weights > 10)</p>
						<div class="progressbar">
							<progress value="20" max="100" id=""></progress>
						</div>
					</div>
					<div class="common_signature_row_whole">
						<!--
		    						common_signature_row div 반복
		    						아직 사인 안 된 리스트에는 common_signature_row div에 common_signature_row_none 클래스명 추
								-->
						<div class="common_signature_row common_signature_border display_flex flex_nowrap flex_between flex_align_c w_display_block">
							<div class="common_signature_row_title w_display_flex flex_nowrap flex_start flex_align_c">
								<p>ID</p>
								<p>Transaction Hash</p>
								<p>Sign</p>
							</div>
							<div class="common_signature_row_info w_display_flex flex_nowrap flex_start flex_align_c">
								<p>sample@naver.com</p>
								<p>TLakdhfueiksdjkfhdhfkehk23u3jhk23h4jk2k3ekn3jkhfehfkah</p>
								<p>
									0
									<!-- 
		    									이미 사인 완료 : <img src="/images/icon/signature_chk_active.svg" alt="">
		    									아직 사인 안함 : <img src="/images/icon/signature_chk_unactive.svg" alt="">
		    								-->
									<img src="/images/icon/signature_chk_active.svg" alt="">
								</p>
							</div>
						</div>
						<div class="common_signature_row common_signature_row_none common_signature_border display_flex flex_nowrap flex_between flex_align_c w_display_block">
							<div class="common_signature_row_title w_display_flex flex_nowrap flex_start flex_align_c">
								<p>ID</p>
								<p>Transaction Hash</p>
								<p>Sign</p>
							</div>
							<div class="common_signature_row_info w_display_flex flex_nowrap flex_start flex_align_c">
								<p>sample@naver.com</p>
								<p>TLakdhfueiksdjkfhdhfkehk23u3jhk23h4jk2k3ekn3jkhfehfkah</p>
								<p>
									0
									<!-- 
		    									이미 사인 완료 : <img src="/images/icon/signature_chk_active.svg" alt="">
		    									아직 사인 안함 : <img src="/images/icon/signature_chk_unactive.svg" alt="">
		    								-->
									<img src="/images/icon/signature_chk_unactive.svg" alt="">
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="btn_flex_whole display_flex flex_wrap flex_center flex_align_c">
					<button type="button" onclick="situatioCancel()" class="change_cancel_btn">분양취소</button>
					<button type="button" onclick="commonHide()" class="close_btn">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>





<!-- 현황 업데이트 팝업 -->
<div class="present_update_popup">
	<div class="update_popup_bg"></div>
	<div class="present_update_whole">
		<p class="present_update_title">현황 업데이트</p>
		<div class="present_update_inner">
			<div class="popup_input_select">
				<ul>
					<li>
						<p class="update_title">제목</p>
						<input type="text" name="situation_title" placeholder="입력">
					</li>
					<li>
						<p class="update_title">종자선택</p>
						<div class="common_filter_search">
							<div class="select_group_box">
								<select id="category1" name="category1" class="common_filter_select select_group2">
									<option value="whole">선택</option>
								</select>
								<input type="hidden" id="category1_content" name="category1_content" />
							</div>
						</div>
					</li>
					<li>
						<p class="update_title">현황</p>
						<div>
							<div class="common_filter_search">
								<div class="select_group_box">
									<select id="category2" name="category2" class="common_filter_select select_group2">
										<option value="whole">선택</option>
										<!-- <option value="INHERIT">분양중</option> -->
										<!-- <option value="PARCEL">분양완료</option> -->
										<!-- <option value="PLANTING">식재중</option> -->
										<option value="PLANTING">식재</option>
										<!-- <option value="EXPER">실험중</option> -->
										<option value="EXPER">실험</option>
										<!-- <option value="ETC">기타</option> -->
										<option value="MOVE">이동</option>
									</select>
									<input type="hidden" id="category2_content" name="category2_content" />
								</div>
							</div>
							<input type="text" placeholder="입력" name="situation_etc">
						</div>
					</li>
					<li class="popup_add">
						<p class="update_title">주소검색</p>
						<div class="data_box">
							<div class="input_flex_whole">
								<div class="input_flex w_display_flex flex_nowrap flex_start flex_align_c">
									<input type="number" id="join_adr1" placeholder="우편번호" name="now_zip" class="signup_input" value="${member.MB_ADDR_ZIP}" readonly>
									<button type="button" class="add_btn" onclick="openAddressSearch(this)">주소 검색</button>
								</div>
								<input type="text" id="join_adr2" placeholder="주소" class="signup_input" name="now_addr1" value="${member.MB_ADDR}" readonly>
								<input type="text" id="join_adr3" placeholder="상세주소를 입력해주세요." name="now_addr2" value="${member.MB_ADDR2}" class="signup_input">
								<input type="number" id="latitude" placeholder="위도" name="latitude" value="${member.MB_LAT}" class="signup_input">
								<input type="number" id="longitude" placeholder="경도" name="longitude" value="${member.MB_LNG}" class="signup_input">
								<!-- hidden_address - 참고항목 -->
								<div id="wrap" class="address_wrap"></div>
							</div>
						</div>
					</li>
					<li>
						<p class="update_title">관리기관</p>
						<div>
							<input type="text" placeholder="입력" id="organization" name="organization" value="${member.MB_BELONG}">
						</div>
					</li>
					<li class="display_flex flex_align_c flex_start">
						<p class="update_title">파일등록</p>
						<div class="update_filebox_whole">
							<div class="update_filebox">
								<div class="input_box" name="input_border">
									<label for="input_file" class="input_file">
										<!-- onclick="load_file(this)" -->
										파일선택
										<input type="file" id="input_file" class="upload_hidden">
									</label>
									<!-- <img src="/images/icon/trunk_default.svg" alt="기본 이미지" class="trunk_default"> -->
									<input class="upload_name" name="upload" value="선택한 파일 없음" disabled="disabled">
								</div>
							</div>
						</div>
					</li>
					<li class="display_flex flex_align_c flex_start">
						<p class="update_title">날짜</p>
						<div class="data_box">
							<div class="filter_calendar_area w_display_flex flex_nowrap flex_start flex_align_c">
								<div class="display_flex flex_nowrap flex_start flex_align_s">
									<input type="text" id="report_date" class="date_input" value="" placeholder="0000.00.00" disabled>
									<button type="button" class="date_click_btn">
										<span></span>
									</button>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<div class="approve_box">
				<div class="approve_title">
					<p>승인</p>
					<p class="approve_app">파일선택으로 개인키를 인증해주세요.</p>
					<!-- <p class="approve_web">드래그 앤 드롭(또는 파일선택)으로 개인키를 인증해주세요.</p> -->
				</div>
				<div class="filebox_whole">
					<div class="filebox">
						<div id="drop" class="input_box">
							<label for="thumb_pic" class="input_file">
								<input type="file" accept=".txt" id="thumb_pic" hidden="hidden" onchange="handleFiles(this.files)">
							</label>
							<img src="/images/icon/trunk_default.svg" alt="" class="trunk_default">
							<div id="thumbnails"></div>
						</div>
					</div>
					<input type="hidden" id="check_private" value="N" />
					<button type="button" class="approve_btn" onclick="personallyOk()">확인</button>
				</div>
			</div>

			<div class="present_update_btn">
				<button type="button" class="present_ok" onclick="presentUpdate()">등록요청</button>
				<button type="button" class="present_close" onclick="updateHide()">닫기</button>
			</div>

		</div>
	</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=595f5411cd84d2dda5e2d9d36b36db1c&libraries=services"></script>