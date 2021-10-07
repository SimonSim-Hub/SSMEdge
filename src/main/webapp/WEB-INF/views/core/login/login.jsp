<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<base href="./">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

<title>로그인</title>

<!-- CoreUI -->
<link href="<%=request.getContextPath()%>/resources/plugins/coreUI/dist/css/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/plugins/coreUI/dist/vendors/pace-progress/css/pace.min.css" rel="stylesheet">
<!-- adminLTE -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/dist/css/adminlte.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/fontawesome-free/css/all.min.css">
<!-- 알람 팝업 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/toastr-master/dist/css/toastr.css">
<!-- 로딩 이미지 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/loading-master/dist/css/easy-loading.css">
<!-- 공통 CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/ssm/css/ssmCSS.css">

</head>
<body class="app flex-row align-items-center bbc content-wrapper">
<div class="container">
	<input type="hidden" id="resultStatus" value="${resultStatus}">
	<input type="hidden" id="resultMessage" value="${resultMessage}">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="card-group">
				<div class="card p-4 cbc">
					<div class="card-body">
						<h1>로그인</h1>
						<p class="text-muted">사용자 계정으로 로그인 하세요.</p>
						<form id="loginForm" action="<%=request.getContextPath()%>/core/login/userLoginCheck" method="post">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
										<span class="input-group-text bbc">
											<i class="fa fa-user"></i>
										</span>
								</div>
								<input id="userId" data-validate="id" class="form-control enterEvent-btnLogin" autocomplete="off" type="text" placeholder="아이디">
							</div>
							<div class="input-group mb-4">
								<div class="input-group-prepend">
										<span class="input-group-text bbc">
											<i class="fa fa-lock"></i>
										</span>
								</div>
								<input id="userPassword" data-validate="password" class="form-control enterEvent-btnLogin" autocomplete="new-password" type="password" placeholder="비밀번호">
							</div>
							<div class="row">
								<div class="col-6">
									<button id="btnLogin" class="btn btn-primary px-4" type="button">로그인</button>
								</div>
								<div class="col-6 text-right">
									<button class="btn btn-link px-0" type="button"  onclick="location.href='<%=request.getContextPath()%>/core/login/searchUserInfo'">
										아이디 / 비밀번호 찾기
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="card bg-primary py-5 d-md-down-none" style="width: 44%">
					<div class="card-body text-center">
						<div>
							<h2>사용자 등록</h2>
							<p>사용자 등록 시<br> 관리자 승인 후 시스템에 로그인이 가능 합니다.</p>
							<button class="btn btn-primary active mt-3" type="button" onclick="location.href='<%=request.getContextPath()%>/core/login/register'">사용자 등록 하러 가기</button>
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

	$("#btnLogin").click(function() {
		if(!$.fn.validate($("#loginForm"))) {
			return false;
		} else {
			loadingStart("사용자 정보 확인 중입니다. 잠시만 기다려주세요.");
		}

		const action = $("#loginForm").attr('action');

		const form_data = {
			userId: $("#userId").val(),
			userPassword: CryptoJS.SHA256($("#userPassword").val()).toString()
		};

		$.ajax({
			type: "POST",
			url: action,
			data: form_data,
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(resultData) {

				if(resultData.resultStatus == 1) {
					userLogin();
				} else {
					alarmPopUp(resultData.resultStatus, resultData.resultMessage, "");

					return false;
				}
			},
			error : function(jqXHR, resultData) {
				alarmPopUp(2, "사용자 정보 확인 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
			},
			complete : function() {
				loadingEnd();
			}

		});
	});

	function userLogin() {

		if(!$.fn.validate($("#loginForm"))) {
			return false;
		} else {
			loadingStart("사용자 로그인중입니다. 잠시만 기다려주세요.");
		}

		const action = "<%=request.getContextPath()%>/core/login/userLogin";

		const form_data = {
			userId: $("#userId").val(),
			userPassword: CryptoJS.SHA256($("#userPassword").val()).toString()
		};

		$.ajax({
			type: "POST",
			url: action,
			data: form_data,
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(resultData) {
				const resultObject = JSON.parse(resultData);

				if (resultObject.redirect && resultObject.redirectUrl != null) {
					window.location.href = "<%=request.getContextPath()%>" + resultObject.redirectUrl;
				}
			},
			error : function(jqXHR, resultData) {
				alarmPopUp(2, "사용자 로그인 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
			},
			complete : function() {

				loadingEnd();
			}

		});
	}
</script>

</html>