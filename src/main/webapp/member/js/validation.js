String.prototype.validationID = function(){
	return /^[a-zA-Z][a-zA-Z0-9]{3,}$/.test(this);
};
String.prototype.validationPWD=function(){
	return  /^[a-z0-9]{4,8}$/.test(this);
};
String.prototype.validationMAIL = function(){
	return /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/.test(this);
};
String.prototype.validationNAME = function(){
	return /^[가-힣a-zA-Z]+[가-힣a-zA-Z ]{1,}$/.test(this);
};
String.prototype.validationBIR = function(){
	return /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/.test(this);
};
