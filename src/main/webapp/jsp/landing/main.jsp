<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="landing_main_whole">
    <div class="landing_header_whole">
        <div class="display_flex flex_nowrap flex_between flex_align_c">
            <img src="/images/logo/orc_logo.svg" alt="" class="landing_header_logo">
            <button type="button" onclick="landingLangShow()" class="landing_header_lang">${val}</button>
        </div>
    </div>
    <div class="landing_inner_whole">
        <p class="landing_inner_txt txt_border">OFFICIAL WEBSITE</p>
        <p class="landing_inner_txt">BETA OPEN</p>
        <div class="landing_inner_icon_whole display_flex flex_nowrap flex_center flex_align_c">
            <a href="javascript:void(0)" onclick="alertShow('Open soon')" class="landing_sns_icon landing_sns_icon1"><span></span></a>
            <a href="https://twitter.com/oraclizer" target="_blank" class="landing_sns_icon landing_sns_icon2"><span></span></a>
            <a href="javascript:void(0)" onclick="alertShow('Open soon')" class="landing_sns_icon landing_sns_icon3"><span></span></a>
        </div>
        <div class="landing_inner_time_whole display_flex flex_nowrap flex_center flex_align_s">
            <div class="landing_inner_time_box">
                <div class="landing_inner_time_bg">
                    <input type="text" id="landing_time_date" name="time" value="00" disabled="disabled" readonly="readonly">
                </div>
                <p id="changeTxt1">DATE</p>
            </div>
            <div class="landing_inner_time_span">
                <span></span>
                <span></span>
            </div>
            <div class="landing_inner_time_box">
                <div class="landing_inner_time_bg">
                    <input type="text" id="landing_time_hour" name="hour" value="00" disabled="disabled" readonly="readonly">
                </div>
                <p id="changeTxt2">HOUR</p>
            </div>
            <div class="landing_inner_time_span">
                <span></span>
                <span></span>
            </div>
            <div class="landing_inner_time_box">
                <div class="landing_inner_time_bg">
                    <input type="text" id="landing_time_minute" name="minute" value="00" disabled="disabled" readonly="readonly">
                </div>
                <p id="changeTxt3">MINUTE</p>
            </div>
            <!--혹시라도 초도 만들어달라고 하면 주석 풀어주세요.
            <div class="landing_inner_time_span">
                <span></span>
                <span></span>
            </div>
            <div class="landing_inner_time_box">
                <div class="landing_inner_time_bg">
                    <input type="text" id="landing_time_second" name="second" value="" disabled="disabled" readonly="readonly">
                </div>
                <p>SECOND</p>
            </div>
            -->
        </div>
        <span class="landing_inner_line"></span>
        <div class="landing_inner_contact_whole">
			
			<p><spring:message code="landing.message1" /><br/><spring:message code="landing.message2" /></p>
            <button type="button" onclick="contactShow()" class="landing_inner_contact_btn"><spring:message code="landing.contact" /></button>
        </div>
    </div>
    <div class="landing_footer_whole">
        <p>Copyright :copyright: 2024 ORACLIZER. All Rights Reserved.</p>
    </div>
</div>


<!-- 언어 팝업 -->
<div class="popup_lang_whole">
    <div class="popup_lang_bg"></div>
    <div class="popup_lang_box">
        <p class="popup_lang_title"><spring:message code="landing.lang.msg" /></p>
        <div class="popup_lang_inner">
            <div class="swiper-container popup_lang_swiper" id="popup_lang_swiper">
                <div class="swiper-wrapper">
                    <!--
                        swiper-slide 반복
                        (팝업 로드시 선택해둔 언어로 스와이퍼 되기 위해
                        data-id 숫자가 +1씩 커져야 함)
                    -->
                    <div class="swiper-slide" data-id="0">
                        <p class="date_inner_txt">KOR</p>
                    </div>
                    <div class="swiper-slide" data-id="1">
                        <p class="date_inner_txt">ENG</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="popup_lang_btn_whole display_flex flex_nowrap flex_center flex_align_c">
            <button type="button" onclick="landingLangHide()" class="popup_lang_btn popup_lang_btn1"><spring:message code="landing.cancel" /></button>
            <button type="button" onclick="landingLangChoose()" id="popup_lang_send" class="popup_lang_btn popup_lang_btn2"><spring:message code="landing.select" /></button>
        </div>
    </div>
</div>
<input type="hidden" id="landing_lang_num" value="${val2}" disabled readonly>


<!-- 문의하기 팝업 -->
<div class="popup_contact_whole">
    <div class="popup_contact_bg"></div>
    <div class="popup_contact_box">
        <form action="">
            <p><spring:message code="landing.contact" /></p>
            <div class="popup_contact_inner">
                <input type="text" onkeyup="contactKeyup(this)" id="popup_contact_name" data-id="popup_contact_name" class="popup_contact_input" placeholder="<spring:message code='landing.contact.plholder1' />">
                <input type="text" onkeyup="contactKeyup(this)" id="popup_contact_mail" data-id="popup_contact_mail" class="popup_contact_input" placeholder="<spring:message code='landing.contact.plholder2' />">
                <p id="landing_mail_no" class="landing_mail_no">* <spring:message code="landing.send.wrong.msg" /></p>
                <textarea name="popup_contact_content" onkeyup="contactKeyup(this)" id="popup_contact_content" data-id="popup_contact_content" class="popup_contact_content" cols="30" rows="10" placeholder="<spring:message code='landing.contact.plholder3' />"></textarea>
            </div>
            <div class="popup_contact_btn_whole display_flex flex_nowrap flex_center flex_align_c">
                <button type="button" onclick="contactHide()" class="popup_contact_btn popup_contact_btn1"><spring:message code="landing.cancel" /></button>
                <button type="button" onclick="contactSend()" id="popup_contact_send" class="popup_contact_btn popup_contact_btn2" disabled><spring:message code="landing.send" /></button>
            </div>
        </form>
    </div>
</div>

<script>
const nameFailMsg = '<spring:message code="landing.send.fail.name.msg" />'
const emailFailMsg = '<spring:message code="landing.send.fail.email.msg" />'
const contentFailMsg = '<spring:message code="landing.send.fail.content.msg" />'
const beforeMsg = '<spring:message code="landing.send.before.msg1" />'
const beforeMsg2 = '<spring:message code="landing.send.before.msg2" />'
</script>