//팝업 js 관련 모음


//전체
function commonHide() {//전체
    $('body').css('overflow', 'auto');
    $('.common_pop_whole').hide();
}


//alert
function alertShow(text) {//alert 팝업 성공
    commonHide();

    $('body').css('overflow', 'hidden');
    $('.common_alert_txt').html(text);
    $('.common_alert_whole').show();
}

function alertPopOk() {//확인버튼 클릭시
    var type = $('#popup_type').val();
    if (type == 'pw_change_ok') {
        window.location.href = '/member/login';
    }
    else if (type == 'link_ok') {
        $('.list_btn_plus').show();
        $('#origin_data_list_val').attr('value', 'unlink');
        $('.origin_data_list').attr('disabled', true);
        $('.common_list_end1').show();
        $('.common_list_end2').hide();
    }
    else if (type == 'link_ok2') {
        $('.list_btn_plus').show();
        $('#origin_data_list_val').attr('value', 'unlink');
        $('.origin_data_list').attr('disabled', true);
        $('.common_list_end1').show();
        $('.common_list_end2').hide();
    } else if (type == 'session_out') {
        window.location.href = '/logout';
    } else if (type == 'infoUpdateOk') {
        window.location.href = '/user/info';
    } else if (type == 'infoUpdatChanged') {
        window.location.href = '/logout';
    } else if (type == 'delUser') {
        window.location.href = '/user/list';
    } else if (type == 'groupUpdateOk') {
        window.location.href = '/user/info';
    } else if (type == 'bankRequestOk') {
        window.location.href = '/seedbank/seed/list';
    } else if (type == 'unlocked') {
    } else if (type == 'inheritRequestOk') {
        window.location.href = '/other/seed/list';
    } else if (type == 'unlocked') {
        location.reload();
    } else if (type == "") {
        commonHide();
    } else if (type == 'revise' || type == 'request_ok') {
        //window.location.href = '/origin/data/list';
        goBack()
    } else if (type == 'reload') {
        window.location.reload();
    } else if (type == 'back') {
        goBack();
    } else if (type == 'fail') {
        return false;
    }
    commonHide();
}





//stand by
function standBy(text, text2) {//alert 팝업 대기
    $('body').css('overflow', 'hidden');
    $('.common_stanby_whole').show();
    $('.common_stanby_txt').html(text);
    $('.common_stanby_txt2').html(text2);
}





//confirm
function confirmShow(text, text2, text3) {
    $('body').css('overflow', 'hidden');
    $('.common_confirm_whole').show();
    $('.common_confirm_txt').html(text);
    $('.common_confirm_txt2').html(text2);
    $('#common_confirm_ok').html(text3);
}

function confirmOk() {//확인버튼 클릭시
    let popup_val = $('#popup_type').val();
    if (popup_val == 'user_delete') {
        deleteUser();
    }
    else if (popup_val == 'grounp_change') {
        updateInfoGroup();
    }
    else if (popup_val == 'change_cancel_chk') {
        callCancelProcess('modify');
    }
    else if (popup_val == 'delete_cancel_chk') {
        callCancelProcess('delete');
    }
    else if (popup_val == 'register_cancel_chk') {
        callCancelProcess('regist');
    }
    else if (popup_val == 'register_cancel') {
        cancelCall();
    }
    else if (popup_val == 'regist_inherit') {
        submit_inherit_form();
    }
    else if (popup_val == 'link_all') {
        linkProcess("all")
    }
    else if (popup_val == 'link_all2') {
        linkProcess("all")
    }
    else if (popup_val == 'link_choose') {
        linkProcess("choose")
    }
    else if (popup_val == 'register') {
        submit_sb_form();
    }
    else if (popup_val == 'situation_regist') {
        registSituation();
    }
    else if (popup_val == 'presentUpdate') {
        presentUpdateProcess();
    }
    else if (popup_val == 'revise') {
        submitOriginData($("#modifyCallFrom"), "/origin/data/change", 'revise')
    }
    else if (popup_val == 'delete_detail') {
        deleteOriginData()
    }
    else if (popup_val == 'request_ok') {
        submitOriginData($("#registCallFrom"), "/origin/data/register", 'request_ok')
    } else if (popup_val == 'approve') {
        approve();
        updateHide();
    } else if (popup_val == 'signupApprove') {
        signupApprove();
        updateHide();
    } else if (popup_val == 'approveFromBank') {
        approveFromBank();
        updateHide();
    }
    else if (popup_val == 'regist_report') {
        registReport();
    }
    else if (popup_val == 'parce') {
		cancelInherit();
    }
    else if (popup_val == 'rport') {
		cancelReport();
    }
    else {
        commonHide();
    }
}




