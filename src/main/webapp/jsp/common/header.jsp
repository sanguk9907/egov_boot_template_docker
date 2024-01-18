<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header class="header_section">
	<img onclick="logoClick()" src="/images/logo/header_logo_web.svg" alt="수목원 로고" class="w_header_logo header_web">
	<div class="header_top_flex header_common_box header_app">
		<div class="display_flex flex_nowrap flex_between flex_align_c ">
			<img onclick="logoClick()" src="/images/logo/header_logo_app.svg" alt="수목원 로고" class="header_logo">
			<button type="button" class="hamberger_icon header_app">
				<span></span>
				<span></span>
				<span></span>
			</button>
		</div>
	</div>
	<div class="header_menu_whole none">
		<div class="header_menu_bg"></div>
		<div class="header_menu_box">
			<nav class="header_menu_inner w_display_flex flex_nowrap flex_between flex_align_c">
				<ul class="w_display_flex flex_nowrap flex_end flex_align_c">
					<li onclick="window.location.href='/'" id="1_1" class="header_li_txt header_li_txt1">모니터링</li>
					<li onclick="window.location.href='/mypage/main'" id="10_1" class="header_li_txt header_li_txt10">마이페이지</li>
					<li class="header_li_txt header_li_txt2">
						회원목록
						<ul>
							<li onclick="window.location.href='/user/list'" id="2_1" class="header_li_txt2_1">회원목록</li>
							<li onclick="window.location.href='/user/info'" id="2_2" class="header_li_txt2_2">내 정보</li>
						</ul>
					</li>
					<li class="header_li_txt header_li_txt3">
						종자 NFT 관리
						<ul>
							<li onclick="window.location.href='/arboreta/seed/list'" id="3_1" class="header_li_txt3_1">Seed NFT</li>
							<li onclick="window.location.href='/arboreta/current/list'" id="3_2" class="header_li_txt3_2">현황 관리</li>
							<li onclick="window.location.href='/arboreta/result/list'" id="3_3" class="header_li_txt3_3">분양 결과 리포트</li>
						</ul>
					</li>
					<li class="header_li_txt header_li_txt4">
						종자 NFT 관리
						<ul>
							<li onclick="window.location.href='/seedbank/seed/list'" id="4_1" class="header_li_txt4_1">Seed NFT</li>
							<li onclick="window.location.href='/seedbank/current/list'" id="4_2" class="header_li_txt4_2">내 시드뱅크 현황</li>
							<li onclick="window.location.href='/seedbank/result/list'" id="4_3" class="header_li_txt4_3">분양 결과 리포트</li>
						</ul>
					</li>
					<li class="header_li_txt header_li_txt5">
						종자 NFT 관리
						<ul>
							<li onclick="window.location.href='/other/seed/list'" id="5_1" class="header_li_txt5_1">시드뱅크 종자 목록</li>
							<li onclick="window.location.href='/other/current/list'" id="5_2" class="header_li_txt5_2">내 분양 현황</li>
						</ul>
					</li>
					<li class="header_li_txt header_li_txt6">
						이력관리
						<ul>
							<li onclick="window.location.href='/history/data/list'" id="6_1" class="header_li_txt6_1">시드뱅크 이벤트 이력[로그]</li>
							<li onclick="window.location.href='/history/log/list'" id="6_2" class="header_li_txt6_2">분양 이벤트 이력[로그]</li>
						</ul>
					</li>
					<li class="header_li_txt header_li_txt7">
						통계
						<ul>
							<li onclick="window.location.href='/graph/user/list'" id="7_1" class="header_li_txt7_1">사용자 방문 통계</li>
							<li onclick="window.location.href='/statistics/data/day'" id="7_2" class="header_li_txt7_2">데이터 등록 통계</li>
						</ul>
					</li>
					<li class="header_li_txt header_li_txt8" onclick="termOpen(this)" data-id="terms_btn1">약관1</li>
					<li class="header_li_txt header_li_txt9" onclick="termOpen(this)" data-id="terms_btn2">약관2</li>
					<!-- 권한별 NAV -->
					<%-- <li onclick="window.location.href='/'" id="1_1" class="header_li_txt header_li_txt1">모니터링</li>
					<sec:authorize access="hasAnyRole('ROLE_BANK','ROLE_USER')">
						<li onclick="window.location.href='/mypage/main'" id="10_1" class="header_li_txt header_li_txt10">마이페이지</li>
					</sec:authorize>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
						<li class="header_li_txt header_li_txt2">
							회원목록
							<ul>
								<li onclick="window.location.href='/user/list'" id="2_1" class="header_li_txt2_1">회원목록</li>
								<li onclick="window.location.href='/user/info'" id="2_2" class="header_li_txt2_2">내 정보</li>
							</ul>
						</li>
						<li class="header_li_txt header_li_txt3">
							종자 NFT 관리
							<ul>
								<li onclick="window.location.href='/arboreta/seed/list'" id="3_1" class="header_li_txt3_1">Seed NFT</li>
								<li onclick="window.location.href='/arboreta/current/list'" id="3_2" class="header_li_txt3_2">현황 관리</li>
								<li onclick="window.location.href='/arboreta/result/list'" id="3_3" class="header_li_txt3_3">분양 결과 리포트</li>
							</ul>
						</li>
					</sec:authorize>
					<sec:authorize access="hasAnyRole('ROLE_BANK')">
						<li class="header_li_txt header_li_txt4">
							종자 NFT 관리
							<ul>
								<li onclick="window.location.href='/seedbank/seed/list'" id="4_1" class="header_li_txt4_1">Seed NFT</li>
								<li onclick="window.location.href='/seedbank/current/list'" id="4_2" class="header_li_txt4_2">내 시드뱅크 현황</li>
								<li onclick="window.location.href='/seedbank/result/list'" id="4_3" class="header_li_txt4_3">분양 결과 리포트</li>
							</ul>
						</li>
					</sec:authorize>
					<sec:authorize access="hasAnyRole('ROLE_USER')">
						<li class="header_li_txt header_li_txt5">
							종자 NFT 관리
							<ul>
								<li onclick="window.location.href='/other/seed/list'" id="5_1" class="header_li_txt5_1">시드뱅크 종자 목록</li>
								<li onclick="window.location.href='/other/current/list'" id="5_2" class="header_li_txt5_2">내 분양 현황</li>
							</ul>
						</li>
					</sec:authorize>
					<li class="header_li_txt header_li_txt6">
						이력관리
						<ul>
							<li onclick="window.location.href='/history/data/list'" id="6_1" class="header_li_txt6_1">시드뱅크 이벤트 이력[로그]</li>
							<li onclick="window.location.href='/history/log/list'" id="6_2" class="header_li_txt6_2">분양 이벤트 이력[로그]</li>
						</ul>
					</li>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
						<li class="header_li_txt header_li_txt7">
							통계
							<ul>
								<li onclick="window.location.href='/graph/user/list'" id="7_1" class="header_li_txt7_1">사용자 방문 통계</li>
								<li onclick="window.location.href='/statistics/data/day'" id="7_2" class="header_li_txt7_2">데이터 등록 통계</li>
							</ul>
						</li>
					</sec:authorize>
					<li class="header_li_txt header_li_txt8" onclick="termOpen(this)" data-id="terms_btn1">약관1</li>
					<li class="header_li_txt header_li_txt9" onclick="termOpen(this)" data-id="terms_btn2">약관2</li> --%>
				</ul>
				<div class="header_login_signup display_flex flex_nowrap flex_start flex_align_c">
					<!-- 로그인 전 -->
					<!-- <p onclick="window.location.href='/member/login'">로그인</p>
					<p onclick="window.location.href='/member/signup'">회원가입</p> -->

					<!-- 로그인 후 -->
					<button type="button" onclick="alarmList()" class="alarm_btn">
						<img src="/images/icon/alarm_cir.svg" alt="알림 아이콘">
						<!-- 읽지 않은 알림이 있다면 span에 alarm_on 클래스명을 넣어주세요 -->
						<span class="" id="alarm_icon"></span>
					</button>
					<%-- <form id="logout" action="/logout" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
					<sec:authorize access="isAuthenticated()">
						<p onclick="document.getElementById('logout').submit();">로그아웃</p>
					</sec:authorize> --%>
				</div>
			</nav>
		</div>
	</div>



	<!-- 웹사이즈 좌측 사이드 메뉴 -->
	<nav class="web_side_whole w_display_block">
		<!-- home -->
		<div class="web_side_inner" id="web_side_inner1">
			<p class="web_side_title">모니터링</p>
			<ul>
				<li class="web_side_subtitle sub_on">모니터링</li>
			</ul>
		</div>

		<!-- mypage -->
		<div class="web_side_inner" id="web_side_inner10">
			<p class="web_side_title">마이페이지</p>
			<ul>
				<li class="web_side_subtitle sub_on">내 정보</li>
			</ul>
		</div>

		<!-- user -->
		<div class="web_side_inner" id="web_side_inner2">
			<p class="web_side_title">회원목록</p>
			<ul>
				<li onclick="window.location.href='/user/list'" id="web_side_subtitle2_1" class="web_side_subtitle">회원목록</li>
				<li onclick="window.location.href='/user/info'" id="web_side_subtitle2_2" class="web_side_subtitle">내 정보</li>
			</ul>
		</div>

		<!-- arboreta -->
		<div class="web_side_inner" id="web_side_inner3">
			<p class="web_side_title">종자 NFT 관리</p>
			<ul>
				<li onclick="window.location.href='/arboreta/seed/list'" id="web_side_subtitle3_1" class="web_side_subtitle">Seed NFT</li>
				<li onclick="window.location.href='/arboreta/current/list'" id="web_side_subtitle3_2" class="web_side_subtitle">현황 관리</li>
				<li onclick="window.location.href='/arboreta/result/list'" id="web_side_subtitle3_3" class="web_side_subtitle">분양 결과 리포트</li>
			</ul>
		</div>

		<!-- seedbank -->
		<div class="web_side_inner" id="web_side_inner4">
			<p class="web_side_title">종자 NFT 관리</p>
			<ul>
				<li onclick="window.location.href='/seedbank/seed/list'" id="web_side_subtitle4_1" class="web_side_subtitle">Seed NFT</li>
				<li onclick="window.location.href='/seedbank/current/list'" id="web_side_subtitle4_2" class="web_side_subtitle">내 시드뱅크 현황</li>
				<li onclick="window.location.href='/seedbank/result/list'" id="web_side_subtitle4_3" class="web_side_subtitle">분양 결과 리포트</li>
			</ul>
		</div>

		<!-- other -->
		<div class="web_side_inner" id="web_side_inner5">
			<p class="web_side_title">종자 NFT 관리</p>
			<ul>
				<li onclick="window.location.href='/other/seed/list'" id="web_side_subtitle5_1" class="web_side_subtitle">시드뱅크 종자 목록</li>
				<li onclick="window.location.href='/other/current/list'" id="web_side_subtitle5_2" class="web_side_subtitle">내 분양 현황</li>
			</ul>
		</div>

		<!-- history -->
		<div class="web_side_inner" id="web_side_inner6">
			<p class="web_side_title">이력관리</p>
			<ul>
				<li onclick="window.location.href='/history/data/list'" id="web_side_subtitle6_1" class="web_side_subtitle">시드뱅크 이벤트 이력[로그]</li>
				<li onclick="window.location.href='/history/log/list'" id="web_side_subtitle6_2" class="web_side_subtitle">분양 이벤트 이력[로그]</li>
			</ul>
		</div>

		<!-- graph -->
		<div class="web_side_inner" id="web_side_inner7">
			<p class="web_side_title">통계</p>
			<ul>
				<li onclick="window.location.href='/graph/user/list'" id="web_side_subtitle7_1" class="web_side_subtitle">사용자 방문 통계</li>
				<li onclick="window.location.href='/statistics/data/day'" id="web_side_subtitle7_2" class="web_side_subtitle">데이터 등록 통계</li>
			</ul>
		</div>
	</nav>


	<div class="common_route_box">
		<div class="common_route_inner display_flex flex_wrap flex_start flex_align_c">
			<img src="/images/icon/menu_home_icon.svg" alt="홈 아이콘">
			<p class="route_home_txt">HOME</p>
			<img src="/images/icon/arrow_next_gr.svg" alt="" class="route_next_icon route_next_icon1">
			<p class="route_txt" id="route_txt1"></p>
			<img src="/images/icon/arrow_next_gr.svg" alt="" class="route_next_icon route_next_icon2">
			<p class="route_txt" id="route_txt2"></p>
			<img src="/images/icon/arrow_next_gr.svg" alt="" class="route_next_icon route_next_icon3">
			<p class="route_txt" id="route_txt3"></p>
		</div>
	</div>
