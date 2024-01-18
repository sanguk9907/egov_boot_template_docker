<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="today" class="java.util.Date" />
<fmt:formatDate value="${today}" pattern="HH:mm:ss" var="nowDate" />
<input type="hidden" id="page_type" value="1">
<input type="hidden" id="page_num" value="1">
<div class="home_index_whole">
	<div class="home_index_row home_index_row1 mt30b0 wt50b0">
		<p class="common_main_title mt0b10 wt0b15">종자 NFT 관리</p>
		<div class="w_display_flex flex_nowrap flex_start flex_align_str">
			<c:if test="${mb_group != 'ROLE_USER'}">
				<div class="home_common_box">
					<div class="home_common_top display_flex flex_wrap flex_between flex_align_e w_flex_align_c">
						<p>시드뱅크 신청</p>
						<p class="home_now_time">
							현재 기준
							<span id="now_time2">${nowDate}</span>
						</p>
					</div>
					<div class="home_box_flex display_flex flex_nowrap flex_between flex_align_e">
						<p>총 ${mainInfo.bankcnt}건</p>

						<!--
							한수정: /arboreta/seed/list
							시드뱅크: /seedbank/seed/list
						-->
						<c:if test="${mb_group == 'ROLE_ADMIN'}">
							<a href="/arboreta/seed/list?category1=whole&filter_group=ROLE_BANK" class="common_link_img">
						</c:if>
						<c:if test="${mb_group == 'ROLE_BANK'}">
							<a href="/seedbank/seed/list?category1=whole&filter_group=ROLE_BANK" class="common_link_img">
						</c:if>
						<span></span>
						</a>
					</div>
				</div>
			</c:if>
			<div class="home_common_box">
				<div class="home_common_top display_flex flex_wrap flex_between flex_align_e w_flex_align_c">
					<p>분양 신청</p>
					<p class="home_now_time">
						현재 기준
						<span id="now_time3">${nowDate}</span>
					</p>
				</div>
				<div class="home_box_flex display_flex flex_nowrap flex_between flex_align_e">
					<p>총 ${mainInfo.inheritcnt}건</p>
					<!--
							한수정: /arboreta/seed/list
							시드뱅크: /seedbank/seed/list
							기타: /other/seed/list
						-->
					<c:if test="${mb_group == 'ROLE_ADMIN'}">
						<a href="/arboreta/seed/list?category1=whole&filter_group=ROLE_USER" class="common_link_img">
					</c:if>
					<c:if test="${mb_group == 'ROLE_BANK'}">
						<a href="/seedbank/seed/list?category1=whole&filter_group=ROLE_USER" class="common_link_img">
					</c:if>
					<c:if test="${mb_group == 'ROLE_USER'}">
						<a href="/other/current/list??category1=title&filter_approval=inherit_call" class="common_link_img">
					</c:if>
					<span></span>
					</a>
				</div>
			</div>
			<%-- <c:if test="${mb_group eq 'ROLE_USER'}">
				<div class="home_common_box">
					<div class="home_common_top display_flex flex_wrap flex_between flex_align_e w_flex_align_c">
						<p>분양 결과 리포트 신청</p>
						<p class="home_now_time">
							현재 기준
							<span id="now_time3">${nowDate}</span>
						</p>
					</div>
					<div class="home_box_flex display_flex flex_nowrap flex_between flex_align_e">
						<p>총 ${mainInfo.reportcnt}건</p>
						<a href="/other/current/list?category1=title&filter_group=INHERIT_COMPLETE&filter_group=PLANTING_COMPLETE&filter_group=EXPER_COMPLETE" class="common_link_img">
							<span></span>
						</a>
					</div>
				</div>
			</c:if> --%>
		</div>
	</div>


	<c:if test="${mb_group eq 'ROLE_ADMIN'}">
		<!-- 한수정일 때만 뜨도록 -->
		<div class="home_index_row home_index_row2 mt50b0">
			<p class="common_main_title mt0b10 wt0b15">서명요청</p>
			<div class="w_display_flex flex_wrap flex_start flex_align_str">
				<div class="home_common_box">
					<div class="home_common_top display_flex flex_wrap flex_between flex_align_e w_flex_align_c">
						<p>회원가입 요청</p>
						<p class="home_now_time">
							현재 기준
							<span id="now_time2">${nowDate}</span>
						</p>
					</div>
					<div class="home_box_flex display_flex flex_nowrap flex_between flex_align_e">
						<p>총 ${mainInfo.signupcallcnt}건</p>
						<a href="/user/list?filter_user=whole&filter_group=whole&filter_approval=N" class="common_link_img">
							<span></span>
						</a>
					</div>
				</div>
				<div class="home_common_box">
					<div class="home_common_top display_flex flex_wrap flex_between flex_align_e w_flex_align_c">
						<p>시드뱅크 요청</p>
						<p class="home_now_time">
							현재 기준
							<span id="now_time3">${nowDate}</span>
						</p>
					</div>
					<div class="home_box_flex display_flex flex_nowrap flex_between flex_align_e">
						<p>총 ${mainInfo.bankcallcnt}건</p>
						<a href="/arboreta/seed/list?category1=whole&filter_group=ROLE_BANK&filter_approval=N" class="common_link_img">
							<span></span>
						</a>
					</div>
				</div>
				<div class="home_common_box">
					<div class="home_common_top display_flex flex_wrap flex_between flex_align_e w_flex_align_c">
						<p>분양 요청</p>
						<p class="home_now_time">
							현재 기준
							<span id="now_time3">${nowDate}</span>
						</p>
					</div>
					<div class="home_box_flex display_flex flex_nowrap flex_between flex_align_e">
						<p>총 ${mainInfo.inheritcallcnt}건</p>
						<a href="/arboreta/seed/list?category1=whole&filter_group=ROLE_USER&filter_approval=N" class="common_link_img">
							<span></span>
						</a>
					</div>
				</div>
				<div class="home_common_box">
					<div class="home_common_top display_flex flex_wrap flex_between flex_align_e w_flex_align_c">
						<p>분양 결과 리포트 요청</p>
						<p class="home_now_time">
							현재 기준
							<span id="now_time3">${nowDate}</span>
						</p>
					</div>
					<div class="home_box_flex display_flex flex_nowrap flex_between flex_align_e">
						<p>총 ${mainInfo.reportcallcnt}건</p>
						<a href="/arboreta/result/list" class="common_link_img">
							<span></span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</c:if>

	<c:if test="${mb_group eq 'ROLE_BANK'}">
		<!-- 시드뱅크일 때만 뜨도록 -->
		<div class="home_index_row home_index_row3 mt50b0">
			<p class="common_main_title mt0b10 wt0b15">승인관리</p>
			<div class="log_whole">
				<div class="log_row w_display_flex flex_wrap flex_align_c w_display_flex flex_wrap flex_align_c">
					<p>분양 승인</p>
					<a href="/seedbank/seed/list?category1=whole&filter_group=ROLE_USER&filter_approval=Y">총 ${mainInfo.inheritaprvcnt}건</a>
				</div>
				<div class="log_row w_display_flex flex_wrap flex_align_c">
					<p>분양 미승인</p>
					<a href="/seedbank/seed/list?category1=whole&filter_group=ROLE_USER&filter_approval=N">총 ${mainInfo.inheritcallcnt}건</a>
				</div>
				<div class="display_flex flex_wrap flex_between flex_align_e">
					<p class="home_now_time">
						현재 기준
						<span id="now_time5">${nowDate}</span>
					</p>
					<a href="/seedbank/seed/list?category1=whole&filter_group=ROLE_USER" class="common_link_img">
						<span></span>
					</a>
				</div>
			</div>
		</div>
	</c:if>

	<div class="home_index_row home_index_row4 mt50b0">
		<p class="common_main_title mt0b10 wt0b15">이벤트 이력 조회</p>
		<div class="log_whole">
			<div class="log_row w_display_flex flex_wrap flex_align_c w_display_flex flex_wrap flex_align_c">
				<p>시드뱅크 이벤트 이력</p>
				<a href="/history/data/list">총 ${mainInfo.bankeventcnt}건</a>
			</div>
			<div class="log_row w_display_flex flex_wrap flex_align_c">
				<p>분양 이벤트 이력</p>
				<a href="/history/log/list">총 ${mainInfo.inheriteventcnt}건</a>
			</div>
			<div class="display_flex flex_wrap flex_between flex_align_e">
				<p class="home_now_time">
					현재 기준
					<span id="now_time5">${nowDate}</span>
				</p>
				<a href="/history/data/list" class="common_link_img">
					<span></span>
				</a>
			</div>
		</div>
	</div>
</div>
<c:if test="${not empty exception}">
	<script type="text/javascript">
	    setTimeout(()=>{alertShow("${exception}")},100)
	    </script>
</c:if>