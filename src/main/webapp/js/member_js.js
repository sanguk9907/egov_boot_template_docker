
// signup
// 약관 동의 - agreement_area

if ($(".input_box > .input_error")) {
    $(".input_error").siblings("span").remove()
}
function termsRadio1() {
    var check_radio = $('input[name="agree_check1"]:checked').val();

    if (check_radio != "N") {
        $("#terms_radio1").attr("value", "ok");
    } else {
        $("#terms_radio1").attr("value", "no");
    }
    signupNext();
}

function termsRadio2() {
    var check_radio = $('input[name="agree_check2"]:checked').val();

    if (check_radio != "N") {
        $("#terms_radio2").attr("value", "ok");
    } else {
        $("#terms_radio2").attr("value", "no");
    }
    signupNext();
}

function signupNext() {
    let radio1 = $("#terms_radio1").val();
    let radio2 = $("#terms_radio2").val();

    if (radio1 == "ok" && radio2 == "ok") {
        $(".signup_next").prop("disabled", false);
    } else {
        $(".signup_next").prop("disabled", true);
    }
}

function signupNextBtn() {
    $('.agreement_area').hide();
    $('.essential_area').show();
    $('input[id="stage1"]').prop("checked", false);
    $('input[id="stage2"]').prop("checked", true);
    $('.member_whole').scrollTop(0);
}

// 필수정보입력 - essential_area
function classify() {
    var check_radio = $('input[name="classify"]:checked').val();

    if (check_radio != "") {
        $(".check_area").next("span").hide()
        $("#classify_chk").attr("value", "ok");
    } else {
        $("#classify_chk").attr("value", "no");
    }
    requestBtn();
}

function signupChk1() {
    var input_chk = $('.name_input').val();
    
    if (KorCheck(input_chk)||input_chk == ""){
		 $("#mb_name").css({ "border-color": "rgb(255, 0, 0)" });
		 $("#signup_input1").attr("value", "no");
		 
		  if (KorCheck(input_chk)) {
	        $('#name_kor').show();
	      } else {
	        $('#name_kor').hide();
	   	  }
	   	   if (input_chk == "") {
	      	$('#name_chk').show();
	     } else {
         	$('#name_chk').hide();
         }
	}else if(!KorCheck(input_chk) && input_chk != ""){
		$("#mb_name").css({ "border-color": "#ddd" });
		$("#signup_input1").attr("value", "ok");
		$("#mb_name").siblings("span").hide();
	}
    requestBtn();
}

function signupChk2() {
    var input_chk = $('.belong_input').val();

    if (input_chk != "") {
        $("#mb_belong").siblings("span").hide();
        $("#mb_belong").css({ "border-color": "#ddd" });
        $("#signup_input2").attr("value", "ok");
    } else {
        $("#mb_belong").css({ "border-color": "rgb(255, 0, 0)" });
        $("#mb_belong").siblings("span").show();
        $("#signup_input2").attr("value", "no");
    }
    requestBtn();
}

function signupChk3() {
    var input_chk = $('.rank_input').val();

    if (input_chk != "") {
        $("#mb_position").siblings("span").hide();
        $("#mb_position").css({ "border-color": "#ddd" });
        $("#signup_input3").attr("value", "ok");
    } else {
        $("#mb_position").css({ "border-color": "rgb(255, 0, 0)" });
        $("#mb_position").siblings("span").show();
        $("#signup_input3").attr("value", "no");
    }
    requestBtn();
}

function signupChk4() {
    var input_chk = $('.zip_input').val();

    if (input_chk != "") {
        $("#mb_addr_zip").css({ "border-color": "#ddd" });
        $("#signup_input4").attr("value", "ok");
    } else {
        $("#mb_addr_zip").css({ "border-color": "rgb(255, 0, 0)" });
        $("#signup_input4").attr("value", "no");
    }
    requestBtn();
}

function signupChk5() {
    var input_chk = $('.addr1_input').val();

    if (input_chk != "") {
		 $("#mb_addr").siblings("span").hide();
        $("#mb_addr").css({ "border-color": "#ddd" });
        $("#signup_input5").attr("value", "ok");
    } else {
		 $("#mb_addr").siblings("span").show();
        $("#mb_addr").css({ "border-color": "rgb(255, 0, 0)" });
        $("#signup_input5").attr("value", "no");
    }
    requestBtn();
}

