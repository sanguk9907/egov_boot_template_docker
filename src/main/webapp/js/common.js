
let win_wid = window.innerWidth;
var time = new Date().getTime();
let ths_href = window.location.pathname;

let private_key_file;

/* index인지 아닌지에 따라서 로고 클릭시 경로 js */
function logoClick() {
    if (page_type == '1') {
    } else {
        window.location.href = '/';
    }
}

function goBack() {
    window.history.back();
}


/* 이메일 유효성 검사 */
function emailCheck(email) {
    let reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    return reg.test(email);
}

/* 휴대폰 유효성 검사 */
function MobileCheck(num) {
    let reg = /^([0-9]{3})-?([0-9]{3,4})-?([0-9]{4})$/;
    return reg.test(num);
}

/* url 유효성 검사 */
function UrlCheck(url) {
    let reg = /(http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
    return reg.test(url);
}

/* 비밀번호 유효성 검사 */
function PassCheck(pass) {
    var reg = /^(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*-])[A-Za-z\d!@#$%^&*-]{6,15}$/;
    return reg.test(pass);
}

/* 한글 유효성 검사 */
function KorCheck(kor) {
    var reg = /[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
    return reg.test(kor);
}

/* info 휴대폰 유효성 검사 1 */
function MobileCheck1(num) {
    let reg = /^([0-9]{3})$/;
    return reg.test(num);
}

/* info 휴대폰 유효성 검사 2 */
function MobileCheck2(num) {
    let reg = /^([0-9]{3,4})$/;
    return reg.test(num);
}
/* info 휴대폰 유효성 검사 3 */
function MobileCheck3(num) {
    let reg = /^([0-9]{4})$/;
    return reg.test(num);
}

/* 마우스 스크롤로 양 옆 이동 */
$('.horizen_scroll').on('mousewheel', function (e) {
    let wheelDelta = e.originalEvent.wheelDelta;
    if (wheelDelta > 0) {
        $(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
        e.preventDefault();
    } else {
        $(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
        e.preventDefault();
    }
});


/* 햄버거 메뉴 */
$('.hamberger_icon').on('click', function (e) {
    e.preventDefault();
    $(this).toggleClass('active');
    $('body').toggleClass('scroll_off');
    $('.header_menu_whole').toggleClass('show');
    $('.header_menu_whole').toggleClass('none');
});


/* 알림 아이콘 이벤트 */
function alarmShow() {
    $('body').css('overflow', 'hidden');
    $('.alarm_pop_whole').addClass('alarm_on');
    $('.alarm_pop_whole').removeClass('alarm_off');
    $('#alarm_icon').removeClass('alarm_on');
    const arrdelString =  arrdel.join(',');
    $.ajax({
	        url: "/alarmArrDel",
	        type: "post",
	        data : {arrdel : arrdelString},
	        dataType: 'json',
	        success: (e) => {
				},
	        error: (error) => {
	            errorShow("${code}","${message}");
	        }
	    });
};

function alarmHide() {
    $('body').css('overflow', 'auto');
    $('.alarm_pop_whole').removeClass('alarm_on');
    $('.alarm_pop_whole').addClass('alarm_off');
    $('#alarm_icon').removeClass('alarm_on');			
};


/* 메뉴 활성화/비활성 */
let page_type = $('#page_type').val();
let page_num = $('#page_num').val();
$('.web_side_inner').hide();
$('#web_side_inner' + page_type).show();
$('#' + page_type + '_' + page_num).addClass('li_on');
$('#web_side_subtitle' + page_type + '_' + page_num).addClass('sub_on');
$(window).on('resize', function () {
    let win_wid = window.innerWidth;
    if (win_wid < 1024) {
        $('.web_side_inner').hide();
    } else {
        $('.web_side_inner').hide();
        $('#web_side_inner' + page_type).show();
        $('#' + page_type + '_' + page_num).addClass('li_on');
        $('#web_side_subtitle' + page_type + '_' + page_num).addClass('sub_on');
    }
});


/* 헤더 경로 js */
let sub_name1 = $('#sub_name1').val();
let sub_name2 = $('#sub_name2').val();
let sub_name3 = $('#sub_name3').val();
if (sub_name1 == '' || sub_name1 == undefined) {
    $('.route_txt').remove();
    $('.route_next_icon').remove();
}
else {
    $('#route_txt1').show();
    $('#route_txt1').text(sub_name1);
}

if (sub_name2 == '' || sub_name2 == undefined) {
    $('#route_txt2').remove();
    $('.route_next_icon2').remove();
    $('#route_txt3').remove();
    $('.route_next_icon3').remove();
}
else {
    $('#route_txt2').show();
    $('#route_txt2').text(sub_name2);
}

if (sub_name3 == '' || sub_name3 == undefined) {
    $('#route_txt3').remove();
    $('.route_next_icon3').remove();
}
else {
    $('#route_txt3').show();
    $('#route_txt3').text(sub_name3);
}

/* 헤더 경로 높이에 따라서 main_section min-height 및 padding-top 조절 */
let route_hei = $('.common_route_box').innerHeight();
let route_hei2 = 44 + route_hei;
let route_hei3 = 73 + route_hei;
if (win_wid < 1024) {
    $('.main_section').css('padding-top', route_hei2);
    $('.main_section').css('min-height', 'calc(100vh - ' + (route_hei2 + 50) + 'px');
} else {
    $('.main_section').css('padding-top', route_hei3);
    $('.main_section').css('min-height', 'calc(100vh - ' + (route_hei3 + 50) + 'px');
}

$(window).on('resize', function () {
    let win_wid = window.innerWidth;

    if (win_wid < 1024) {
        let route_hei = $('.common_route_box').innerHeight();
        let route_hei2 = 44 + route_hei;
        $('.main_section').css('padding-top', route_hei2);
        $('.main_section').css('min-height', 'calc(100vh - ' + (route_hei2 + 50) + 'px');
    } else {
        let route_hei = $('.common_route_box').innerHeight();
        let route_hei3 = 73 + route_hei;
        $('.main_section').css('padding-top', route_hei3);
        $('.main_section').css('min-height', 'calc(100vh - ' + (route_hei3 + 50) + 'px');
    }
});


/* 새로고침시 깜빡임 없애기 */
(function (H) { H.className = H.className.replace(/\bno-js\b/, 'js') })(document.documentElement);






//필터 공통 js
function filterKeyup(ths) {
    let filter_id = ths.dataset.id;
    let filter_val = $('#' + filter_id).val();

    if (filter_val != '') {
        $('#' + filter_id).next('button').attr('disabled', false);
    } else {
        $('#' + filter_id).next('button').attr('disabled', true);
    }
}

function dateClick(ths) {
    let date_id = ths.dataset.id;
    let date_val = $('#' + date_id).val();

    if (date_val == '기간지정') {
        $('.date_click_btn').attr('disabled', false);
        $('.date_input').attr('disabled', false);
    }
    else {
        $('.date_click_btn').attr('disabled', true);
        $('.date_input').attr('disabled', true);
    }
}

function filterHide(ths) {
    let filter_id = ths.dataset.id;
    $('#' + filter_id).toggleClass('filter_show');
    $('#' + filter_id).toggleClass('filter_hide');

    let filter_hei = $('#' + filter_id).find('.common_filter_inner').innerHeight();
    $('#' + filter_id).find('.common_filter_inner').css('margin-top', '-' + (filter_hei + 10) + 'px');
}


function progressbarBinding() {
    $('.progressbar .fill').each(function () {
        var target = $(this),
            fill = target.attr('fill');
        target.animate({
            width: fill + "%"
        }, 1000);
    });
};



$(document).ready(function () {
    //마우스 스크롤로 양 옆 이동
    $('.img_inner').on('mousewheel', function (e) {
        let wheelDelta = e.originalEvent.wheelDelta;
        if (wheelDelta > 0) {
            $(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
            e.preventDefault();
        } else {
            $(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
            e.preventDefault();
        }
    });
});

if (!location.pathname.includes("/member/")) {
    setTimeout(sessionCheck, 1500000);
    setTimeout(sessionCheck2, 1800000);
}
function sessionCheck() {
    alertShow("세션 만료 5분전입니다.")
}
function sessionCheck2() {
	$.ajax({
		url:"/session/out",
		method:"post",
		success:(e)=>{
    		$('#popup_type').val('reload');
    		alertShow(e.message);
		}
	})
}





$(document).ready(function (e) {
    $('.date_input').datepicker({
        dateFormat: 'yy-mm-dd',
        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        yearSuffix: "년",
        onSelect: function (dateText, inst) {
            if (inst.id == 'end_date') {
                if ($('#date_start').val() == '') {
                    errorShow('[400]','시작날짜를 먼저 선택해 주세요.');
                    $('#end_date').val('');
                }

                var start = new Date($('#date_start').val());
                var end = new Date(dateText);

                if (start > end) {
                    errorShow('[400]','종료날짜는 시작날짜보다 이전일 수 없습니다.');
                    $('#end_date').val('');
                }
            }
        },
    });

    $('.date_click_btn').on('click', function () {
        $(this).prev('.date_input').datepicker('show');
    });
    //달력: https://jqueryui.com/datepicker/
});

function getCookie(cookieName) {
    var cookieValue = null;
    if (document.cookie) {
        var array = document.cookie.split((escape(cookieName) + '='));
        if (array.length >= 2) {
            var arraySub = array[1].split(';');
            cookieValue = unescape(arraySub[0]);
        }
    }
    return cookieValue;
}

function updateInfoGroup() {
    if ($('#mail_check').val() == 'nope') {
        $('#popup_type').val("");
        errorShow("오류", "이메일인증을 완료해주세요");
        return false;
    }
    var queryString = $("form[name=infoChange]").serialize();
    $.ajax({
        type: "post",
        data: queryString,
        dataType: 'json',
        url: "/info/infoUpdate",
        success: (e) => {
            if (e.status == "complete") {
                $('#popup_type').val('reload');
                alertShow(e.message);
            } else if (e.status == "changed") {
                $('#popup_type').val('infoUpdatChanged');
                alertShow(e.message);
            } else {
                $('#popup_type').val("");
                errorShow(e.code, e.message);
            }
        },
        error: (error) => {
        }
    });
}

function approve() {
    if (!private_key_file) {
        errorShow("[400]", "개인키를 등록해주세요.");
        return false;
    }
    const fileName = private_key_file.name.split(".");
    if(fileName[fileName.length - 1] != 'txt'){
		errorShow("[400]", "잘못된 접근입니다.");
        return false;
	}
    const reader = new FileReader();
    reader.readAsText(private_key_file);
    reader.onload = () => {
        $.ajax({
	            url: "/aprv/private",
	            method: "post",
	            beforeSend: () => { 
					commonHide()
					standBy("승인 진행중", "승인 진행중입니다. 잠시만 기다려주세요.") 
				},
	            data: { private_key: reader.result, 
	            situation_no: $(".situ_no").val(), 
            },
            dataType: "json",
            success: (e) => {
					$('#popup_type').val("reload")
                if (e.status == 'complete') {
	                alertShow(e.message);
                } else { 
                    errorShow(e.code, e.message);
                }
            }
        })
    }
}

function private_check() {
    if (!private_key_file) {
        errorShow("[400]", "개인키를 등록해주세요.");
        return false;
    }
    const fileName = private_key_file.name.split(".");
    if(fileName[fileName.length - 1] != 'txt'){
		errorShow("[400]", "잘못된 접근입니다.");
        return false;
	}
    const reader = new FileReader();
    reader.readAsText(private_key_file);
    reader.onload = () => {
        $.ajax({
            url: "/check/private",
            method: "post",
            data: { private_key: reader.result },
            dataType: "json",
            success: (e) => {
                if (e.status == 'complete') {
					$("#check_private").val("Y")
					alertShow("본인 확인이 완료되었습니다.");
                } else {
                    errorShow(e.code, e.message);
                }
            }
        })
    }
}

setTimeout(()=>{
	if($("input[name=filter_date]:checked").val() == "기간지정"){
		$('.date_click_btn').attr('disabled', false);
		$('.date_input').attr('disabled', false);
	}
},200)