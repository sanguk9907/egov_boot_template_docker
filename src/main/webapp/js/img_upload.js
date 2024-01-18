
var fileNo = parseInt($('#fileNo').val());
var maxFileCnt = 2, attFileCnt = 0, curFileCnt = 0, validateFileCnt = 0;

/* 첨부파일 추가 */
function addFile(obj) {
    validateFileCnt = 0;
    attFileCnt = document.querySelectorAll('.plant_img').length;    // 기존 추가된 첨부파일 개수
    curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수
    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수

    // 이미지와 체크 박스를 감싸고 있는 div 속성
    var div_style = 'display:inline-block;position:relative;'
        + 'z-index:1';
    // 미리보기 이미지 속성
    var img_style = 'width:100%;height:100%;z-index:1;object-fit:cover;';

    // 이미지안에 표시되는 체크박스의 속성
    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;line-height:28px;border:none;outline:none;'
        + 'right:0px;bottom:0px;z-index:999;cursor:pointer;';

    // 첨부파일 개수 확인
    if (curFileCnt > remainFileCnt) {
        errorShow("error", "첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
    }


    for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {
        const file = obj.files[i];

        // 첨부파일 검증
        if (validation(file)) {
            $("#fileNo").val(attFileCnt + 1);
            // 파일 배열에 담기
            var reader = new FileReader();
            reader.onload = function (e) {
                var img = new Image();
                img.src = e.target.result;
                img.onload = function () {
                    // 목록 추가
                    let htmlData = '';
                    htmlData += '<div class="plant_img" id="plant_img' + fileNo + '" style="' + div_style + '">';
                    htmlData += '   <input type="hidden" id="img_val' + fileNo + '" name="img_val" value="">';
                    htmlData += '   <img src="' + img.src + '" alt="" id="pic_img' + fileNo + '" style="' + img_style + '">';
                    htmlData += '   <input type="button" value="x" onclick="deleteImg(this)" data-id="plant_img' + fileNo + '" data-no="" style="' + chk_style + '">';
                    htmlData += '   </div>';
                    htmlData += '</div>';
                    $('#att_zone').append(htmlData);


                    var canvas = document.createElement("canvas");
                    var ctx = canvas.getContext("2d");
                    ctx.drawImage(img, 0, 0);

                    var width = img.width;
                    var height = img.height;

                    var MAX_WIDTH = 1000;
                    var MAX_HEIGHT = 1000;

                    if (width > height) {
                        if (width > MAX_WIDTH) {
                            height *= MAX_WIDTH / width;
                            width = MAX_WIDTH;
                        }
                    } else {
                        if (height > MAX_HEIGHT) {
                            width *= MAX_HEIGHT / height;
                            height = MAX_HEIGHT;
                        }
                    }

                    if (width > height) {
                        $('#pic_img' + fileNo).css('width', '100%');
                        $('#pic_img' + fileNo).css('height', '100%');
                    } else {
                        $('#pic_img' + fileNo).css('width', '100%');
                        $('#pic_img' + fileNo).css('height', '100%');
                    }
                    canvas.width = width;
                    canvas.height = height;


                    var ctx = canvas.getContext("2d");
                    ctx.drawImage(img, 0, 0, width, height);

                    var dataurl = canvas.toDataURL("image/png");
                    $('#img_val' + fileNo).val(dataurl);
                    fileNo++;


                    moreAddImageCheck();
                }
            };
            reader.readAsDataURL(file);
        } else {
            continue;
        }
    }
    // 초기화
    document.querySelector("input[type=file]").value = "";
}

/* 실제 이미지 첨부 개수 체크 */
function moreAddImageCheck() {
    var plusImageLen = attFileCnt + curFileCnt - validateFileCnt;
    if (plusImageLen >= 2) {
        $('#img_profile').hide();
    } else {
        $('#img_profile').show();
    }
}

/* 첨부파일 검증 */
function validation(obj) {
    const fileTypes = ['image/jpg', 'image/jpeg', 'image/png'];
    if (obj.name.lastIndexOf('.') == -1) {
        validateFileCnt++;
        errorShow("[Non_Extension]", "확장자가 없는 파일은 제외되었습니다.");
        return false;
    } else if (!fileTypes.includes(obj.type)) {
        validateFileCnt++;
        errorShow("[Bad_Extension]", "첨부가 불가능한 파일은 제외되었습니다.");
        return false;
    } else {
        return true;
    }
}

/* 첨부파일 삭제 */
function deleteImg(ths) {
    var attFileCnt = document.querySelectorAll('.plant_img').length;
    $('#img_profile').show();
    document.querySelector("#" + ths.dataset.id).remove();

    if (ths.dataset.no != '') {
        var input = '<input type="hidden" name="delete_img[]" value="' + ths.dataset.no + '">';
        $('#att_zone').append(input);
    }
}