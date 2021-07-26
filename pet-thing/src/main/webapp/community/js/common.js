/**
 * function IsEmpty(id){
	let inputTag = document.getElementById(id);
	if(inputTag.value==""){
		alert("test");
		inputTag.focus();
		return false;
	}
	return true;
}
 */


function formSubmit(frmId, path){
	let frm = document.getElementById(frmId);
	frm.action=path;
	frm.submit();
}