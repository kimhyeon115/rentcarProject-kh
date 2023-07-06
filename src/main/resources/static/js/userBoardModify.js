/**
 * 
 */

 function userBoardModifyCheck() {
	 
	 if (document.userBoardModify_frm.rbtitle.value.length == 0){
		 alert("제목는 필수 입력사항입니다. 다시 확인 해주세요");
		 return false;
	 }
	 
	 if (document.userBoardModify_frm.rbcontent.value.length == 0){
		 alert("글내용은 필수 입력사항입니다. 다시 확인 해주세요");
		 return false;
	 }
	 
	 
	 document.userBoardModify_frm.submit();
 }