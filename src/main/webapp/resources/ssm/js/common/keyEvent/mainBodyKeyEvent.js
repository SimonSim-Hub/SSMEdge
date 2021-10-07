document.addEventListener('keydown', function(event) {
	if (event.keyCode === 13) {
		event.preventDefault();
	};
}, true);

$("body").keydown(function(key) {
	if (key.keyCode == 13) {
		const eventObject = document.activeElement;

		const classArr = eventObject.getAttribute('class').split(' ');

		for(let i = 0; i < classArr.length; i++) {
			if(classArr[i].indexOf("enterEvent") != -1){

				if(classArr[i].indexOf("enterEventPop") != -1) {
					const eventFunctionName = classArr[i].substring(14, classArr[i].length);

					window[eventFunctionName]();

					$('.modal').modal('hide');
				} else {
					const eventBtnId = "#" + classArr[i].substring(11, classArr[i].length);

					$(eventBtnId).click();
				}
			}
		}
	}
});