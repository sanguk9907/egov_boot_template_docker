function openAddressSearch(ths) {
    element_wrap = ths.parentNode.parentNode.lastElementChild;
    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = '';
            var extraAddr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }
            const location = window.location.pathname;

            if (location.includes("signup")) {
                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }

                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }

                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }

                    $(ths).closest(".signup_addr").find("input[name=mb_addr2]").val(extraAddr);
                } else {
                    $(ths).closest(".signup_addr").find("input[name=mb_addr2]").val("");
                }
                $(ths).closest(".signup_addr").find("input[name=mb_addr_zip]").val(data.zonecode);
                $(ths).closest(".signup_addr").find("input[name=mb_addr]").val(addr);
                $(ths).closest(".signup_addr").find("input[name=mb_addr2]").focus();

                var geocoder = new kakao.maps.services.Geocoder();

                var callback = function (result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        //  x = 경도 y = 위
                        $(ths).closest(".signup_addr").find("input[name=mb_lat]").val(result[0].x);
                        $(ths).closest(".signup_addr").find("input[name=mb_lng]").val(result[0].y);
                    }
                }
                signupChk4()
                signupChk5()
                geocoder.addressSearch(addr, callback);
            } else if (location.includes("other/seed/request")) {
                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }

                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }

                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }

                    $(ths).closest(".content_inner").find("input[name=now_addr2]").val(extraAddr);
                } else {
                    $(ths).closest(".content_inner").find("input[name=now_addr2]").val("");
                }
                $(ths).closest(".content_inner").find("input[name=now_zip]").val(data.zonecode);
                $(ths).closest(".content_inner").find("input[name=now_addr1]").val(addr);
                $(ths).closest(".content_inner").find("input[name=now_addr2]").focus();
            } else {
                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }

                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }

                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }

                    $(ths).closest(".content_inner").find("input[name=intro_addr2]").val(extraAddr);
                } else {
                    $(ths).closest(".content_inner").find("input[name=intro_addr2]").val("");
                }
                $(ths).closest(".content_inner").find("input[name=intro_zip]").val(data.zonecode);
                $(ths).closest(".content_inner").find("input[name=intro_addr1]").val(addr);
                $(ths).closest(".content_inner").find("input[name=intro_addr2]").focus();

                var geocoder = new kakao.maps.services.Geocoder();

                var callback = function (result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        //  x = 경도 y = 위
                        $(ths).closest(".content_inner").find("input[name=intro_lat]").val(result[0].x);
                        $(ths).closest(".content_inner").find("input[name=intro_lng]").val(result[0].y);
                    }
                };
                geocoder.addressSearch(addr, callback);
            }

            element_wrap.style.display = 'none';
            document.body.scrollTop = currentScroll;
        },
        onresize: function (size) {
            element_wrap.style.height = size.height + 'px';
        },
        submitMode: false,
        width: '100%',
        height: '100%'
    }).embed(element_wrap);
    element_wrap.style.display = 'block';
};