//error
function errorShow(text, text2) {
    $('body').css('overflow', 'hidden');
    $('.common_error_whole').show();
    $('.common_error_txt').html(text);
    $('.common_error_txt2').html(text2);
}
function errorOk() {//확인버튼 클릭시
    var type = $('#popup_type').val();
    if (type == 'back') {
        goBack();
    } else if (type == 'undefine_user') {
        window.location.href = '/user/list';
    } else if (type == 'undefine_monitor') {
        window.location.href = '/signature/monitor/list';
    } else if (type == 'undefine_request') {
        window.location.href = '/signature/request/list';
    } else if (type == 'undefine_wallet') {
        window.location.href = '/signature/wallet/list';
    } else if (type == 'reload') {
        window.location.reload();
    }if (type == 'situation_fail') {
        $(".common_error_ok").closest(".common_pop_whole").hide();
        $(".common_confirm_btn").closest(".common_pop_whole").hide();
        return false;
    }
    commonHide();
    
}





//terms
function termOpen(ths) {
    let term_id = ths.dataset.id;
    $('.head_plus_css').remove();
    $('.no_terms_txt').show();
    $('.loading_whole').show();
    $('body').css('overflow', 'hidden');
    $('.conditions_popup').show();
    $('.conditions_title').html('약관 로딩 중...');
    $('.conditions_txt').html('약관 로딩 중입니다.<br/>잠시만 기다려주세요.');

    if (term_id == 'terms_btn1') {//약관1
        $('.conditions_load').load('/jsp/terms/term1.jsp .terms_whole', function() {
            $('.conditions_popup').removeClass('terms_open2');
            $('.conditions_popup').addClass('terms_open');
		        setTimeout(function () {
		            $('.conditions_title').html('이용약관');
	    	    }, 1000);
        });
        $('head').append('<link rel="stylesheet" href="/css/terms/term1.css" class="head_plus_css">');
        
    } else if (term_id == 'terms_btn2') {//약관2
        $('.conditions_load').load('/jsp/terms/term2.jsp .terms_whole', function() {
            $('.conditions_popup').removeClass('terms_open2');
            $('.conditions_popup').addClass('terms_open');
		        setTimeout(function () {
		            $('.conditions_title').html('개인정보처리방침');
	    	    }, 1000);
        });
        $('head').append('<link rel="stylesheet" href="/css/terms/term2.css" class="head_plus_css">');
    } else if (term_id == 'terms_btn3') {//약관3
        $('.conditions_load').load('/jsp/terms/term3.jsp .terms_whole', function() {
            $('.conditions_popup').removeClass('terms_open2');
            $('.conditions_popup').addClass('terms_open');
		        setTimeout(function () {
		            $('.conditions_title').html('저작권정책');
	    	    }, 1000);
        });
        $('head').append('<link rel="stylesheet" href="/css/terms/term3.css" class="head_plus_css">');
    }
}

function termHide() {
    $('.conditions_title').html('약관 닫는 중...');
    $('.conditions_txt').html('약관 닫는 중입니다.<br/>잠시만 기다려주세요.');
    $('.conditions_popup').removeClass('terms_open');
    $('.conditions_popup').addClass('terms_open2');
    setTimeout(function () {
        $('.conditions_popup').hide();
        $('.loading_whole').hide();
        $('.head_plus_css').remove();
        $('.conditions_load *').remove();
        $('body').css('overflow', 'auto');
    }, 1000);
}


function nftBigPopup(ths) {
    let src = $(ths).children().attr("src")
    $(".big_popup_img > img").attr("src", src)
    $('body').css('overflow', 'hidden');
    $('.big_popup').show();
}

function nftBigHide() { //layout
    $('body').css('overflow', 'auto');
    $('.big_popup').hide();
}

