<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <div class="member_whole">
            <div class="find_whole id_find_whole">
                <div class="find_title">
                    <p>아이디 찾기</p>
                </div>
                <!-- 기본 - id_find1 / 아이디 찾았을때 - id_find2 / 아이디 없을때 - id_find3 -->
                <div class="find_box">
                    <!-- 개인키 인증 -->
                    <div class="id_find1">
                        <p class="title">아이디를 잊어버리셨나요?<br>
                            하단의 개인키를 인증 완료해주세요.</p>
                        <div class="subtext_box">
                            <p class="subtext1">개인키 인증</p>
                            <p class="subtext2">드래그 앤 드롭(또는 파일선택)으로개인키를 인증해주세요.</p>
                        </div>
                        <div class="upload_box">
                            <div class="file_btn">
                            	<div id="drop">
                            		<label for="thumb_pic" class="input_file">
                                    	<input type="file" accept=".txt" id="thumb_pic" hidden="hidden" onchange="handleFiles(this.files)">
                                	</label>
                                	<img src="/images/icon/trunk_default.svg" alt="기본 이미지" class="trunk_default">
                                    <div id="thumbnails"></div>
                                </div>
                            </div>
                        </div>
                        <button type="button" onclick="keyChk1()" class="find_btn id_btn1">확인</button>
                    </div>
                    <!-- 아이디 찾았을떄 -->
                    <div class="id_find2" hidden="hidden">
                        <p class="title">회원으로 등록된 이메일 아이디입니다.</p>
                        <div class="find_id_box">
                            <p>sample@naver.com</p>
                        </div>
                        <a href="/member/login" class="find_btn id_btn2">로그인</a>
                    </div>

                    <!-- 아이디 없을때 -->
                    <div class="id_find3" hidden="hidden">
                        <p class="title">회원 정보를 찾을 수 없습니다. <br>
                            회원가입 페이지로 이동 하시겠습니까?</p>
                        <a href="/member/signup" class="find_btn id_btn2">회원가입</a>
                    </div>
                </div>
            </div>
        </div>