</header>


<!-- 알림 팝업 -->
<div class="alarm_pop_whole alarm_off">
	<div class="alarm_pop_bg"></div>
	<div class="alarm_pop_box">
		<div class="alarm_pop_title display_flex flex_nowrap flex_between flex_align_c">
			<p>알림</p>
			<button type="button" class="alarm_pop_close" onclick="alarmHide()">
				<img src="/images/icon/delete_bu_right.svg" alt="알림 닫기 아이콘">
			</button>
		</div>
		<div class="alarm_pop_inner" id="arr">
			<!--
			alarm_pop_row 반복
			
			알림 종류:
			1. 데이터 변경 완료시
			-합의에 의해 데이터가 변경되었다는 문구
			
			2. 오류 발생시
			-~품종 수정건에 오류가 발생했다는 문구
			-->
			<!-- 오류 발생한 알림에 대해서는 alarm_pop_row div에 alarm_error 클래스명 추가 -->
			<%-- <c:forEach var="vo" items="${vo}"> --%>
			<div class="alarm_pop_row">
				<!-- 0분 전/0시간 전/0000.00.00 -->
				<p class="alarm_pop_date">0분 전</p>
				<div class="alarm_row_box">
					<div class="display_flex flex_nowrap flex_start flex_align_c">
						<!-- 
							성공
							<img src="/images/icon/alarm_ok.svg" alt="성공 아이콘">
							실패						성공
							<img src="/images/icon/alarm_no.svg" alt="실 아이콘">
							
							 -->
						<img src="/images/icon/alarm_no.svg" alt="성공 아이콘">
						<div class="alarm_row_txt">
							<p>${vo.alarm_title }</p>
							<p>${vo.alarm_content }</p>
						</div>
					</div>
				</div>
			</div>
			<%-- </c:forEach> --%>
		</div>
	</div>
