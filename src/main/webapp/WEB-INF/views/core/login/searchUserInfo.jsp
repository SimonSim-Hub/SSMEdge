<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<base href="./">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

<title>아이디/비밀번호 찾기</title>

<!-- CoreUI -->
<link href="<%=request.getContextPath()%>/resources/plugins/coreUI/dist/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/plugins/coreUI/dist/vendors/pace-progress/css/pace.min.css" rel="stylesheet">
<!-- adminLTE -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/dist/css/adminlte.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/fontawesome-free/css/all.min.css">
<!-- 알람 팝업 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/toastr-master/dist//css/toastr.css">
<!-- confirm -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/jquery-confirm/dist/css/jquery-confirm.css">
<!-- 로딩 이미지 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/loading-master/dist//css/easy-loading.css">
<!-- 공통 CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/ssm/css/ssmCSS.css">

</head>
<body class="app flex-row align-items-center bbc content-wrapper">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card-group">
					<div class="card text-white bg-primary py-5 d-md-down-none bg-simon" style="width: 44%">
						<div class="card-body text-center">
							<form id="selectUserIdForm" action="<%=request.getContextPath()%>/core/login/selectUserId" method="post">	
								<h1>아이디 조회</h1>
								<p class="text-muted">이메일 주소를 입력하세요.</p>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text bbc simon-width-40px btn-primary active">
											<i class="fa fa-envelope"></i>
										</span>
									</div>
									<input hidden="hidden" />
									<input id="userEmail_01" data-validate="email" class="form-control enterEvent-selectUserIdBtn" autocomplete="off" type="text" placeholder="이메일">
								</div>
								<button id="selectUserIdBtn" class="btn btn-primary active mt-3 bgb-simon" type="button">아이디 조회</button>
							</form>
						</div>
					</div>
					<div class="card cbc">
						<div class="card-body p-4">
							<form id="defaultUpdateUserPasswordForm">	
								<h1>비밀번호 변경</h1>
								<p class="text-muted">사용자 계정과 이메일 주소를 입력하세요.</p>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text bbc">
											<i class="fa fa-user"></i>
										</span>
									</div>
									<input id="userId" data-validate="id" class="form-control enterEvent-defaultUpdateUserPasswordBtn" autocomplete="off" type="text" placeholder="아이디">
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text bbc simon-width-40px">
											<i class="fa fa-envelope"></i>
										</span>
									</div>
									<input id="userEmail_02" data-validate="email" class="form-control enterEvent-defaultUpdateUserPasswordBtn" autocomplete="off" type="text" placeholder="이메일">
								</div>
								<div class="row">
									<div class="col-12 text-right">
										<button id="defaultUpdateUserPasswordBtn" class="btn btn-primary px-4" type="button">비밀번호 변경</button>
									</div>
								</div>
							</form>
						</div>
						<div class="card-footer p-4 bbc">
							<div class="row">
								<div class="col-12">
									<button class="btn btn-block btn-primary active" type="button" onclick="location.href='<%=request.getContextPath()%>/core/login'">
										<span>로그인 화면</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/jquery/jquery.js"></script>
<!-- bootstrap -->
<script src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- jquery-confirm -->
<script src="<%=request.getContextPath()%>/resources/plugins/jquery-confirm/dist/js/jquery-confirm.js"></script>
<!-- 알람 팝업 -->
<script src="<%=request.getContextPath()%>/resources/plugins/toastr-master/dist/js/toastr.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/alarm/alarmPopUp.js"></script>
<!-- 로딩 이미지 -->
<script src="<%=request.getContextPath()%>/resources/plugins/loading-master/dist/js/easy-loading.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/loading/loading.js"></script>
<!-- 등록 정규식 -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/validate/registerValidate.js"></script>
<!-- sha -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/sha/core.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/sha/sha256.min.js"></script>
<!-- Form 컨트롤 -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/form/formReset.js"></script>
<!-- Key Event 컨트롤 -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/keyEvent/mainBodyKeyEvent.js"></script>

