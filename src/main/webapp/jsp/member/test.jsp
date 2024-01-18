<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="text" id="test1"/>
<input type="text" id="test2"/>
<input type="text" id="test3"/>
<button id="btn" onclick="test()">click!!!</button>


<script>
document.addEventListener("DOMContentLoaded", function() {
	$("#btn").on("click",function(){
		const param = {test1:$("#test1").val(),test2:$("#test2").val(),test3:$("#test3").val()}
		$.ajax({
			url:"/test/test",
			method:"post",
			data:param,
			dataType:"json",
			success: (e) => {
                console.log(e);
            }
		})
	})
});
</script>