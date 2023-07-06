/**
 * 
 */

 function freeBoardModifyCheck() {
	 
	 if (document.freeBoardModify_frm.rfbtitle.value.length == 0){
		 alert("제목는 필수 입력사항입니다. 다시 확인 해주세요");
		 return false;
	 }
	 
	 if (document.freeBoardModify_frm.rfbcontent.value.length == 0){
		 alert("글내용은 필수 입력사항입니다. 다시 확인 해주세요");
		 return false;
	 }
	 
	 
	 document.freeBoardModify_frm.submit();
 }