function inputKeyup(ths) {
    let input_id = ths.dataset.id;
    var input_chk = $('#' + input_id).val();

    if (input_chk != "") {
        if (input_id == 'email_input') {
            if (emailCheck(input_chk) == true) {
                $("#email_input").css({ "border-color": "#ddd" });
                $('#' + input_id).next('button').prop('disabled', false);
                $('#email_chk').attr('value', 'ok');
            } else {
                $("#email_input").css({ "border-color": "rgb(255, 0, 0)" });
                $('#' + input_id).next('button').prop('disabled', true);
                $('#email_chk').attr('value', 'no');
            }
        } else {
            $('#' + input_id).next('button').prop('disabled', false);
        }
    } else {
        $('#' + input_id).next('button').prop('disabled', true);
    }
    requestBtn();
}

function emailBtn1() {
    $('.email_num').prop('readonly', false);

    const params = {
        mb_email: $("#email_input").val(),
        send_type: "signup"
    }
    $.ajax({
        url: "/send/email_code",
        method: "post",
        data: params,
        beforeSend: () => { 
			commonHide()
			standBy("인증번호 전송중", "회원님의 이메일로 인증번호를 전송중입니다.") 
		},
        datatype: "json",
        success: (e) => {
            if (e.status = "complete") {
                $('#email_chk1').attr('value', 'ok');
            alertShow(e.message);
            } else {
                $('#email_chk1').attr('value', 'no');
            errorShow(e.code,e.message);
            }
        }
    })
    requestBtn();
}

function emailBtn2() {

    const params = {
        email_code: $("#email_num").val(),
        mb_email: $("#email_input").val()
    }

    $.ajax({
        url: "/email_check_process",
        method: "post",
        data: params,
        datatype: "json",
        success: (e) => {
            if (e.status = "complete") {
                $('#email_chk2').attr('value', 'ok');
            alertShow(e.message);
            } else {
                $('#email_chk2').attr('value', 'no');
            errorShow(e.code,e.message);
            }
        }
    })

    requestBtn();
}

function pwChk1() {
    var pw_chk = $('#signup_pw_input1').val();

    if (!PassCheck(pw_chk)) {
        $("#signup_pw_input1").siblings("span").text("비밀번호는 8 ~ 20자 내의 영문자, 숫자, 특수문자 [ $@$!%*#?& ] 를 필수로 사용해야합니다.");
        $("#signup_pw_input1").siblings("span").show();
        $("#signup_pw_input1").css({ "border-color": "rgb(255, 0, 0)" });
        $('#pw_txt1').attr('value', 'no');
        $('#signup_pw_input1').addClass('pw_input');
    } else {
        $("#signup_pw_input1").siblings("span").hide();
        $("#signup_pw_input1").css({ "border-color": "#ddd" });
        $('#pw_txt1').attr('value', 'ok');
        $('#signup_pw_input1').removeClass('pw_input');
    }
    pwChk2()
    requestBtn();
}

function pwChk2() {
    var pw_chk = $('#signup_pw_input1').val();
    var pw_chk2 = $('#signup_pw_input2').val();

    if (pw_chk !== pw_chk2) {
        $("#signup_pw_input2").css({ "border-color": "rgb(255, 0, 0)" });
        $("#signup_pw_input2").siblings("span").text("비밀번호가 맞지않습니다.");
        $("#signup_pw_input2").siblings("span").show();
        $('#pw_txt2').attr('value', 'no');
        $('#signup_pw_input2').addClass('pw_input');
    } else if (!PassCheck(pw_chk2)) {
        $("#signup_pw_input2").css({ "border-color": "rgb(255, 0, 0)" });
        $("#signup_pw_input2").siblings("span").text("비밀번호는 8 ~ 20자 내의 영문자, 숫자, 특수문자 [ $@$!%*#?& ] 를 필수로 사용해야합니다.");
        $("#signup_pw_input2").siblings("span").show();
        $('#pw_txt2').attr('value', 'no');
        $('#signup_pw_input2').addClass('pw_input');
    } else {
        $("#signup_pw_input2").css({ "border-color": "#ddd" });
        $("#signup_pw_input2").siblings("span").hide();
        $('#pw_txt2').attr('value', 'ok');
        $('#signup_pw_input2').removeClass('pw_input');
    }
    requestBtn();
}

function signup_form_submit() {
    if (location.pathname == "/member/signup") {

        standBy("회원가입", "회원가입 진행중입니다. 잠시만 기다려주세요.")
        $.post("https://api.blockcypher.com/v1/eth/main/addrs", function (data) {
            var privatekey = data.private;
            var publickey = "0x" + data.address;
            $("#mb_public").val(publickey);
            $("#mb_private").val(privatekey);
            $("#signupVO").submit();
        });
    }
}

function download_private_key() {
    $.ajax({
        url: "download/private_key",
        method: "post",
        dataType: "json",
        success: (e) => {
            if (e.status == "complete") {
                let private_key = e.private_key;
                let file_name = e.file_name;

                const blob = new Blob([private_key], { type: 'text/plain' });
                const url = window.URL.createObjectURL(blob);

                const a = document.createElement('a');
                a.style.display = 'none';
                a.href = url;
                a.download = file_name;
                document.body.appendChild(a);

                a.click();

                setTimeout(() => {
                    document.body.removeChild(a);
                    window.URL.revokeObjectURL(url);
                }, 100);
            } else {
                errorShow(e.code,e.message);
            }
        }
    })
}

