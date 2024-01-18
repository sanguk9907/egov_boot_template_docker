function landingLangShow() {
    $('body').css('overflow', 'hidden');
    $('.popup_lang_whole').show();

    let slide_index = $('#landing_lang_num').val();

    var popup_lang_swiper = new Swiper('.popup_lang_swiper',{
        direction: "vertical",
        paginationClickable: true,
        spaceBetween: 0,
        mousewheelControl: false,
        grabCursor: true,
        centeredSlides: !0,
        slidesPerView: "auto",
    });//서버작업 X

    popup_lang_swiper.slideTo(slide_index, 0, false);
}

function landingLangChoose() {
    var lang_val = $('#popup_lang_swiper .swiper-slide-active p').text();
    
    $.ajax({
		url:"/set/lang",
		method:"post",
		data:{lang:lang_val},
		success:()=>{location.reload();}
	})

    //landingLangHide();
}

function landingLangHide() {
    $('body').css('overflow', 'auto');
    $('.popup_lang_whole').hide();
}


function contactShow() {
    $('body').css('overflow', 'hidden');
    $('.popup_contact_whole').show();
}

function contactHide() {
    document.getElementById('popup_contact_name').value = null;
    document.getElementById('popup_contact_mail').value = null;
    document.getElementById('popup_contact_content').value = null;
    $('body').css('overflow', 'auto');
    $('.popup_contact_whole').hide();
}

function contactSend() {
	let qstring = new URLSearchParams(location.search);
	const lang = qstring.get("language") ? qstring.get("language") : "ko"
    const param = {
		userName:$("#popup_contact_name").val(),
		userEmail:$("#popup_contact_mail").val(),
		content:$("#popup_contact_content").val(),
		locale:lang
	}
	
	if(param.userName == null || param.userName.trim() == ""){
		$('#popup_type').val("fail_send");
		alertShow(nameFailMsg);
		return
	}else if(param.userEmail == null || param.userEmail.trim() == ""){
		$('#popup_type').val("fail_send");
		alertShow(emailFailMsg);
		return
	}else if(param.content == null || param.content.trim() == ""){
		$('#popup_type').val("fail_send");
		alertShow(contentFailMsg);
		return
	}
    $.ajax({
		url:"/send/email_code",
		method:"post",
		data:param,
		beforeSend: () => {
			$('.popup_contact_whole').hide();
			standBy(beforeMsg,beforeMsg2);
		},
		success:(e)=>{
			commonHide();
			if(e.status == "complete"){
				$('#popup_type').val("complete_send");
				alertShow(e.message);
			}else{
				$('#popup_type').val("fail_send");
				alertShow(e.message);
			}

		}
	})
}


let landing_mail_regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
function contactKeyup(ths) {
    let contact_id = ths.dataset.id;

    let contact_val1 = document.getElementById('popup_contact_name').value;
    let contact_val2 = document.getElementById('popup_contact_mail').value;
    let contact_val3 = document.getElementById('popup_contact_content').value;

    if(contact_id == 'popup_contact_mail') {
        if(contact_val2.match(landing_mail_regex) != null) {
            document.getElementById('landing_mail_no').style.display = 'none';
        }
        else {
            document.getElementById('landing_mail_no').style.display = 'block';
        }
    }

    if(contact_val1 != '' && 
    contact_val2.match(landing_mail_regex) != null && 
    contact_val3 != '') {
        document.getElementById('popup_contact_send').disabled = false;
    }
    else {
        document.getElementById('popup_contact_send').disabled = true;
    }
}

let countDownInterval = setInterval(dayCount, 1000);
//디데이 기능 구현
function dayCount() {
    let today = new Date();
    let dday = new Date("2024/01/31 00:00:00");
    let timeGap = dday.getTime() - today.getTime();

    let remainTime = Math.ceil(timeGap / (1000 * 60 * 60 * 24));//남은 일수 구하기
    let hours = String(Math.floor(timeGap / (1000 * 60 * 60)) % 24).padStart(2, '0');//남은 시간 구하기
    let minutes = String(Math.floor(timeGap / (1000 * 60)) % 60).padStart(2, '0');//남은 분 구하기
    let second = String(Math.floor(timeGap / 1000) % 60).padStart(2, '0');//남은 초 구하기

	if (remainTime <= 1) {
		$('#changeTxt1').text('HOUR');
		$('#changeTxt2').text('MINUTE');
		$('#changeTxt3').text('SECOND');
	}

    if(timeGap <= 0) {
        clearInterval(countDownInterval);
        $('#changeTxt1').text('HOUR');
		$('#changeTxt2').text('MINUTE');
		$('#changeTxt3').text('SECOND');
    } else {
		if (remainTime <= 1) {
			$('#landing_time_date').attr('value', hours);
        	$('#landing_time_hour').attr('value', minutes);
        	$('#landing_time_minute').attr('value', second);
		} else {
			var dateTxt = remainTime - 1;
			if(dateTxt < 10) {
				dateTxt = "0" + dateTxt;
			}
			$('#landing_time_date').attr('value', dateTxt);
        	$('#landing_time_hour').attr('value', hours);
        	$('#landing_time_minute').attr('value', minutes);
		}
        //$('#landing_time_second').attr('value', second);
    }
}//https://ziszini.tistory.com/49