<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<base href="./">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

<title>사용자 등록</title>

<!-- CoreUI -->
<link href="<%=request.getContextPath()%>/resources/plugins/coreUI/dist/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/plugins/coreUI/dist/vendors/pace-progress/css/pace.min.css" rel="stylesheet">
<!-- adminLTE -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/dist/css/adminlte.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/fontawesome-free/css/all.min.css">
<!-- 알람 팝업 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/toastr-master/dist//css/toastr.css">
<!-- 로딩 이미지 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/loading-master/dist//css/easy-loading.css">
<!-- 공통 CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/ssm/css/ssmCSS.css">

</head>
<body class="app flex-row align-items-center bbc content-wrapper">
	<div class="container" id="main-container">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card mx-4 cbc">
					<div class="card-body p-4">
						<h1>계정 생성</h1>
						<p class="text-muted">사용자 계정을 생성하십시오.</p>
						<form id="registerForm" action="<%=request.getContextPath()%>/core/login/insertRegister" method="post">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bbc">
										<i class="fa fa-address-card"></i>
									</span>
								</div>
								<input id="userName" data-validate="name" class="form-control enterEvent-btnRegister" autocomplete="off" type="text" placeholder="이름">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bbc"> 
										<i class="fa fa-user"></i>
									</span>
								</div>
								<input id="userId" data-validate="id" class="form-control enterEvent-btnRegister" autocomplete="off" type="text" placeholder="아이디">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bbc simon-width-40px">
										<i class="fa fa-envelope"></i>
									</span>
								</div>
								<input id="userEmail" data-validate="email" class="form-control enterEvent-btnRegister" autocomplete="off" type="text" placeholder="이메일">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text bbc simon-width-40px"> 
										<i class="fa fa-lock"></i>
									</span>
								</div>
								<input id="userPassword" data-validate="password" class="form-control enterEvent-btnRegister" autocomplete="new-password" type="password" placeholder="비밀번호">
							</div>
							<div class="input-group mb-4">
								<div class="input-group-prepend">
									<span class="input-group-text bbc simon-width-40px"> 
										<i class="fa fa-unlock"></i>
									</span>
								</div>
								<input id="confirm_password" data-validate="confirm_password" class="form-control enterEvent-btnRegister" type="password" placeholder="비밀번호 확인">
							</div>
							<button id="btnRegister" class="btn btn-block btn-primary"  type="button">
								계정 생성
							</button>
						</form>
					</div>
					<div class="card-footer p-4 bbc">
						<div class="row">
							<div class="col-6">
								<button class="btn btn-block btn-primary active" type="button" onclick="location.href='<%=request.getContextPath()%>/core/login'">
									<span>로그인 화면</span>
								</button>
							</div>
							<div class="col-6">
								<button class="btn btn-block btn-primary active" type="button" onclick="location.href='<%=request.getContextPath()%>/core/login/searchUserInfo'">
									<span>아이디 / 비밀번호 찾기</span>
								</button>
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

	$("#btnRegister").click(function() {
		if(!$.fn.validate($("#registerForm"))) {
			return false;
		} else {
			loadingStart("사용자 계정을 생성중입니다. 잠시만 기다려주세요.");
		}

		const action = $("#registerForm").attr('action');

		const form_data = {
			userId: $("#userId").val(),
			userName: $("#userName").val(),
			userEmail: $("#userEmail").val(),
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
				alarmPopUp(resultData.resultStatus, resultData.resultMessage, "<%=request.getContextPath()%>/login");

				if(resultData.resultStatus == 1) {
					$.fn.formReset($("#registerForm"));
				}
			},
			error : function(jqXHR, resultData) {
				alarmPopUp(2, "목록 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
			},
			complete : function() {
				loadingEnd();
			}
		});
	});
</script>

</html>