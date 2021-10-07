$.fn.formReset = function(form) {
	$.each(form, function(index, elem){
		$.each(elem, function(cIndex, cElem){
			const type = cElem.type;
			const tag = cElem.tagName.toLowerCase();

			if (tag === "form") {
				return $(":input", this).clearForm()
			}
			if (
				type === "text" ||
				type === "password" ||
				type === "hidden" ||
				tag === "textarea"
			) {
				this.value = ""
			} else if (type === "checkbox" || type === "radio") {
				this.checked = false
			} else if (tag === "select") {
				this.selectedIndex = -1
			}
		});
	});
}

$.fn.selectBoxAddOption = function(selectBox, code, name) {
	const option = $("<option value="+code+">"+name+"</option>");
	selectBox.append(option);
}

$.fn.selectBoxReset = function(selectBox) {
	selectBox.empty();
}

$.fn.selectBoxVisibleCheck = function(selectBoxDiv, check) {
	if(check) {
		selectBoxDiv.show();
	} else {
		selectBoxDiv.hide();
	}
}

$.fn.divVisibleCheck = function(selectBoxDiv, check) {
	if(check) {
		selectBoxDiv.show();
	} else {
		selectBoxDiv.hide();
	}
}
