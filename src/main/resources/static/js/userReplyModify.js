/**
 * 
 */

 function userReplyModifyCheck() {
	 
	 if (document.userReplyModify_frm.rrcontent.value.length == 0){
		 alert("글내용은 필수 입력사항입니다. 다시 확인 해주세요");
		 return false;
	 }
	 
	 
	 document.userReplyModify_frm.submit();
 }