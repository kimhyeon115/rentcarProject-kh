/**
 * 
 */

 function writeCheck() {
	 
	 if (document.write_frm.rfbtitle.value.length == 0){
		 alert("제목는 필수 입력사항입니다. 다시 확인 해주세요");
		 return false;
	 }
	 
	 if (document.write_frm.rfbcontent.value.length == 0){
		 alert("글내용은 필수 입력사항입니다. 다시 확인 해주세요");
		 return false;
	 }
	 
	 
	 document.write_frm.submit();
 }