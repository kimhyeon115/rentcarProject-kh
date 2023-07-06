/**
 * 
 */

  function deleteCheck() {	 
	 
	 if (document.delete_frm.rpw.value.length == 0){
		 alert("비밀번호는 필수 입력사항입니다. 다시 확인 해주세요");
		 return false;
	 }
	 if (document.delete_frm.rpw_check.value.length == 0){
		 alert("비밀번호체크는 필수 입력사항입니다. 다시 확인 해주세요");
		 return false;
	 }
	 if (document.delete_frm.rpw.value != document.delete_frm.rpw_check.value){
		 alert("비밀번호와 비밀번호체크가 일치하지않습니다. 다시 확인 해주세요");
		 return false;
	 }
	 
	 var storedPassword = document.delete_frm.storedPassword.value;
     var inputPassword = document.delete_frm.rpw.value;
    
     if (storedPassword !== inputPassword) {
         alert("가입하신 비밀번호와 일치하지 않습니다. 다시 확인 해주세요");
         return false;
     }
	 
	 document.delete_frm.submit();
 }