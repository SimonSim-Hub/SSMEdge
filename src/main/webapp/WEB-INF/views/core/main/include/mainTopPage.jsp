<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="<%=request.getContextPath()%>/core/main/dashboardPage" class="nav-link">Home</a>
        </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <li id="systemSetting" class="nav-item">
            <a class="nav-link" href="javascript:defaultSettingCheck();" role="button">
                <i class="fas fa-cog"></i>
            </a>
        </li>
        <li class="nav-item">
            <a id="logoutBtn" class="nav-link" href="javascript:logout();" role="button">
                <i class="fas fa-sign-out-alt"></i>
            </a>
        </li>
    </ul>
</nav>

<script>
    function logout() {
        confirmPopUp("로그아웃", "로그아웃 하시겠습니까?", function() {
            window.location.href = '<%=request.getContextPath()%>/logout';
        });
    }

    function defaultSettingCheck() {
        confirmPopUp("시스템 설정 변경", "시스템 설정을 변경하시겠습니까?", function() {
            defaultSettingPopup();

            selectSystemSetting();
        });
    }

    function defaultSettingPopup() {
        const title = '설정 변경';
        const content = '' +
            '<form id="updateSystemSettingForm" method="post">' +
            '   <div class="form-group row">' +
            '	    <label for="threadDelay" class="col-sm-6 col-form-label">조회 시간 (ms) :</label>' +
            '	    <div class="col-sm-6">' +
            '	    	<input id="threadDelay" data-validate="null" autocomplete="off" type=number class="form-control enterEvent-selectTagMasterListBtn">' +
            '	    </div>' +
            '   </div>' +
            '   <div class="form-group row">' +
            '	    <label for="mainChartQty" class="col-sm-6 col-form-label">메인 차트 수량 (Qty) :</label>' +
            '	    <div class="col-sm-6">' +
            '	    	<input id="mainChartQty" data-validate="null" autocomplete="off" type=number class="form-control enterEvent-selectTagMasterListBtn">' +
            '	    </div>' +
            '   </div>' +
            '   <div class="form-group row">' +
            '	    <label for="detailChartQty" class="col-sm-6 col-form-label">상세 차트 수량 (Qty) :</label>' +
            '	    <div class="col-sm-6">' +
            '	    	<input id="detailChartQty" data-validate="null" autocomplete="off" type=number class="form-control enterEvent-selectTagMasterListBtn">' +
            '	    </div>' +
            '   </div>' +
            '   <div class="form-group row">' +
            '	    <label for="reportChartQty" class="col-sm-6 col-form-label">이력 목록 수량 (Qty) :</label>' +
            '	    <div class="col-sm-6">' +
            '	    	<input id="reportChartQty" data-validate="null" autocomplete="off" type=number class="form-control enterEvent-selectTagMasterListBtn">' +
            '	    </div>' +
            '   </div>' +
            '</form>';
        const buttonTitle = "설정 변경";

        promptPopUp(title, content, buttonTitle, 'col-md-4', function () {
            if (!$.fn.validate($("#updateSystemSettingForm"))) {
                return false;
            }
            updateSystemSetting();
        });
    }

    function selectSystemSetting() {
        if($('#reportChartQty').val() == undefined) {
            setTimeout(function() {
                selectSystemSetting();

                return false;
            }, 500);
        }

        const action = "<%=request.getContextPath()%>/core/main/dashboard/selectSystemSetting";

        const form_data = null;

        $.ajax({
            type: "POST",
            url: action,
            data: form_data,
            async: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (resultData) {
                if(resultData != null) {
                    const threadDelay = resultData.threadDelay;
                    const mainChartQty = resultData.mainChartQty;
                    const detailChartQty = resultData.detailChartQty;
                    const reportChartQty = resultData.reportChartQty;

                    $('#threadDelay').val(threadDelay);
                    $('#mainChartQty').val(mainChartQty);
                    $('#detailChartQty').val(detailChartQty);
                    $('#reportChartQty').val(reportChartQty);
                }
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "시스템 설정 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {

            }
        });
    }

    function updateSystemSetting() {
        loadingStart("시스템 설정 변경 중 입니다. 잠시만 기다려주세요.");

        const action = "<%=request.getContextPath()%>/core/main/dashboard/updateSystemSetting";

        const threadDelay = $('#threadDelay').val();
        const mainChartQty = $('#mainChartQty').val();
        const detailChartQty = $('#detailChartQty').val();
        const reportChartQty = $('#reportChartQty').val();

        const form_data = {
            threadDelay: threadDelay,
            mainChartQty: mainChartQty,
            detailChartQty: detailChartQty,
            reportChartQty: reportChartQty
        };

        $.ajax({
            type: "POST",
            url: action,
            data: form_data,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (resultData) {
                alarmPopUp(resultData.resultStatus, resultData.resultMessage, "");
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "시스템 설정 변경 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
                selectSensorMasterList();

                loadingEnd();
            }
        });
    }
</script>