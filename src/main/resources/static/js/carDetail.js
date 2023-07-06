/**
 * 
 */

 function deleteConfirmation(cindex) {
	var result = confirm("등록된 차량정보를 삭제하시겠습니까?"); // 알림창 띄우기

	if (result) {	// 'Yes' 버튼을 클릭한 경우
		alert("등록된 차량정보가 삭제되었습니다.");
		document.cardelete.submit();
	}
}	
	
 function updateConfirmation() {
	
	if (document.carupdate.cbrend.value == 0) {
		alert("차량브랜드를 선택해주세요");
		return false;
	}
	if (document.carupdate.cclass.value == 0) {
		alert("차량등급을 선택해주세요");
		return false;
	}
	if (document.carupdate.updatecname.value.length == 0){
		alert("차량명칭을 입력해주세요");
		return false;
	}
	if (document.carupdate.updateccolor.value.length == 0){
		alert("차량색상을 입력해주세요");
		return false;
	}
	if (document.carupdate.coil.value == 0) {
		alert("차량유종을 선택해주세요");
		return false;
	}
	if (document.carupdate.pricename.value.length == 0){
		alert("대여료를 입력해주세요");
		return false;
	}
  	if (document.carupdate.imageUrlInput.value.length == 0) {
		alert("차량이미지를 등록해주세요");
		return false;
	}
		 
	var result = confirm("등록된 차량정보를 수정하시겠습니까?"); // 알림창 띄우기
		
	if (result) {	// 'Yes' 버튼을 클릭한 경우
		alert("등록된 차량정보가 수정되었습니다.");
		document.carupdate.submit();
	}
}
	
function validateNumericInput(input) {
		
	input.value = input.value.replace(/[^0-9]/g, "");
}

function displayImage() {
	  
  	if (document.carupdate.imageUrlInput.value.length == 0) {
		alert("이미지 URL를 입력해주세요");
		return false;
	}
    var imageUrl = document.getElementById("imageUrlInput").value;
    var imagePreview = document.getElementById("previewImage");
    imagePreview.src = imageUrl;
}