function requestBtn() {
    let sign_chk3 = $('#classify_chk').val();
    let sign_chk4 = $('#signup_input1').val();
    let sign_chk5 = $('#signup_input2').val();
    let sign_chk6 = $('#signup_input3').val();
    let sign_chk7 = $('#signup_input4').val();
    let sign_chk8 = $('#email_chk').val();
    let sign_chk9 = $('#email_chk2').val();
    let sign_chk10 = $('#pw_txt1').val();
    let sign_chk11 = $('#pw_txt2').val();
    let sign_chk12 = $('#signup_input5').val();
    
    // pw_txt2
    if (sign_chk3 == 'ok' && sign_chk4 == 'ok' && sign_chk5 == 'ok'
        && sign_chk6 == 'ok' && sign_chk7 == 'ok' && sign_chk8 == 'ok'
        && sign_chk9 == 'ok' && sign_chk10 == 'ok' && sign_chk11 == 'ok'
        && sign_chk12 == 'ok' 
        ) {
        $('#signup_button').prop('disabled', false);
    } else {
        $('#signup_button').prop('disabled', true);
    }
}

function requestOk() {
    window.location.href = '/member/request';
}


// 비밀번호 찾기
function findName() {
    var name_chk = $('.find_name').val();

    if (name_chk != "") {
        $("#name_chk").attr("value", "ok");
    } else {
        $("#name_chk").attr("value", "no");
    }
}

function findEmail() {
    var email_chk = $('.find_email').val();

    if (email_chk != "") {
        if (emailCheck(email_chk) == true) {
            $("#email_chk").attr("value", "ok");
            $('.find_btn1').prop('disabled', false);
        } else {
            $("#email_chk").attr("value", "no");
            $('.find_btn1').prop('disabled', true);
        }
    } else {
        $("#email_chk").attr("value", "no");
        $('.find_btn1').prop('disabled', true);
    }
}

function numSend() {
    const params = {
        mb_email: $(".find_email").val(),
        send_type: "find_pw"
    };
    $.ajax({
        url: "/send/email_code",
        method: "post",
        data: params,
        beforeSend: () => { 
			commonHide()
			standBy("인증번호 전송중", "회원님의 이메일로 인증번호를 전송중입니다.") 
		},
        datatype: "json",
        success: (e) => {
            if (e.status == "complete") {
                $('.email_num').attr('readonly', false);
            	alertShow(e.message)
            }else{
				errorShow(e.code,e.message)
			}
        }
    })
}

function findEmailNum() {
    var email_chk = $('.find_email').val();

    if (email_chk != "") {
        $("#email_num").attr("value", "ok");
        $('.find_btn2').prop('disabled', false);
    } else {
        $("#email_chk2").attr("value", "no");
        $('.find_btn2').prop('disabled', true);
    }
}

function findPwChk() {
    const params = {
        email_code: $(".email_num").val(),
        mb_email: $(".find_email").val()
    }
    $.ajax({
        url: "/email_check_process",
        method: "post",
        data: params,
        datatype: "json",
        success: (e) => {
            if (e.status = "complete") {
                $('#email_chk2').attr('value', 'ok');
                alertShow('인증번호가 일치합니다.');
            } else {
                $('#email_chk2').attr('value', 'no');
                errorShow("[400]",'인증번호가 일치하지 않습니다.');
            }
            alertShow(e.message);
        }
    })

}


function findNext() {
    const file = private_key_file ? private_key_file : $("#thumb_pic")[0].files[0]

    if (!file) {
        errorShow("[400]", "개인키를 등록해주세요.");
        return false
    } else if ($("#find_email").val() == "") {
        errorShow("[400]", "이메일을 입력해주세요.");
        return false
    } else if ($("#email_num").val() == "") {
        errorShow("[400]", "인증번호를 입력해주세요.");
        return false
    }
    const reader = new FileReader();
    reader.readAsText(file);
    reader.onload = () => {
        const private_key = reader.result;

        if (private_key) {
            const params = {
                mb_email: $(".find_email").val(),
                email_code: $(".email_num").val(),
                private_key: private_key
            }
            $("#mb_private").val(private_key);
            $.ajax({
                url: "pw_find_process",
                method: "post",
                data: params,
                datatype: "json",
                success: (e) => {
                    if (e.status == "complete") {
                        $('.pw_find1').hide();
                        $('.pw_find2').show();
                        $('.pw_find3').hide();
                        $("#mb_private").val(private_key);
                    } else if (e.status == "email_check_error" || e.status == "no_email" || e.status == "no_private_key" || e.status == "bad_param" || e.status == "not_match_email_code") {
                        errorShow(e.code, e.message);
                    } else {
                        $('.pw_find1').hide();
                        $('.pw_find2').hide();
                        $('.pw_find3').show();
                    }
                }
            })
        }
    }
}



