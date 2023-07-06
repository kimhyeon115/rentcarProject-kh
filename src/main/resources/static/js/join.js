/**
 * 
 */

 function joinCheck() {
	 
	 if (document.join_frm.rid.value.length == 0){
		 alert("아이디는 필수 입력사항입니다. 다시 확인 해주세요");
		 return false;
	 }
	 
	 if (document.join_frm.rpw.value.length == 0){
		 alert("비밀번호는 필수 입력사항입니다. 다시 확인 해주세요");
		 return false;
	 }
	 if (document.join_frm.rpw_check.value.length == 0){
		 alert("비밀번호체크는 필수 입력사항입니다. 다시 확인 해주세요");
		 return false;
	 }
	 if (document.join_frm.rpw.value != document.join_frm.rpw_check.value){
		 alert("비밀번호와 비밀번호체크가 일치하지않습니다. 다시 확인 해주세요");
		 return false;
	 }
	 
	 if (document.join_frm.rname.value.length == 0){
		 alert("이름는 필수 입력사항입니다. 다시 확인 해주세요");
		 return false;
	 }
	 if (document.join_frm.rmobile.value.length == 0){
		 alert("전화번호는 필수 입력사항입니다. 다시 확인 해주세요");
		 return false;
	 }
	 
	 if (document.join_frm.remail.value.length == 0){
		 alert("이메일는 필수 입력사항입니다. 다시 확인 해주세요");
		 return false;
		 
	 }
	 
	 document.join_frm.submit();
 }