</div>

<!-- <script type="text/javascript">
if (!window.location.pathname.includes('/member/')) {
	let eventSource = null; // 전역 범위에서 선언
	function connectSSE() {
	    if (!eventSource || eventSource.readyState === EventSource.CLOSED) {
	        eventSource = new EventSource('/createSse');

	        eventSource.onopen = function() {
	        };

			eventSource.onmessage = function(event) {

	        }; 

	        eventSource.onerror = function(error) {
	            eventSource.close();
	        };
	    } 
	}
	// 연결 시작
	connectSSE();
	
	document.addEventListener('DOMContentLoaded', function() {
		$.ajax({
		    url: "/alarmCheck",
		    type: "post",
		    dataType: 'json',
		    success: (e) => {
	    	   if (e.status == "complete") {
			    	$('#alarm_icon').addClass('alarm_on');
			    	if(window.location.pathname == "/"){
			    		alertShow("읽지않은 알림이 있습니다.")
			    	}
	    	   }
				},
		    error: (error) => {
		        errorShow("${code}","${message}");
		    }
		});
	});
	

    eventSource.addEventListener("connect", function(event) {

	});
  eventSource.addEventListener("test", function(event) {
	  $('#alarm_icon').addClass('alarm_on');
		let message = event.data;

	});
  eventSource.addEventListener("alarm", function(event) {
	  $('#alarm_icon').addClass('alarm_on');
		let message = event.data;

	});
  window.addEventListener('beforeunload', function(event) {
	  $.ajax({
	        url: "/disconnect",
	        type: "POST",
	        async: false,
	        complete: function(xhr) {
	            if (xhr.status === 200) {
	                eventSource.close();
	            }
	        },
	        error: (error) => {
			  eventSource.close();
	        }
	    });
	  eventSource.close();
  });
}// member/* 가 아닐때만 작동

  var arrdel;
 
  function alarmList() {
	    $.ajax({
	        type: "post",
	        dataType: 'json',
	        url: "/alarmList",
	        success: (e) => {
	            if (e.status == "complete") {
	                let alarms = JSON.parse(e.vo); // JSON 문자열을 JavaScript 객체로 변환
                	document.getElementById('arr').innerHTML = ''; // arr 내부 비우
                	
                	var array = new Array(alarms.length);
                	var i = 0;
                	//foreach
	                alarms.forEach((vo) => {
	                	if(vo.alarm_type!='cancel'){ //에러 아이콘을 띄워야할때. 조건수정해야함
	                		var alarmHtml = `
		                        <div class="alarm_pop_row">
		                            <p class="alarm_pop_date">`+vo.date_str+`</p>
		                            <div class="alarm_row_box">
		                                <div class="display_flex flex_nowrap flex_start flex_align_c">
		                                    <img src="/images/icon/alarm_ok.svg" alt="성공 아이콘">
		                                    <div class="alarm_row_txt">
		                                        <p>`+vo.alarm_title+`</p>
		                                        <p>`+vo.alarm_content+`</p>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    `;
	                	}else{
		                    var alarmHtml = `
		                        <div class="alarm_pop_row">
		                            <p class="alarm_pop_date">`+vo.date_str+`</p>
		                            <div class="alarm_row_box">
		                                <div class="display_flex flex_nowrap flex_start flex_align_c">
		                                    <img src="/images/icon/alarm_no.svg" alt="실패 아이콘">
		                                    <div class="alarm_row_txt">
		                                        <p>`+vo.alarm_title+`</p>
		                                        <p>`+vo.alarm_content+`</p>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    `;
	                	}
	                    document.getElementById('arr').innerHTML += alarmHtml;
	                    array[i]=vo.alarm_no;
	                    i++;
	                });//foreach end
	                arrdel=array;
	                    alarmShow();

	            } else {
	                errorShow(e.code, e.message);
	            }
	        },
	        error: (error) => {
	        	errorShow("${code}","${message}");
	        }
	    });
	}

  </script> -->