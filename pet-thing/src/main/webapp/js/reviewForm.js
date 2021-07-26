/**
 * 
 */
function review(frmId, path, pageValue){
	let frm = document.getElementById(frmId);
	let currentPage = document.getElementsByName("currentPage");
	currentPage[0].value = pageValue;
	
	formSubmit(frmId, path);
}