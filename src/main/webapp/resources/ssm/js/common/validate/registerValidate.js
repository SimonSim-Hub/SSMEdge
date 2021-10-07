$.fn.validate = function(form) {
	let result = true;

	const idRE = /^[A-Za-z0-9+]{4,12}$/;
	const num5RE = /^[0-9]{1,5}$/;
	const num10RE = /^[0-9]{1,10}$/;
	const str50RE = /^[A-za-z0-9]{1,50}$/;
	const str100RE = /^[A-za-z0-9]{1,100}$/;
	const nameRE = /^[가-힣a-zA-Z]+$/;
	const emailRE = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	const passwordRE = /^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	const numberRE = /^[0-9]+$/;
	const ip4RE = /^(1|2)?\d?\d([.](1|2)?\d?\d){3}$/;
	const enRE = /^[a-zA-Z]+$/;
	const numberEnRE = /^[a-zA-Z0-9]+$/;

	let passwordCheck = "";

	$.each(form.find("select"), function (index, value) {
		let target;

		for (let i in value.attributes) {
			if(value.attributes[i].name == "data-validate") {

				if(value.attributes[i].value.indexOf("null") > -1) {
					target = $(this);

					if(!validateSelectNullCheck(target, "필수입력 항목 입니다.")) {
						result = false;
					}
				}
			}
		}
	});

	$.each(form.find("input, textarea"), function (index, value) {
		let target;

		for (let i in value.attributes) {
			if(value.attributes[i].name == "data-validate") {

				if(value.attributes[i].value.indexOf("null") > -1) {
					target = $(this);

					if(!validateNullCheck(target, "필수입력 항목 입니다.")) {
						result = false;
					}
				}

				if(value.attributes[i].value.indexOf("id") > -1) {
					target = $(this);

					if(!validateDefaultCheck(idRE, target, "4~12자의 영문 대소문자와 숫자만 입력할 수 있습니다.")) {
						result = false;
					}
				}

				if(value.attributes[i].value.indexOf("name") > -1) {
					target = $(this);

					if(!validateDefaultCheck(nameRE, target, "한글 또는 영문만 사용이 가능합니다.")) {
						result = false;
					}
				}

				if(value.attributes[i].value.indexOf("email") > -1) {
					target = $(this);

					if(!validateDefaultCheck(emailRE, target, "이메일 형식만 입력할 수 있습니다.")) {
						result = false;
					}
				}

				if(value.attributes[i].value.indexOf("password") > -1) {
					target = $(this);

					passwordCheck = $(this).val();

					if(!validateDefaultCheck(passwordRE, target, "4~12자의 숫자 및 특수 문자가 포함되야 합니다.")) {
						result = false;
					}
				}

				if(value.attributes[i].value.indexOf("confirm_password") > -1) {
					target = $(this);

					if(!validateConfirmPasswordCheck(passwordCheck, target, "비밀번호가 일치하지 않습니다.")) {
						result = false;
					}
				}

				if(value.attributes[i].value.indexOf("number") > -1) {
					target = $(this);

					if(!validateConfirmPasswordCheck(numberRE, target, "정수만 입력할 수 있습니다.")) {
						result = false;
					}
				}

				if(value.attributes[i].value.indexOf("en") > -1) {
					target = $(this);

					if(!validateConfirmPasswordCheck(enRE, target, "영문만 입력할 수 있습니다.")) {
						result = false;
					}
				}

				if(value.attributes[i].value.indexOf("numberEn") > -1) {
					target = $(this);

					if(!validateConfirmPasswordCheck(numberEnRE, target, "영문 및 정수만 입력할 수 있습니다.")) {
						result = false;
					}
				}

				if(value.attributes[i].value.indexOf("ip4") > -1) {
					target = $(this);

					if(!validateDefaultCheck(ip4RE, target, "IP주소 형식만 입력할 수 있습니다.")) {
						result = false;
					}
				}

				if(value.attributes[i].value.indexOf("num5") > -1) {
					target = $(this);

					if(!validateDefaultCheck(num5RE, target, "5자리 이하 정수만 입력할 수 있습니다.")) {
						result = false;
					}
				}

				if(value.attributes[i].value.indexOf("num10") > -1) {
					target = $(this);

					if(!validateDefaultCheck(num10RE, target, "10자리 이하 정수만 입력할 수 있습니다.")) {
						result = false;
					}
				}

				if(value.attributes[i].value.indexOf("str50") > -1) {
					target = $(this);

					if(!validateDefaultCheck(str50RE, target, "50자리 이하 문자만 입력할 수 있습니다.")) {
						result = false;
					}
				}

				if(value.attributes[i].value.indexOf("str100") > -1) {
					target = $(this);

					if(!validateDefaultCheck(str100RE, target, "100자리 이하 문자만 입력할 수 있습니다.")) {
						result = false;
					}
				}
			}
		}
	});

	return result;
}

function validateSelectNullCheck(target, message) {
	if(target.attr('data-validate') == "null" && target.val() != "필수입력 항목 입니다.") {
		if(target.val().length > 0) {
			return true;
		}
	}

	target.addClass("ssm-validate-error");

	var option = $("<option value='99'>필수입력 항목 입니다.</option>");

	target.append(option);

	target.val("99").prop("selected", true);
}

function validateNullCheck(target, message) {
	if(target.attr('data-validate') == "null" && target.val() != "필수입력 항목 입니다.") {
		if(target.val().length > 0) {
			return true;
		}
	}

	target.addClass("ssm-validate-error");

	target.val(message);
}

function validateConfirmPasswordCheck(RE, target, message) {
	if(RE.length > 0) {
		if(RE == target.val()) {
			return true;
		}
	}

	if(target.attr('data-validate') == "confirm_password") {
		target.attr("type", "text");
	}

	target.addClass("ssm-validate-error");

	target.val(message);
}

function validateDefaultCheck(RE, target, message) {
	if(RE.test(target.val())) {
		return true;
	}

	if(target.attr('data-validate') == "password") {
		target.attr("type", "text");
	}

	target.addClass("ssm-validate-error");

	target.val(message);
}

$(document).on("click focus", 'input ,textarea', function() {
	if($(this).hasClass("ssm-validate-error") === true) {
		if($(this).attr('data-validate') == "password" || $(this).attr('data-validate') == "confirm_password") {
			$(this).attr("type", "password");
		}

		$(this).removeClass("ssm-validate-error");

		$(this).val("");
	}
});

$(document).on("click focus", 'select', function() {
	if($(this).hasClass("ssm-validate-error") === true) {
		$(this).removeClass("ssm-validate-error");

		$(this).find('[value="99"]').remove();
	}
});
