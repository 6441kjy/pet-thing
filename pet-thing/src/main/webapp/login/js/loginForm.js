/**
 * 
 */
function chkInput() {
		const inputId = document.getElementById('floatingInput');
		const inputPw = document.getElementById('floatingPassword');
		const blank_pattern = /[\s]/g;
		const special_pattern = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
		
		
		if(inputId.value==""||inputPw.value=="") {
			alert('입력되지 않은 항목이 있습니다.');
			return false;
		}
		
		if(blank_pattern.test(inputId.value)==true||blank_pattern.test(inputPw.value)==true) {
			alert('공백은 사용할 수 없습니다.');
			return false;
		}
		
		if(special_pattern.test(inputId.value)==true) {
			alert('특수문자는 사용할 수 없습니다.');
			(inputId.value).replace(special_pattern,"");
			return false;
		}
		
		if(special_pattern.test(inputPw.value)==true) {
			alert('특수문자는 사용할 수 없습니다.');
			(inputPw.value).replace(special_pattern,"");
			return false;
		}
		
		formSubmit();
	}
	
	function enter() {
		if(window.event.keyCode==13)
			chkInput();
	}
	
	function formSubmit() {
		const loginForm = document.getElementById('loginForm');
		loginForm.submit();
	}