/**
 * 
 */
function formSubmit(frmId, path){
	let frm = document.getElementById(frmId);
	frm.action=path;
	frm.submit();
}