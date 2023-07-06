/**
 * 
 */

 function freeReplyModifyCheck() {
	 
	 if (document.freeReplyModify_frm.rfrcontent.value.length == 0){
		 alert("글내용은 필수 입력사항입니다. 다시 확인 해주세요");
		 return false;
	 }
	 
	 
	 document.freeReplyModify_frm.submit();
 }