function alarmPopUp (status, message, reDirectUrl) {
	
	toastr.options = {
		"closeButton" : true,
		"debug" : false,
		"newestOnTop" : false,
		"progressBar" : false,
		"positionClass" : "toast-top-right",
		"preventDuplicates" : false,
		"onclick" : null,
		"showDuration" : "300",
		"hideDuration" : "1000",
		"timeOut" : 0,
		"extendedTimeOut" : 0,
		"showEasing" : "swing",
		"hideEasing" : "linear",
		"showMethod" : "fadeIn",
		"hideMethod" : "fadeOut",
		"tapToDismiss" : false
	};
	
	if(status == 0) {
		toastr.options.closeButton = false;
		toastr.options.timeOut = 5000;
		toastr.options.progressBar = true;
		
		toastr.info(message, 'INFO!');
	} else if (status == 1) {
		toastr.options.closeButton = false;
		toastr.options.timeOut = 5000;
		toastr.options.progressBar = true;
		
		if(reDirectUrl.length > 0) {
			toastr.options.onHidden = function() {
				$(location).attr("href", reDirectUrl);
			}
		}
		
		toastr.success(message, 'SUCCESS!');
	} else if (status == 2) { 
		toastr.warning(message, 'WARNING!');
	} else if (status == 3) {
		toastr.error(message, 'ERROR!');
	}
        
}

function confirmPopUp (title, message, callbackFunction) {
	const confirmPopUp = $.confirm({
		title: title,
		content: message,
		closeIcon: true,
		animation: 'scale',
		buttons: {
			cancel: {
				text: '취소',
				btnClass: 'btn-warning'
			},
			confirm: {
				text: '확인',
				btnClass: 'btn-success',
				action: function () {
					callbackFunction();
				}
			}
		}
	});
}

function promptPopUp (title, content, buttonTitle, alertSize, callbackFunction) {
	const promptPopUp = $.confirm({
		title: title,
		content: content,
		closeIcon: true,
		animation: 'scale',
		columnClass: alertSize,
		buttons: {
			cancel: {
				text: '취소',
				btnClass: 'btn-warning'
			},
			confirm: {
				text: buttonTitle,
				btnClass: 'btn-success',
				action: function () {
					const result = callbackFunction();

					return result;
				}
			}
		}
	});

	return promptPopUp;
}

function dataFormPopUp (title, message, callbackFunction) {
	const confirmPopUp = $.confirm({
		title: title,
		content: message,
		closeIcon: true,
		animation: 'scale',
		buttons: {
			cancel: {
				text: '취소',
				btnClass: 'btn-warning'
			},
			confirm: {
				text: '확인',
				btnClass: 'btn-success',
				action: function () {
					callbackFunction();
				}
			}
		}
	});
}