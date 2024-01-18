/* 메뉴 관련 js(서버 X) */
if(ths_href.includes('/user/')) {
	$('.header_li_txt').removeClass('li_on');
	$('.header_li_txt2').addClass('li_on');
    $('body').append('<script type="text/javascript" charset="UTF-8" src="/js/user_js.js?v='+time+'"></script>');

	if(page_type == '7') {
		$('.header_li_txt').removeClass('li_on');
		$('.header_li_txt7').addClass('li_on');
		$('body').append('<script type="text/javascript" charset="UTF-8" src="/js/graph_js.js?v='+time+'"></script>');
	}
}
else if(ths_href.includes('/arboreta/')) {
	$('.header_li_txt').removeClass('li_on');
	$('.header_li_txt3').addClass('li_on');
    $('body').append('<script type="text/javascript" charset="UTF-8" src="/js/arboreta_js.js?v='+time+'"></script>');
}
else if(ths_href.includes('/seedbank/')) {
	$('.header_li_txt').removeClass('li_on');
	$('.header_li_txt4').addClass('li_on');
	$('body').append('<script type="text/javascript" charset="UTF-8" src="/js/seedbank_js.js?v='+time+'"></script>');
}
else if(ths_href.includes('/other/')) {
	$('.header_li_txt').removeClass('li_on');
	$('.header_li_txt5').addClass('li_on');
    $('body').append('<script type="text/javascript" charset="UTF-8" src="/js/other_js.js?v='+time+'"></script>');
    $('body').append('<script src="/js/open_address.js"></script>');
}
else if(ths_href.includes('/history/')) {
	$('.header_li_txt').removeClass('li_on');
	$('.header_li_txt6').addClass('li_on');
    $('body').append('<script type="text/javascript" charset="UTF-8" src="/js/history_js.js?v='+time+'"></script>');
}
else if(ths_href.includes('/statistics/')) {
	$('.header_li_txt').removeClass('li_on');
	$('.header_li_txt7').addClass('li_on');

    $('body').append('<script type="text/javascript" charset="UTF-8" src="/js/graph_js.js?v='+time+'"></script>');
}
else if(ths_href.includes('/member/')) {
	$('.header_li_txt').removeClass('li_on');
    $('body').append('<script type="text/javascript" charset="UTF-8" src="/js/member_js.js?v='+time+'"></script>');
	$('body').append('<script src="/js/open_address.js"></script>');
}
else if(ths_href.includes('/mypage/')) {
    $('body').append('<script type="text/javascript" charset="UTF-8" src="/js/mypage_js.js?v='+time+'"></script>');
}
else if(page_type == '1') {
	$('.header_li_txt').removeClass('li_on');
	$('.header_li_txt1').addClass('li_on');
    $('body').append('<script type="text/javascript" charset="UTF-8" src="/js/home_js.js?v='+time+'"></script>');
	$('.header_logo').addClass('header_on');
	$('.w_header_logo').addClass('header_on');
}else {
	$('.header_logo').removeClass('header_on');
	$('.w_header_logo').removeClass('header_on');
}

// $('body').append('<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=595f5411cd84d2dda5e2d9d36b36db1c&libraries=services"></script>');