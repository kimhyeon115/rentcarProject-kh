/**
 * 
 */

 function lightCarSubmitForm() {
	 var paragraphText = document.getElementById("lightCar").textContent
	 var paramInput = document.getElementById("pInput");
	 paramInput.value = paragraphText;
	 
	 submitButton.click();
 }
 function subcompactCarSubmitForm() {
	 var paragraphText = document.getElementById("subcompactCar").textContent
	 var paramInput = document.getElementById("pInput");
	 paramInput.value = paragraphText;
	 
	 submitButton.click();
 }
 function mediumsizedCarSubmitForm() {
	 var paragraphText = document.getElementById("mediumsizedCar").textContent
	 var paramInput = document.getElementById("pInput");
	 paramInput.value = paragraphText;
	 
	 submitButton.click();
 }
 function luxuryCarSubmitForm() {
	 var paragraphText = document.getElementById("luxuryCar").textContent
	 var paramInput = document.getElementById("pInput");
	 paramInput.value = paragraphText;
	 
	 submitButton.click();
 }
 function RVCarSubmitForm() {
	 var paragraphText = document.getElementById("RVCar").textContent
	 var paramInput = document.getElementById("pInput");
	 paramInput.value = paragraphText;
	 
	 submitButton.click();
 }
 function vanCarSubmitForm() {
	 var paragraphText = document.getElementById("vanCar").textContent
	 var paramInput = document.getElementById("pInput");
	 paramInput.value = paragraphText;
	 
	 submitButton.click();
 } 
 
 function goBack() {
    history.back();
 }

 function confirmCancellation(rtnum) {
  var confirmation = confirm("예약을 취소하시겠습니까?");

  if (confirmation) {    
    window.location.href = "reservationdelete?rtnum=" + rtnum;
  }
  
 } 