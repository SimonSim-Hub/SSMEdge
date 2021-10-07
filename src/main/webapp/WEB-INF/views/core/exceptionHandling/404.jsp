<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>

<html>
<head>
	<base href="./">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

	<title>Error 404</title>

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
<body class="app flex-row align-items-center">

<input id="userId" type="hidden" class="form-control" type="text" value="<sec:authentication property='name'/>">
<input id="errorCode" type="hidden" class="form-control" type="text" value="${code}">
<input id="errorMsg" type="hidden" class="form-control" type="text" value="${msg}">
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="clearfix">
				<h1 class="float-left display-3 mr-4">404</h1>
				<h4 class="pt-3">프로그램 오류가 발생했습니다.</h4>
				<p class="text-muted">오류 내용을 남겨 주시면 관리자가 확인할 수 있습니다.</p>
			</div>
			<form id="ErrorRegister" action="<%=request.getContextPath()%>/core/exceptionHandling/insertErrorMessage" method="post">
				<div class="input-prepend input-group">
					<div class="input-group-prepend">
							<span class="btn btn-danger">
								<i class="fas fa-marker"></i>
							</span>
					</div>
					<input id="userComment" class="form-control" data-validate="null" type="text" placeholder="에러 내용에 대한 간단한 설명">
					<span class="input-group-append">
							<button id="btnErrorRegister" class="btn btn-primary" type="button">보내기</button>
						</span>
				</div>
			</form>
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

		$("#btnErrorRegister").click(function() {
			if(!$.fn.validate($("#ErrorRegister"))) {
				return false;
			} else {
				loadingStart("에러 메시지를 등록 중입니다. 잠시만 기다려주세요.");
			}

			const action = $("#ErrorRegister").attr('action');

			const form_data = {
				userId : $("#userId").val(),
				errorCode: $("#errorCode").val(),
				errorMsg: $("#errorMsg").val(),
				userComment: $("#userComment").val()
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
					alarmPopUp(resultData.resultStatus, resultData.resultMessage, "<%=request.getContextPath()%>/core/main/dashboardPage");
				},
				error : function(jqXHR, resultData) {
					alarmPopUp(2, "에러 메시지 등록 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
				},
				complete : function() {
					loadingEnd();
				}
			});

			return false;
		});
	});
</script>
</html>
