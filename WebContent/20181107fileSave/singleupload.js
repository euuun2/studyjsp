/**
 * 
 */
$(document).ready(function(){
	//Ajax 방식으로 요청 페이지를 호출해 파일을 업로드한다.
	$("#upForm1").ajaxForm({
		success:function(data,status){//업로드에 성공하면 수행
			$("#upResult").html(data);
		}
	})
})