// 이벤트 팝업
function eventPopup() {
    $('body').css('overflow', 'hidden');
    $('.event_history_popup').show();
    $('.history_content_inner').animate({ scrollTop: 0 }, 0);
}


// 현황관리 팝업
function situationPopup() {
    $('body').css('overflow', 'hidden');
    $('.data_change_whole').show();
    $('.data_change_inner').animate({ scrollTop: 0 }, 0);
}

function situatioCancel() {
    confirmShow('해당 분양요청을 취소하시겠습니까?', '분양취소 시 분양요청한 데이터는 삭제됩니다.', '분양요청취소');
    $('#popup_type').attr('value', 'parce');
}


// 현황 업데이트 팝업
function updatePopup() {
	
	 $.ajax({
        url: "/other/get/seedcategory",
        method: "post",
        success: (e) => {
            $(".present_update_whole #category1").empty();
            $(".present_update_whole #category1").html('<option value="whole">선택</option>');
            if (e != null && e.length > 0) {
                e.forEach((item) => {
                    $(".present_update_whole #category1").append(`<option data-id="${item.inherit_data_no}" value="${item.situation_no}">${item.species_kr}</option>`);
                })

            }
        }
    })
	
    $('body').css('overflow', 'hidden');
    $('.present_update_popup').show();
    $('.present_update_inner').animate({ scrollTop: 0 }, 0);
}

function presentUpdate() {
    confirmShow('정말 등록하시겠습니까?', '등록된 내용은 등록 버튼 클릭 시 등록요청이 완료됩니다.', '확인');
    $('#popup_type').attr('value', 'presentUpdate');
}

function personallyOk() {
	private_check()
    //alertShow('본인 확인이 완료되었습니다.');
}

function updateHide() {
    $('body').css('overflow', 'auto');
    $('.present_update_popup').hide();
}






let mem_href2 = window.location.href;
if (mem_href2.includes('/other/current/list')) {

    //파일선택
    var fileTarget = $('.filebox .upload_hidden');
    $(".filebox label").click(function () {
        index = $(".filebox label").index(this);
    })
    fileTarget.on("change", function () {
        if (window.FileReader) {
            var filename = $(this)[0].files[0].name;
        }

        // 추출한 파일명 삽입
        $(".filebox").find(".upload_name").val(filename);
        $('.trunk_default').hide();

    });
    
    var fileTarget2 = $('.update_filebox .upload_hidden');
    let index2 = 0;
    $(".update_filebox label").click(function(){
        index2 = $(".update_filebox label").index(this);
    })
    fileTarget2.on("change", function(){
        if(window.FileReader){
        var filename = $(this)[0].files[0].name;
        } else{
        // old IE
        //var filename = $(this).val().split('/').pop().split('\\').pop();
        // 파일명만 추출
        }
        // 추출한 파일명 삽입
        $(".update_filebox").eq(index2).find(".upload_name").val(filename);
    });



function openAddressSearch(ths) {
    element_wrap = document.getElementById('wrap');
    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);

    new daum.Postcode({
        oncomplete: function (data) {
            var addr = '';

            var extraAddr = '';
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }

                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }

                $(ths).closest(".popup_add").find("input[name=now_addr2]").val(extraAddr);
            } else {
                addr = data.jibunAddress;
                $(ths).closest(".popup_add").find("input[name=now_addr2]").val("");
            }
            $(ths).closest(".popup_add").find("input[name=now_zip]").val(data.zonecode);
            $(ths).closest(".popup_add").find("input[name=now_addr1]").val(addr);
            $(ths).closest(".popup_add").find("input[name=now_addr2]").focus();
            
            var geocoder = new kakao.maps.services.Geocoder();

                var callback = function (result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        //  x = 경도 y = 위
                        $(ths).closest(".popup_add").find("input[name=latitude]").val(result[0].x);
                        $(ths).closest(".popup_add").find("input[name=longitude]").val(result[0].y);
                    }
                };
                geocoder.addressSearch(addr, callback);

            element_wrap.style.display = 'none';

            document.body.scrollTop = currentScroll;
        },
        onresize: function (size) {
            element_wrap.style.width = size.width + 'px';
            element_wrap.style.height = size.height + 'px';
        },
        submitMode: false,
        width: '100%',
        height: '100%'
    }).embed(element_wrap);
    element_wrap.style.display = 'block';
};






}

