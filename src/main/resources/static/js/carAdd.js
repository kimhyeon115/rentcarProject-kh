/**
 * 
 */
	
	function addConfirmation() {
	
		if (document.caradd.cbrend.value == 0) {
			alert("차량브랜드를 선택해주세요");
			return false;
		}
		if (document.caradd.cclass.value == 0) {
			alert("차량등급을 선택해주세요");
			return false;
		}
		if (document.caradd.addcname.value.length == 0){
			alert("차량명칭을 입력해주세요");
			return false;
		}
		if (document.caradd.addccolor.value.length == 0){
			alert("차량색상을 입력해주세요");
			return false;
		}
		if (document.caradd.coil.value == 0) {
			alert("차량유종을 선택해주세요");
			return false;
		}
		if (document.caradd.pricename.value.length == 0){
			alert("대여료를 입력해주세요");
			return false;
		}
	  	if (document.caradd.imageUrlInput.value.length == 0) {
			alert("차량이미지를 등록해주세요");
			return false;
		}		 
		var result = confirm("차량정보를 등록하시겠습니까?"); // 알림창 띄우기
		
		if (result) {	// 'Yes' 버튼을 클릭한 경우
			alert("차량정보가 등록되었습니다.");
			document.caradd.submit();
		}
	}
	
	function validateNumericInput(input) {
		
	    input.value = input.value.replace(/[^0-9]/g, "");
	}

  document.getElementById("fileInput").addEventListener("change", function(event) {
    var input = event.target;
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function(e) {
        var previewImage = document.getElementById("previewImage");
        previewImage.src = e.target.result;
      };

      reader.readAsDataURL(input.files[0]);
    }
  });

  function displayImage() {
	  
  	if (document.caradd.imageUrlInput.value.length == 0) {
		alert("이미지 URL를 입력해주세요");
		return false;
	}
    var imageUrl = document.getElementById("imageUrlInput").value;
    var imagePreview = document.getElementById("previewImage");
    imagePreview.src = imageUrl;
  }
