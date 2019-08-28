String.prototype.validationID = function(){
	return /^[a-zA-Z]+/.test(this);
};