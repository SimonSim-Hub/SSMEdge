function loadingStart (message) {
	EasyLoading.show({
        type: EasyLoading.TYPE["LINE_SCALE_PULSE_OUT_RAPID"],
        text: message,
        timeout: false
    });
}

function loadingEnd () {
	EasyLoading.hide();
}