function findPwChk1() {
    var pw_chk = $('#pass_1').val();
    var pw_chk2 = $('#pass_2').val();
    findPwChk2()
    if (!PassCheck(pw_chk)) {
        $('#pass_1').next("span").show();
        $('#pw_chk1').attr('value', 'no');
        $('#pw_chk2').attr('value', 'no');
        $('#pass_1').addClass('pw_input');
    } else {
        $('#pass_1').next("span").hide();
        $('#pw_chk1').attr('value', 'ok');
        $('#pass_1').removeClass('pw_input');
        if (pw_chk != pw_chk2) {
            $('#pw_chk2').attr('value', 'no');
            $('#pass_1').removeClass('pw_input');
        } else {
            $('#pw_chk2').attr('value', 'ok');
        }
    }
    chkPW();
}

function findPwChk2() {
    var pw_chk = $('#pass_1').val();
    var pw_chk2 = $('#pass_2').val();

    if (pw_chk !== pw_chk2) {
        $('#pass_2').next("span").show();
        $('#pw_chk2').attr('value', 'no');
        $('#pass_2').addClass('pw_input');
    } else {
        $('#pass_2').next("span").hide();
        $('#pw_chk2').attr('value', 'ok');
        $('#pass_2').removeClass('pw_input');
    }
    chkPW();
}

function chkPW() {
    let new_pw1 = $('#pw_chk1').val();
    let new_pw2 = $('#pw_chk2').val();

    if (new_pw1 == 'ok' && new_pw2 == 'ok') {
        $('.new_pw').prop('disabled', false);
    } else {
        $('.new_pw').prop('disabled', true);
    }
}

let mem_href = window.location.href;
if (mem_href.includes('/member/id_find') || mem_href.includes('/member/pw_find')) {
    const inputElement = document.getElementById('thumb_pic');
    inputElement.addEventListener("change", handleFiles, false);

    var $drop = $("#drop");

    $drop.on("dragenter", handleDragEnter)
        .on("dragleave", handleDragLeave)
        .on("dragover", handleDragOver)
        .on('drop', handleDrop);

    function handleFiles() {
        const fileList = this.files;
        if (fileList == undefined || fileList.length === 0) return false;
        const file = fileList[0]; // Get the first file
        processFile(file);
    }

    function handleDragEnter(e) {
        e.preventDefault();
        $drop.addClass('drag-over');
        $('.trunk_default').css("opacity", "0.3");
    }

    function handleDragLeave(e) {
        e.preventDefault();
        $drop.removeClass('drag-over');
        $('.trunk_default').show().css("opacity", "1");
    }

    function handleDragOver(e) {
        e.preventDefault();
        $('.trunk_default').css("opacity", "0.3");
    }

    function handleDrop(e) {
        e.preventDefault();
        $drop.removeClass('drag-over');
        var files = e.originalEvent.dataTransfer.files;
        if (files.length > 0) {
            const file = files[0]; // Get the first dropped file
            processFile(file);
        }
    }

    function processFile(file) {
		private_key_file = file
        var $div = $('<div class="thumb"> \
            <span>' + file.name + '</span><br>\
        </div>');
        $("#thumbnails").empty().append($div); // Clear existing thumbnails and show the new one
        $('.trunk_default').hide();
        $('#key_chk').attr('value', 'ok');
    }
}



function loginGo() {
    window.location.href = '/member/login';
}

function keyChk1() {
	if(!private_key_file){
		commonHide();
		errorShow("[400]", "개인키를 등록해주세요.");
        return false;
	}
    standBy('잠시만 기다려주세요.', '키를 확인 중입니다.');
    const file = private_key_file ? private_key_file : $("#thumb_pic")[0].files[0]
    const reader = new FileReader();
    reader.readAsText(file);
    reader.onload = () => {
        const private_key = reader.result;
        $.ajax({
            url: "find_id_process",
            method: "post",
            data: { private_key: private_key },
            dataType: "json",
            success: (e) => {
                commonHide()
                if (e.status == "complete") {
                    $(".find_id_box p").text(e.mb_email)
                    $('.id_find1').hide();
                    $('.id_find2').show();
                    $('.id_find3').hide();
                } else {
                    $('.id_find1').hide();
                    $('.id_find2').hide();
                    $('.id_find3').show();
                }
            }
        })
    }
}