<script type="text/javascript">
	$(document).ready(function() { 
	});

	let updateUserPasswordModal = null;

	$("#selectUserIdBtn").click(function() {
		if(!$.fn.validate($("#selectUserIdForm"))) {
			return false;
		} else {
			loadingStart("사용자 계정을 조회중입니다. 잠시만 기다려주세요.");
		}

		const action = $("#selectUserIdForm").attr('action');

		const form_data = {
			userEmail: $("#userEmail_01").val()
		};

		$.ajax({
			type: "POST",
			url: action,
			data: form_data,
			dataType: "JSON",
			beforeSend : function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(resultData) {
				alarmPopUp(resultData.resultStatus, resultData.resultMessage, "");

				if(resultData.resultStatus == 1) {
					$.fn.formReset($("#selectUserIdForm"));	
				}
				
				$("#userId").val(resultData.userId);
				$("#userEmail_02").val(resultData.userEmail);
			},
			error : function(jqXHR, resultData) {
				alarmPopUp(2, "사용자 아이디 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
			},
			complete : function() {
				loadingEnd();
			}
		});
	});
	
	$("#defaultUpdateUserPasswordBtn").click(function() {
		if(!$.fn.validate($("#defaultUpdateUserPasswordForm"))) {
			return false;
		}

		const title = '비밀번호 변경';
		const content = '' +
				'<form id="updateUserPasswordForm" action="<%=request.getContextPath()%>/core/login/updateUserPassword" method="post">' +
				'	<div class="input-group mb-3 simon-first-popup-input">' +
				'		<div class="input-group-prepend">' +
				'			<span class="input-group-text bbc simon-width-40px"> ' +
				'				<i class="fa fa-lock"></i>' +
				'			</span>' +
				'		</div>' +
				'		<input id="userPassword" data-validate="password" class="form-control enterEventPop-defaultUpdateUserPassword" type="password" placeholder="신규 비밀번호">' +
				'	</div>' +
				'	<div class="input-group mb-4 simon-last-popup-input">' +
				'		<div class="input-group-prepend">' +
				'			<span class="input-group-text bbc simon-width-40px"> ' +
				'				<i class="fa fa-unlock"></i>' +
				'			</span>' +
				'		</div>' +
				'		<input id="confirm_password" data-validate="confirm_password" class="form-control enterEventPop-defaultUpdateUserPassword" type="password" placeholder="비밀번호 확인">' +
				'	</div>' +
				'</form>';
		const buttonTitle = "비밀번호 변경";

		updateUserPasswordModal = promptPopUp(title, content, buttonTitle, 'col-md-4', function() {
			const result = defaultUpdateUserPassword();

			return result;
		});
	});
	
	function defaultUpdateUserPassword() {
		
		if(!$.fn.validate($("#updateUserPasswordForm"))) {
			return false;
		} else {
			loadingStart("사용자 비밀번호를 변경중입니다. 잠시만 기다려주세요.");
		}

		const action = $("#updateUserPasswordForm").attr('action');

		const form_data = {
			userId: $("#userId").val(),
			userEmail: $("#userEmail_02").val(),
			userPassword: CryptoJS.SHA256($("#userPassword").val()).toString()
		};

		$.ajax({
			type: "POST",
			url: action,
			data: form_data,
			dataType: "JSON",
			beforeSend : function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(resultData) {
				alarmPopUp(resultData.resultStatus, resultData.resultMessage, "<%=request.getContextPath()%>/core/login");

				if(resultData.resultStatus == 1) {
					$.fn.formReset($("#updateUserPasswordForm"));
				}
			},
			error : function(jqXHR, resultData) {
				alarmPopUp(2, "사용자 비밀번호 변경 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
				
				return false;
			},
			complete : function() {
				loadingEnd();
				updateUserPasswordModal.close();
			}
		});

		return true;
	}
	
</script>

</html>