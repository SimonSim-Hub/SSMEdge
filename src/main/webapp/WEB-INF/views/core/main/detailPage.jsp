<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
<head>
    <base href="./">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

    <title>센서 상세 목록 조회</title>

    <!-- adminLTE -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/dist/css/adminlte.min.css">
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/fontawesome-free/css/all.min.css">
    <!-- confirm -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/jquery-confirm/dist/css/jquery-confirm.css">
    <!-- 경고 팝업 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/toastr-master/dist//css/toastr.css">
    <!-- 로딩 이미지 -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/plugins/loading-master/dist//css/easy-loading.css">
    <!-- Data Table -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <!-- c3 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/ssm/js/common/c3/c3.min.css">
    <!-- 공통 CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/ssm/css/ssmCSS.css">


</head>
<body class="hold-transition text-sm sidebar-mini">
<div class="wrapper">
    <!-- Include -->
    <%@include file="/WEB-INF/views/core/main/include/mainTopPage.jsp" %>
    <%@include file="/WEB-INF/views/core/main/include/mainLeftPage.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">센서 상세 목록 조회</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/core/main/dashboardPage">홈</a></li>
                            <li class="breadcrumb-item active">상세 정보</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-3">
                        <form id="selectSensorDetailForm" action="<%=request.getContextPath()%>/core/main/detail/selectSensorDetail" method="post">
                            <input id="resSensorCode" type="hidden" value="${sensorCode}">
                            <input id="resDeviceCode" type="hidden" value="${deviceCode}">
                            <input id="resLocationCode" type="hidden" value="${locationCode}">
                            <div class="card card-primary card-outline">
                                <div class="card-header">
                                    <h3 class="card-title">기본 검색조건</h3>
                                </div>
                                <div class="card-body">
                                    <div class="form-group row">
                                        <label for="locationCode" class="col-sm-3 col-form-label">로케이션 :</label>
                                        <div class="col-sm-9">
                                            <select id="locationCode" data-validate="null" class="form-control" value="">
                                                <option value="">- 로케이션 선택 -</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="deviceCodeDiv" class="form-group row">
                                        <label for="deviceCode" class="col-sm-3 col-form-label">디바이스 :</label>
                                        <div class="col-sm-9">
                                            <select id="deviceCode" data-validate="null" class="form-control" value="">
                                                <option value="">- 디바이스 선택 -</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="sensorCodeDiv" class="form-group row">
                                        <label for="sensorCode" class="col-sm-3 col-form-label">센서 :</label>
                                        <div class="col-sm-9">
                                            <select id="sensorCode" data-validate="null" class="form-control" value="">
                                                <option value="">- 센서 선택 -</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </form>
                        <a id="selectSensorDetailBtn" class="btn btn-primary btn-block mb-3">상세 정보 조회</a>
                    </div>
                    <div id="sensorDetailMainDiv" class="col-9">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="filter-container">
                                    <div id="mainHeader" class="card card-primary">
                                        <div id="Main_Header_Title" class="card-header">RMS_Velocity(mm/sec)</div>
                                        <div class="banner-img min-height-300" style="padding-right: 20px; padding-top: 10px;">
                                            <div id="detailChart"></div>
                                        </div>
                                        <div id = "vDatesDiv" class="dates">
                                            <div class="start">
                                                <strong>X축 벨류</strong> <label id="xMainValue" class="font-size-45 font-weight-bold">0.000</label>
                                            </div>
                                            <div class="ends">
                                                <strong>Z축 벨류</strong> <label id="zMainValue" class="font-size-45 font-weight-bold">0.000</label>
                                            </div>
                                        </div>
                                        <div id = "vStatsDiv" class="stats">
                                            <div>
                                                <strong>X축 경고</strong> <h7 id="xMainWarning" class="font-color-warning font-weight-bold">0.123</h7>
                                            </div>
                                            <div>
                                                <strong>X축 에러</strong> <h7 id="xMainError" class="font-color-Error font-weight-bold">0.432</h7>
                                            </div>
                                            <div>
                                                <strong>Z축 경고</strong> <h7 id="zMainWarning" class="font-color-warning font-weight-bold">0.123</h7>
                                            </div>
                                            <div>
                                                <strong>Z축 에러</strong> <h7 id="zMainError" class="font-color-Error font-weight-bold">0.432</h7>
                                            </div>
                                        </div>
                                        <div id = "tDatesDiv" class="dates">
                                            <div class="start" style="width: 100%;">
                                                <strong>온도 벨류</strong> <label id="tMainValue" class="font-size-45 font-weight-bold">0.000</label>
                                            </div>
                                        </div>
                                        <div id = "tStatsDiv" class="stats">
                                            <div style="width: 50%;">
                                                <strong>온도 경고</strong> <h7 id="tMainWarning" class="font-color-warning font-weight-bold">0.123</h7>
                                            </div>
                                            <div style="width: 50%;">
                                                <strong>온도 에러</strong> <h7 id="tMainError" class="font-color-Error font-weight-bold">0.432</h7>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="filter-container">
                                    <div id="RMS_Velocity_Header" onclick="selectCardNoOnClick(0)" class="card card-primary div-cursor">
                                        <div class="card-header">RMS Velocity (mm/sec)</div>
                                        <div class="dates">
                                            <div class="start">
                                                <strong>X축 벨류</strong> <label id="X_Axis_RMS_Velocity_mm_Value" class="font-size-45 font-weight-bold">0.000</label>
                                            </div>
                                            <div class="start">
                                                <strong>Z축 벨류</strong> <label id="Z_Axis_RMS_Velocity_mm_Value" class="font-size-45 font-weight-bold">0.000</label>
                                            </div>
                                        </div>
                                        <div class="stats">
                                            <div>
                                                <strong>X축 경고</strong> <h7 id="X_Axis_RMS_Velocity_mm_Warning_Value" class="font-color-warning font-weight-bold">0.123</h7>
                                            </div>
                                            <div>
                                                <strong>X축 에러</strong> <h7 id="X_Axis_RMS_Velocity_mm_Error_Value" class="font-color-Error font-weight-bold">0.432</h7>
                                            </div>
                                            <div>
                                                <strong>Z축 경고</strong> <h7 id="Z_Axis_RMS_Velocity_mm_Warning_Value" class="font-color-warning font-weight-bold">0.123</h7>
                                            </div>
                                            <div>
                                                <strong>Z축 에러</strong> <h7 id="Z_Axis_RMS_Velocity_mm_Error_Value" class="font-color-Error font-weight-bold">0.432</h7>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="filter-container">
                                    <div id="Peak_Acceleration_Header" onclick="selectCardNoOnClick(1)" class="card card-secondary div-cursor">
                                        <div class="card-header">Peak Acceleration (G)</div>
                                        <div class="dates">
                                            <div class="start">
                                                <strong>X축 벨류</strong> <label id="X_Axis_Peak_Acceleration_Value" class="font-size-45 font-weight-bold">0.000</label>
                                            </div>
                                            <div class="start">
                                                <strong>Z축 벨류</strong> <label id="Z_Axis_Peak_Acceleration_Value" class="font-size-45 font-weight-bold">0.000</label>
                                            </div>
                                        </div>
                                        <div class="stats">
                                            <div>
                                                <strong>X축 경고</strong> <h7 id="X_Axis_Peak_Acceleration_Warning_Value" class="font-color-warning font-weight-bold">0.123</h7>
                                            </div>
                                            <div>
                                                <strong>X축 에러</strong> <h7 id="X_Axis_Peak_Acceleration_Error_Value" class="font-color-Error font-weight-bold">0.432</h7>
                                            </div>
                                            <div>
                                                <strong>Z축 경고</strong> <h7 id="Z_Axis_Peak_Acceleration_Warning_Value" class="font-color-warning font-weight-bold">0.123</h7>
                                            </div>
                                            <div>
                                                <strong>Z축 에러</strong> <h7 id="Z_Axis_Peak_Acceleration_Error_Value" class="font-color-Error font-weight-bold">0.432</h7>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="filter-container">
                                    <div id="Temperature_Header" onclick="selectCardNoOnClick(2)" class="card card-secondary div-cursor">
                                        <div class="card-header">Temperature (°C)</div>
                                        <div class="dates">
                                            <div class="start width-100p">
                                                <strong>온도 벨류</strong> <label id="Temperature_C_Value" class="font-size-45 font-weight-bold">0.000</label>
                                            </div>
                                        </div>
                                        <div class="stats">
                                            <div class="width-50p">
                                                <strong>온도 경고 </strong> <h7 id="Temperature_C_Warning_Value" class="font-color-warning font-weight-bold">0.000</h7>
                                            </div>
                                            <div class="width-50p">
                                                <strong>온도 에러</strong> <h7 id="Temperature_C_Error_Value" class="font-color-Error font-weight-bold">0.000</h7>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="filter-container">
                                    <div class="card">
                                        <div class="card-header">Peak Velocity (mm/sec)</div>
                                        <div class="dates">
                                            <div class="start">
                                                <strong>X축 벨류</strong> <label id="X_Axis_Peak_Velocity_mm_Value" class="font-size-45 font-weight-bold font-color-default">35</label>
                                            </div>
                                            <div class="start">
                                                <strong>Z축 벨류</strong> <label id="Z_Axis_Peak_Velocity_mm_Value" class="font-size-45 font-weight-bold font-color-default">55</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="filter-container">
                                    <div class="card">
                                        <div class="card-header">RMS Acceleration (G)</div>
                                        <div class="dates">
                                            <div class="start">
                                                <strong>X축 벨류</strong> <label id="X_Axis_RMS_Acceleration_Value" class="font-size-45 font-weight-bold font-color-default">0.000</label>
                                            </div>
                                            <div class="start">
                                                <strong>Z축 벨류</strong> <label id="Z_Axis_RMS_Acceleration_Value" class="font-size-45 font-weight-bold font-color-default">0.000</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="filter-container">
                                    <div class="card">
                                        <div class="card-header">Crest Facto</div>
                                        <div class="dates">
                                            <div class="start">
                                                <strong>X축 벨류</strong> <label id="X_Axis_Crest_Factor_Value" class="font-size-45 font-weight-bold font-color-default">0.000</label>
                                            </div>
                                            <div class="start">
                                                <strong>Z축 벨류</strong> <label id="Z_Axis_Crest_Factor_Value" class="font-size-45 font-weight-bold font-color-default">0.000</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="filter-container">
                                    <div class="card">
                                        <div class="card-header">High-Frequency RMS Acceleration (G)</div>
                                        <div class="dates">
                                            <div class="start">
                                                <strong>X축 벨류</strong> <label id="X_Axis_High_Frequency_RMS_Acceleration_Value" class="font-size-45 font-weight-bold font-color-default">0.000</label>
                                            </div>
                                            <div class="start">
                                                <strong>Z축 벨류</strong> <label id="Z_Axis_High_Frequency_RMS_Acceleration_Value" class="font-size-45 font-weight-bold font-color-default">0.000</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="filter-container">
                                    <div class="card">
                                        <div class="card-header">Peak Velocity Component Frequency (Hz)</div>
                                        <div class="dates">
                                            <div class="start">
                                                <strong>X축 벨류</strong> <label id="X_Axis_Peak_Velocity_Component_Frequency_Value" class="font-size-45 font-weight-bold font-color-default">0.000</label>
                                            </div>
                                            <div class="start">
                                                <strong>Z축 벨류</strong> <label id="Z_Axis_Peak_Velocity_Component_Frequency_Value" class="font-size-45 font-weight-bold font-color-default">0.000</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="filter-container">
                                    <div class="card">
                                        <div class="card-header">Kurtosis</div>
                                        <div class="dates">
                                            <div class="start">
                                                <strong>X축 벨류</strong> <label id="X_Axis_Kurtosis_Value" class="font-size-45 font-weight-bold font-color-default">0.000</label>
                                            </div>
                                            <div class="start">
                                                <strong>Z축 벨류</strong> <label id="Z_Axis_Kurtosis_Value" class="font-size-45 font-weight-bold font-color-default">0.000</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <%@ include file="/WEB-INF/views/core/main/include/mainBottomPage.jsp" %>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
</body>

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/jquery/jquery.js"></script>
<!-- bootstrap -->
<script src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- jquery-confirm -->
<script src="<%=request.getContextPath()%>/resources/plugins/jquery-confirm/dist/js/jquery-confirm.js"></script>
<!-- 경고 팝업 -->
<script src="<%=request.getContextPath()%>/resources/plugins/toastr-master/dist/js/toastr.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/alarm/alarmPopUp.js"></script>
<!-- 로딩 이미지 -->
<script src="<%=request.getContextPath()%>/resources/plugins/loading-master/dist/js/easy-loading.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/loading/loading.js"></script>
<!-- Ekko Lightbox -->
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/ekko-lightbox/ekko-lightbox.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/dist/js/demo.js"></script>
<!-- DataTables  & Plugins -->
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/jszip/jszip.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/pdfmake/pdfmake.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/pdfmake/vfs_fonts.js"></script>
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- 등록 정규식 -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/validate/userManagementValidate.js"></script>
<!-- Key Event 컨트롤 -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/keyEvent/mainBodyKeyEvent.js"></script>
<!-- c3 -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/c3/c3.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/c3/d3-5.8.2.min.js"></script>
<!-- Page specific script -->

<!-- Simon -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/include/include.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/dataTable/dataTable.js"></script>
<!-- Form 컨트롤 -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/form/formReset.js"></script>

<script>
    let sensorChart = null;
    let repitStatus = true;
    let autoSearchStatus = true;

    let mainTimer = null;

    let selectCardNo = 0;

    let lastXRMSVelocity = 0;
    let lastXRMSVelocityWarning = 0;
    let lastXRMSVelocityAlarm = 0;
    let lastXRMSVelocityStatus = 0;
    let lastZRMSVelocity = 0;
    let lastZRMSVelocityWarning = 0;
    let lastZRMSVelocityAlarm = 0;
    let lastZRMSVelocityStatus = 0;
    let lastXPeakAcceleration = 0;
    let lastXPeakAccelerationWarning = 0;
    let lastXPeakAccelerationAlarm = 0;
    let lastXPeakAccelerationStatus = 0;
    let lastZPeakAcceleration = 0;
    let lastZPeakAccelerationWarning = 0;
    let lastZPeakAccelerationAlarm = 0;
    let lastZPeakAccelerationStatus = 0;
    let lastTemperatureC = 0;
    let lastTemperatureCWarning = 0;
    let lastTemperatureCAlarm = 0;
    let lastTemperatureCStatus = 0;

    let lastOTimeArr = null;
    let lastXRMSVelocityArr = null;
    let lastZRMSVelocityArr = null;
    let lastXPeakAccelerationArr = null;
    let lastZPeakAccelerationArr = null;
    let lastTemperatureCArr = null;

    $(function () {
        $(document).ready(function () {
            commonIncludeLeftMenuImageChange("Parents", "detailPage");

            $.fn.selectBoxVisibleCheck($('#deviceCodeDiv'), false);
            $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);

            $.fn.divVisibleCheck($('#sensorDetailMainDiv'), false);

            $.fn.divVisibleCheck($('#tDatesDiv'), false);
            $.fn.divVisibleCheck($('#tStatsDiv'), false);

            selectLocationMasterList();
        });
    });

    function selectLocationMasterList() {
        const action = "<%=request.getContextPath()%>/core/main/selectLocationMasterList";

        const locationCode = $("#resLocationCode").val();

        const form_data = {
            locationCode: locationCode
        };

        $.ajax({
            type: "POST",
            url: action,
            data: form_data,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (resultData) {
                if(resultData != null) {
                    const locationMasterList = JSON.parse(resultData.locationMasterList);

                    $.fn.selectBoxReset($('#locationCode'));

                    if(locationMasterList.length > 0) {
                        for (let i = 0; i < locationMasterList.length; i++) {
                            const code = locationMasterList[i].locationCode;
                            const name = locationMasterList[i].locationName;

                            if (i == 0) {
                                $.fn.selectBoxAddOption($('#locationCode'), "", "- 로케이션 선택 -");
                            }

                            $.fn.selectBoxAddOption($('#locationCode'), code, name);
                        }
                    }
                }
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "로케이션 목록 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
                const resLocationCode = $("#resLocationCode").val();

                if(resLocationCode != "") {
                    $("#locationCode").val(resLocationCode);

                    $.fn.selectBoxReset($('#deviceCode'));
                    $.fn.selectBoxVisibleCheck($('#deviceCodeDiv'), false);

                    $.fn.selectBoxReset($('#sensorCode'));
                    $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);

                    $.fn.divVisibleCheck($('#sensorDetailMainDiv'), false);

                    selectDeviceMasterList();
                }
            }
        });
    }

    $('#locationCode').on('change', function() {
        repitStatus = false;

        clearTimeout(mainTimer);

        $('#resSensorCode').val("");
        $('#resDeviceCode').val("");
        $('#resLocationCode').val("");

        $.fn.selectBoxReset($('#sensorCode'));
        $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);

        $.fn.selectBoxReset($('#deviceCode'));
        $.fn.selectBoxVisibleCheck($('#deviceCodeDiv'), false);

        $.fn.divVisibleCheck($('#sensorDetailMainDiv'), false);

        if(this.value != "") {
            $("#resLocationCode").val(this.value);

            selectDeviceMasterList();
        }
    });

    function selectDeviceMasterList() {
        const action = "<%=request.getContextPath()%>/core/main/selectDeviceMasterList";

        const form_data = {
            locationCode: $("#locationCode").val()
        };

        $.ajax({
            type: "POST",
            url: action,
            data: form_data,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (resultData) {
                if(resultData != null) {
                    const deviceMasterList = JSON.parse(resultData.deviceMasterList);

                    $.fn.selectBoxReset($('#deviceCode'));

                    if(deviceMasterList.length > 0) {
                        $.fn.selectBoxVisibleCheck($('#deviceCodeDiv'), true);

                        for(let i = 0; i < deviceMasterList.length; i++) {
                            const code = deviceMasterList[i].deviceCode;
                            const name = deviceMasterList[i].deviceName;

                            if(i == 0) {
                                $.fn.selectBoxAddOption($('#deviceCode'), "", "- 디바이스 선택 -");
                            }

                            $.fn.selectBoxAddOption($('#deviceCode'), code, name);
                        }
                    } else {
                        $.fn.selectBoxVisibleCheck($('#deviceCodeDiv'), false);
                    }
                }
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "디바이스 목록 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
                const resDeviceCode = $("#resDeviceCode").val();

                if(resDeviceCode != "") {
                    $("#deviceCode").val(resDeviceCode);

                    $.fn.selectBoxReset($('#sensorCode'));
                    $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);

                    $.fn.divVisibleCheck($('#sensorDetailMainDiv'), false);

                    selectSensorMasterList();
                }
            }
        });
    }

    $('#deviceCode').on('change', function() {
        repitStatus = false;

        clearTimeout(mainTimer);

        $('#resSensorCode').val("");
        $('#resDeviceCode').val("");
        $('#resLocationCode').val("");

        $.fn.selectBoxReset($('#sensorCode'));
        $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);

        $.fn.divVisibleCheck($('#sensorDetailMainDiv'), false);

        if(this.value != "") {
            $("#resDeviceCode").val(this.value);

            selectSensorMasterList();
        }
    });

    function selectSensorMasterList() {
        const action = "<%=request.getContextPath()%>/core/main/selectSensorMasterList";

        const deviceCode = $("#deviceCode").val();
        const sensorCode = $("#sensorCode").val();

        const form_data = {
            deviceCode: deviceCode,
            sensorCode: sensorCode
        };

        $.ajax({
            type: "POST",
            url: action,
            data: form_data,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (resultData) {
                if(resultData != null) {
                    const sensorMasterList = JSON.parse(resultData.sensorMasterList);

                    $.fn.selectBoxReset($('#sensorCode'));

                    if(sensorMasterList.length > 0) {
                        $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), true);

                        for(let i = 0; i < sensorMasterList.length; i++) {
                            const code = sensorMasterList[i].sensorCode;
                            const name = sensorMasterList[i].sensorName;

                            if(i == 0) {
                                $.fn.selectBoxAddOption($('#sensorCode'), "", "- 센서 선택 -");
                            }

                            $.fn.selectBoxAddOption($('#sensorCode'), code, name);
                        }
                    } else {
                        $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);
                    }
                }
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "센서 목록 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
                if(repitStatus) {
                    autoSearchStatus = false;

                    const resSensorCode = $("#resSensorCode").val();

                    if(resSensorCode != "") {
                        $("#sensorCode").val(resSensorCode);

                        $.fn.divVisibleCheck($('#sensorDetailMainDiv'), true);

                        drawDetailChartData();
                    }
                }
            }
        });
    }

    $('#sensorCode').on('change', function() {
        repitStatus = false;

        $('#resSensorCode').val("");
        $('#resDeviceCode').val("");
        $('#resLocationCode').val("");

        clearTimeout(mainTimer);

        if(this.value != "") {
            repitStatus = true;

            if(!autoSearchStatus) {
                $.fn.divVisibleCheck($('#sensorDetailMainDiv'), false);
            }
        } else {
            $.fn.divVisibleCheck($('#sensorDetailMainDiv'), false);
        }
    });

    $("#selectSensorDetailBtn").click(function () {
        if(!$.fn.validate($("#selectSensorDetailForm"))) {
            return false;
        }

        $.fn.divVisibleCheck($('#sensorDetailMainDiv'), true);

        drawDetailChartData();
    });

    function drawDetailChartData() {
        sensorChart = null;

        sensorChart = c3.generate({
            bindto: '#detailChart',
            size: {
                height: 300
            },
            data: {
                x: 'OTIME',
                columns: [],
                length: 3
            },
            point: {
                show: true,
                r: 1
            },
            axis: {
                x: {
                    type: 'timeseries',
                    tick: {
                        count: 20,
                        format: '%H:%M:%S'
                    }
                },
                y: {
                    tick: {
                        count: 10,
                        format: d3.format(".3f")
                    }
                }
            },
            color: {
                pattern: ['#6610f2', '#f012be']
            },
            grid: {
                y: {
                    lines: [
                        {value: 100, text: 'X축 경고', position: 'middle', class: 'warning'},
                        {value: 200, text: 'Z축 경고', position: 'middle', class: 'error'},
                        {value: 300, text: 'X축 에러', position: 'middle', class: 'warning'},
                        {value: 400, text: 'Z축 에러', position: 'middle', class: 'error'}
                    ]
                }
            },
            zoom: {
                enabled: true
            }
        });

        selectVibrationSensorLowDataLastCountList("D");
    }

    function selectVibrationSensorLowDataLastCountList(chartType) {
        const action = "<%=request.getContextPath()%>/core/main/dashboard/selectVibrationSensorLowDataLastCountList";

        const locationCode = $("#locationCode").val();
        const deviceCode = $("#deviceCode").val();
        const sensorCode = $("#sensorCode").val();

        const form_data = {
            chartType: chartType,
            locationCode: locationCode,
            deviceCode: deviceCode,
            sensorCode: sensorCode
        };

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
                    const realTimeVibrationSensorChartDataVOList = JSON.parse(resultData.realTimeVibrationSensorChartDataVOList);
                    const threadDelay = resultData.threadDelay;

                    drawTagLowDataLastCountListChart(realTimeVibrationSensorChartDataVOList, threadDelay);
                }
            },
            error: function (jqXHR, resultData) {
            },
            complete: function () {
            }
        });
    }

    function selectCardNoOnClick(cardNo) {
        const chartListChartObject = sensorChart;

        chartListChartObject.destroy();

        selectCardNo = cardNo;

        clearTimeout(mainTimer);

        $("#RMS_Velocity_Header").removeClass('card card-primary');
        $("#Peak_Acceleration_Header").removeClass('card card-primary');
        $("#Temperature_Header").removeClass('card card-primary');

        $("#RMS_Velocity_Header").removeClass('card card-secondary');
        $("#Peak_Acceleration_Header").removeClass('card card-secondary');
        $("#Temperature_Header").removeClass('card card-secondary');

        if(selectCardNo == 0) {
            $.fn.divVisibleCheck($('#tDatesDiv'), false);
            $.fn.divVisibleCheck($('#tStatsDiv'), false);

            $.fn.divVisibleCheck($('#vDatesDiv'), true);
            $.fn.divVisibleCheck($('#vStatsDiv'), true);

            $("#RMS_Velocity_Header").addClass('card card-primary');
            $("#Peak_Acceleration_Header").addClass('card card-secondary');
            $("#Temperature_Header").addClass('card card-secondary');

            $("#Main_Header_Title").text("RMS Velocity (mm/sec)");

            $("#xMainValue").text(lastXRMSVelocity);
            $("#xMainWarning").text(lastXRMSVelocityWarning);
            $("#xMainError").text(lastXRMSVelocityAlarm);

            $("#zMainValue").text(lastZRMSVelocity);
            $("#zMainWarning").text(lastZRMSVelocityWarning);
            $("#zMainError").text(lastZRMSVelocityAlarm);

        } else if (selectCardNo == 1) {
            $.fn.divVisibleCheck($('#tDatesDiv'), false);
            $.fn.divVisibleCheck($('#tStatsDiv'), false);

            $.fn.divVisibleCheck($('#vDatesDiv'), true);
            $.fn.divVisibleCheck($('#vStatsDiv'), true);

            $("#RMS_Velocity_Header").addClass('card card-secondary');
            $("#Peak_Acceleration_Header").addClass('card card card-primary');
            $("#Temperature_Header").addClass('card card-secondary');

            $("#Main_Header_Title").text("Peak Acceleration (G)");

            $("#xMainValue").text(lastXPeakAcceleration);
            $("#xMainWarning").text(lastXPeakAccelerationWarning);
            $("#xMainError").text(lastXPeakAccelerationAlarm);

            $("#zMainValue").text(lastZPeakAcceleration);
            $("#zMainWarning").text(lastZPeakAccelerationWarning);
            $("#zMainError").text(lastZPeakAccelerationAlarm);

        } else if (selectCardNo == 2) {
            $.fn.divVisibleCheck($('#vDatesDiv'), false);
            $.fn.divVisibleCheck($('#vStatsDiv'), false);

            $.fn.divVisibleCheck($('#tDatesDiv'), true);
            $.fn.divVisibleCheck($('#tStatsDiv'), true);

            $("#RMS_Velocity_Header").addClass('card card-secondary');
            $("#Peak_Acceleration_Header").addClass('card card-secondary');
            $("#Temperature_Header").addClass('card card-primary');

            $("#Main_Header_Title").text("Temperature (°C)");

            $("#tMainValue").text(lastTemperatureC);
            $("#tMainWarning").text(lastTemperatureCWarning);
            $("#tMainError").text(lastTemperatureCAlarm);
        }

        drawDetailChartData();
    }

    function drawTagLowDataLastCountListChart(realTimeVibrationSensorChartDataVOList, threadDelay) {
        let delay = 2000;

        for(let i = 0; i < realTimeVibrationSensorChartDataVOList.length; i++) {
            let oTimeArr = [];
            let xRMSVelocityArr = [];
            let zRMSVelocityArr = [];
            let xPeakAccelerationArr = [];
            let zPeakAccelerationArr = [];
            let temperatureCArr = [];
            let xPeakVelocityArr = [];
            let zPeakVelocityArr = [];
            let xRMSAccelerationArr = [];
            let zRMSAccelerationArr = [];
            let xCrestFactorArr = [];
            let zCrestFactorArr = [];
            let zHighFrequencyRmsAccelerationArr = [];
            let xHighFrequencyRmsAccelerationArr = [];
            let xPeakVelocityComponentFrequencyArr = [];
            let zPeakVelocityComponentFrequencyArr = [];
            let xKurtosisArr = [];
            let zKurtosisArr = [];

            const chartListChartObject = sensorChart;

            let dataCols = [];

            const dbOTimeArr = realTimeVibrationSensorChartDataVOList[i].oTimeArr;

            for(let j = 0; j < dbOTimeArr.length; j++) {
                if(j == 0) {
                    oTimeArr.push("OTIME");
                }

                oTimeArr.push(new Date(dbOTimeArr[j]));
            }

            xRMSVelocityArr = realTimeVibrationSensorChartDataVOList[i].xRMSVelocityArr;
            zRMSVelocityArr = realTimeVibrationSensorChartDataVOList[i].zRMSVelocityArr;
            xPeakAccelerationArr = realTimeVibrationSensorChartDataVOList[i].xPeakAccelerationArr;
            zPeakAccelerationArr = realTimeVibrationSensorChartDataVOList[i].zPeakAccelerationArr;
            temperatureCArr = realTimeVibrationSensorChartDataVOList[i].temperatureCArr;

            xPeakVelocityArr = realTimeVibrationSensorChartDataVOList[i].xPeakVelocityArr;
            zPeakVelocityArr = realTimeVibrationSensorChartDataVOList[i].zPeakVelocityArr;
            xRMSAccelerationArr = realTimeVibrationSensorChartDataVOList[i].xRMSAccelerationArr;
            zRMSAccelerationArr = realTimeVibrationSensorChartDataVOList[i].zRMSAccelerationArr;
            xCrestFactorArr = realTimeVibrationSensorChartDataVOList[i].xCrestFactorArr;
            zCrestFactorArr = realTimeVibrationSensorChartDataVOList[i].zCrestFactorArr;
            zHighFrequencyRmsAccelerationArr = realTimeVibrationSensorChartDataVOList[i].zHighFrequencyRmsAccelerationArr;
            xHighFrequencyRmsAccelerationArr = realTimeVibrationSensorChartDataVOList[i].xHighFrequencyRmsAccelerationArr;
            xPeakVelocityComponentFrequencyArr = realTimeVibrationSensorChartDataVOList[i].xPeakVelocityComponentFrequencyArr;
            zPeakVelocityComponentFrequencyArr = realTimeVibrationSensorChartDataVOList[i].zPeakVelocityComponentFrequencyArr;
            xKurtosisArr = realTimeVibrationSensorChartDataVOList[i].xKurtosisArr;
            zKurtosisArr = realTimeVibrationSensorChartDataVOList[i].zKurtosisArr;

            const xRMSVelocity = realTimeVibrationSensorChartDataVOList[i].x_axis_rms_velocity_mm_value;
            const xRMSVelocityWarning = realTimeVibrationSensorChartDataVOList[i].x_axis_rms_velocity_mm_warning;
            const xRMSVelocityAlarm = realTimeVibrationSensorChartDataVOList[i].x_axis_rms_velocity_mm_alarm;
            const xRMSVelocityStatus = realTimeVibrationSensorChartDataVOList[i].x_axis_rms_velocity_mm_status;

            const zRMSVelocity = realTimeVibrationSensorChartDataVOList[i].z_axis_rms_velocity_mm_value;
            const zRMSVelocityWarning = realTimeVibrationSensorChartDataVOList[i].z_axis_rms_velocity_mm_warning;
            const zRMSVelocityAlarm = realTimeVibrationSensorChartDataVOList[i].z_axis_rms_velocity_mm_alarm;
            const zRMSVelocityStatus = realTimeVibrationSensorChartDataVOList[i].z_axis_rms_velocity_mm_status;

            const xPeakAcceleration = realTimeVibrationSensorChartDataVOList[i].x_axis_peak_acceleration_value;
            const xPeakAccelerationWarning = realTimeVibrationSensorChartDataVOList[i].x_axis_peak_acceleration_warning;
            const xPeakAccelerationAlarm = realTimeVibrationSensorChartDataVOList[i].x_axis_peak_acceleration_alarm;
            const xPeakAccelerationStatus = realTimeVibrationSensorChartDataVOList[i].x_axis_peak_acceleration_status;

            const zPeakAcceleration = realTimeVibrationSensorChartDataVOList[i].z_axis_peak_acceleration_value;
            const zPeakAccelerationWarning = realTimeVibrationSensorChartDataVOList[i].z_axis_peak_acceleration_warning;
            const zPeakAccelerationAlarm = realTimeVibrationSensorChartDataVOList[i].z_axis_peak_acceleration_alarm;
            const zPeakAccelerationStatus = realTimeVibrationSensorChartDataVOList[i].z_axis_peak_acceleration_status;

            const temperatureC = realTimeVibrationSensorChartDataVOList[i].temperature_c_value;
            const temperatureCWarning = realTimeVibrationSensorChartDataVOList[i].temperature_c_warning;
            const temperatureCAlarm = realTimeVibrationSensorChartDataVOList[i].temperature_c_alarm;
            const temperatureCStatus = realTimeVibrationSensorChartDataVOList[i].temperature_c_status;


            dataCols.push(oTimeArr);

            lastOTimeArr = oTimeArr;
            lastXRMSVelocityArr = xRMSVelocityArr;
            lastZRMSVelocityArr = zRMSVelocityArr;
            lastXPeakAccelerationArr = xPeakAccelerationArr;
            lastZPeakAccelerationArr = zPeakAccelerationArr;
            lastTemperatureCArr = temperatureCArr;


            if (selectCardNo == 0) {
                dataCols.push(xRMSVelocityArr);
                dataCols.push(zRMSVelocityArr);

                sensorChart.ygrids.add([
                    {value: xRMSVelocityWarning, text: 'X RMS Velocity 경고', position: 'start', class: 'warning'},
                    {value: zRMSVelocityWarning, text: 'Z RMS Velocity 경고', position: 'end', class: 'warning'},
                    {value: xRMSVelocityAlarm, text: 'X RMS Velocity 알람', position: 'start', class: 'error'},
                    {value: zRMSVelocityAlarm, text: 'Z RMS Velocity 알람', position: 'end', class: 'error'}
                ]);
            } else if (selectCardNo == 1) {
                dataCols.push(xPeakAccelerationArr);
                dataCols.push(zPeakAccelerationArr);

                sensorChart.ygrids.add([
                    {value: xPeakAccelerationWarning, text: 'X Peak Acceleration 경고', position: 'start', class: 'warning'},
                    {value: zPeakAccelerationWarning, text: 'Z Peak Acceleration 경고', position: 'end', class: 'warning'},
                    {value: xPeakAccelerationAlarm, text: 'X Peak Acceleration 알람', position: 'start', class: 'error'},
                    {value: zPeakAccelerationAlarm, text: 'Z Peak Acceleration 알람', position: 'end', class: 'error'}
                ]);
            } else if (selectCardNo == 2) {
                dataCols.push(temperatureCArr);

                sensorChart.ygrids.add([
                    {value: temperatureCWarning, text: '온도 경고', position: 'middle', class: 'warning'},
                    {value: temperatureCAlarm, text: '온도 알람', position: 'middle', class: 'error'}
                ]);
            }

            let chartListRedrawArgs = {};

            chartListRedrawArgs.columns = dataCols;

            chartListChartObject.load(chartListRedrawArgs);

            const xPeakVelocity = xPeakVelocityArr.pop();
            const zPeakVelocity = zPeakVelocityArr.pop();
            const xRMSAcceleration = xRMSAccelerationArr.pop();
            const zRMSAcceleration = zRMSAccelerationArr.pop();
            const xCrestFactor = xCrestFactorArr.pop();
            const zCrestFactor = zCrestFactorArr.pop();
            const zHighFrequencyRmsAcceleration = zHighFrequencyRmsAccelerationArr.pop();
            const xHighFrequencyRmsAcceleration = xHighFrequencyRmsAccelerationArr.pop();
            const xPeakVelocityComponentFrequency = xPeakVelocityComponentFrequencyArr.pop();
            const zPeakVelocityComponentFrequency = zPeakVelocityComponentFrequencyArr.pop();
            const xKurtosis = xKurtosisArr.pop();
            const zKurtosis = zKurtosisArr.pop();


            lastXRMSVelocity = xRMSVelocity;
            lastXRMSVelocityWarning = xRMSVelocityWarning;
            lastXRMSVelocityAlarm = xRMSVelocityAlarm;
            lastXRMSVelocityStatus = xRMSVelocityStatus;

            lastZRMSVelocity = zRMSVelocity;
            lastZRMSVelocityWarning = zRMSVelocityWarning;
            lastZRMSVelocityAlarm = zRMSVelocityAlarm;
            lastZRMSVelocityStatus = zRMSVelocityStatus;

            lastXPeakAcceleration = xPeakAcceleration;
            lastXPeakAccelerationWarning = xPeakAccelerationWarning;
            lastXPeakAccelerationAlarm = xPeakAccelerationAlarm;
            lastXPeakAccelerationStatus = xPeakAccelerationStatus;

            lastZPeakAcceleration = zPeakAcceleration;
            lastZPeakAccelerationWarning = zPeakAccelerationWarning;
            lastZPeakAccelerationAlarm = zPeakAccelerationAlarm;
            lastZPeakAccelerationStatus = zPeakAccelerationStatus;

            lastTemperatureC = temperatureC;
            lastTemperatureCWarning = temperatureCWarning;
            lastTemperatureCAlarm = temperatureCAlarm;
            lastTemperatureCStatus = temperatureCStatus;

            let headerAlarmStatus = 0;

            if (selectCardNo == 0) {
                $("#xMainValue").text(lastXRMSVelocity);
                $("#xMainWarning").text(lastXRMSVelocityWarning);
                $("#xMainError").text(lastXRMSVelocityAlarm);

                if(lastXRMSVelocityStatus == 1) {
                    if($("#xMainValue").hasClass("font-color-Error") === true) {
                        $("#xMainValue").removeClass('font-color-Error');
                    }

                    $("#xMainValue").addClass('font-color-warning');

                    headerAlarmStatus = 1;
                } else if(lastXRMSVelocityStatus == 2) {
                    $("#xMainValue").addClass('font-color-Error');

                    headerAlarmStatus = 2;
                } else {
                    if($("#xMainValue").hasClass("font-color-warning") === true) {
                        $("#xMainValue").removeClass('font-color-warning');
                    }

                    if($("#xMainValue").hasClass("font-color-Error") === true) {
                        $("#xMainValue").removeClass('font-color-Error');
                    }
                }

                $("#zMainValue").text(lastZRMSVelocity);
                $("#zMainWarning").text(lastZRMSVelocityWarning);
                $("#zMainError").text(lastZRMSVelocityAlarm);

                if(lastZRMSVelocityStatus == 1) {
                    if($("#zMainValue").hasClass("font-color-Error") === true) {
                        $("#zMainValue").removeClass('font-color-Error');
                    }

                    $("#zMainValue").addClass('font-color-warning');

                    headerAlarmStatus = 1;
                } else if(lastZRMSVelocityStatus == 2) {
                    $("#zMainValue").addClass('font-color-Error');

                    headerAlarmStatus = 2;
                } else {
                    if($("#zMainValue").hasClass("font-color-warning") === true) {
                        $("#zMainValue").removeClass('font-color-warning');
                    }

                    if($("#zMainValue").hasClass("font-color-Error") === true) {
                        $("#zMainValue").removeClass('font-color-Error');
                    }
                }
            } else if(selectCardNo == 1) {
                $("#xMainValue").text(lastXPeakAcceleration);
                $("#xMainWarning").text(lastXPeakAccelerationWarning);
                $("#xMainError").text(lastXPeakAccelerationAlarm);

                if(lastXPeakAccelerationStatus == 1) {
                    if($("#xMainValue").hasClass("font-color-Error") === true) {
                        $("#xMainValue").removeClass('font-color-Error');
                    }

                    $("#xMainValue").addClass('font-color-warning');

                    headerAlarmStatus = 1;
                } else if(lastXPeakAccelerationStatus == 2) {
                    $("#xMainValue").addClass('font-color-Error');

                    headerAlarmStatus = 2;
                } else {
                    if($("#xMainValue").hasClass("font-color-warning") === true) {
                        $("#xMainValue").removeClass('font-color-warning');
                    }
                }

                $("#zMainValue").text(lastZPeakAcceleration);
                $("#zMainWarning").text(lastZPeakAccelerationWarning);
                $("#zMainError").text(lastZPeakAccelerationAlarm);

                if(lastZPeakAccelerationStatus == 1) {
                    if($("#zMainValue").hasClass("font-color-Error") === true) {
                        $("#zMainValue").removeClass('font-color-Error');
                    }

                    $("#zMainValue").addClass('font-color-warning');

                    headerAlarmStatus = 1;
                } else if(lastZPeakAccelerationStatus == 2) {
                    $("#zMainValue").addClass('font-color-Error');

                    headerAlarmStatus = 2;
                } else {
                    if($("#zMainValue").hasClass("font-color-warning") === true) {
                        $("#zMainValue").removeClass('font-color-warning');
                    }

                    if($("#zMainValue").hasClass("font-color-Error") === true) {
                        $("#zMainValue").removeClass('font-color-Error');
                    }
                }
            } else if(selectCardNo == 2) {
                $("#tMainValue").text(lastTemperatureC);
                $("#tMainWarning").text(lastTemperatureCWarning);
                $("#tMainError").text(lastTemperatureCAlarm);

                if(lastTemperatureCStatus == 1) {
                    if($("#tMainValue").hasClass("font-color-Error") === true) {
                        $("#tMainValue").removeClass('font-color-Error');
                    }

                    $("#tMainValue").addClass('font-color-warning');

                    headerAlarmStatus = 1;
                } else if(lastTemperatureCStatus == 2) {
                    $("#tMainValue").addClass('font-color-Error');

                    headerAlarmStatus = 2;
                } else {
                    if($("#tMainValue").hasClass("font-color-warning") === true) {
                        $("#tMainValue").removeClass('font-color-warning');
                    }

                    if($("#tMainValue").hasClass("font-color-Error") === true) {
                        $("#tMainValue").removeClass('font-color-Error');
                    }
                }
            }

            if(headerAlarmStatus == 0) {
                $("#mainHeader").removeClass('card-warning');
                $("#mainHeader").removeClass('card-danger');
            } else if (headerAlarmStatus == 1) {
                $("#mainHeader").removeClass('card-danger');
                $("#mainHeader").addClass('card-warning');
            } else if (headerAlarmStatus == 2) {
                $("#mainHeader").addClass('card-danger');
            }


            $("#X_Axis_RMS_Velocity_mm_Value").text(lastXRMSVelocity);
            $("#X_Axis_RMS_Velocity_mm_Warning_Value").text(lastXRMSVelocityWarning);
            $("#X_Axis_RMS_Velocity_mm_Error_Value").text(lastXRMSVelocityAlarm);

            if(lastXRMSVelocityStatus == 1) {
                if($("#X_Axis_RMS_Velocity_mm_Value").hasClass("font-color-Error") === true) {
                    $("#X_Axis_RMS_Velocity_mm_Value").removeClass('font-color-Error');
                }

                $("#X_Axis_RMS_Velocity_mm_Value").addClass('font-color-warning');
            } else if(lastXRMSVelocityStatus == 2) {
                $("#X_Axis_RMS_Velocity_mm_Value").addClass('font-color-Error');
            } else {
                if($("#X_Axis_RMS_Velocity_mm_Value").hasClass("font-color-warning") === true) {
                    $("#X_Axis_RMS_Velocity_mm_Value").removeClass('font-color-warning');
                }

                if($("#X_Axis_RMS_Velocity_mm_Value").hasClass("font-color-Error") === true) {
                    $("#X_Axis_RMS_Velocity_mm_Value").removeClass('font-color-Error');
                }
            }

            $("#Z_Axis_RMS_Velocity_mm_Value").text(lastZRMSVelocity);
            $("#Z_Axis_RMS_Velocity_mm_Warning_Value").text(lastZRMSVelocityWarning);
            $("#Z_Axis_RMS_Velocity_mm_Error_Value").text(lastZRMSVelocityAlarm);

            if(lastZRMSVelocityStatus == 1) {
                if($("#Z_Axis_RMS_Velocity_mm_Value").hasClass("font-color-Error") === true) {
                    $("#Z_Axis_RMS_Velocity_mm_Value").removeClass('font-color-Error');
                }

                $("#Z_Axis_RMS_Velocity_mm_Value").addClass('font-color-warning');
            } else if(lastZRMSVelocityStatus == 2) {
                $("#Z_Axis_RMS_Velocity_mm_Value").addClass('font-color-Error');
            } else {
                if($("#Z_Axis_RMS_Velocity_mm_Value").hasClass("font-color-warning") === true) {
                    $("#Z_Axis_RMS_Velocity_mm_Value").removeClass('font-color-warning');
                }

                if($("#Z_Axis_RMS_Velocity_mm_Value").hasClass("font-color-Error") === true) {
                    $("#Z_Axis_RMS_Velocity_mm_Value").removeClass('font-color-Error');
                }
            }

            $("#X_Axis_Peak_Acceleration_Value").text(lastXPeakAcceleration);
            $("#X_Axis_Peak_Acceleration_Warning_Value").text(lastXPeakAccelerationWarning);
            $("#X_Axis_Peak_Acceleration_Error_Value").text(lastXPeakAccelerationAlarm);

            if(lastXPeakAccelerationStatus == 1) {
                if($("#X_Axis_Peak_Acceleration_Value").hasClass("font-color-Error") === true) {
                    $("#X_Axis_Peak_Acceleration_Value").removeClass('font-color-Error');
                }

                $("#X_Axis_Peak_Acceleration_Value").addClass('font-color-warning');
            } else if(lastXPeakAccelerationStatus == 2) {
                $("#X_Axis_Peak_Acceleration_Value").addClass('font-color-Error');
            } else {
                if($("#X_Axis_Peak_Acceleration_Value").hasClass("font-color-warning") === true) {
                    $("#X_Axis_Peak_Acceleration_Value").removeClass('font-color-warning');
                }

                if($("#X_Axis_Peak_Acceleration_Value").hasClass("font-color-Error") === true) {
                    $("#X_Axis_Peak_Acceleration_Value").removeClass('font-color-Error');
                }
            }

            $("#Z_Axis_Peak_Acceleration_Value").text(lastZPeakAcceleration);
            $("#Z_Axis_Peak_Acceleration_Warning_Value").text(lastZPeakAccelerationWarning);
            $("#Z_Axis_Peak_Acceleration_Error_Value").text(lastZPeakAccelerationAlarm);

            if(lastZPeakAccelerationStatus == 1) {
                if($("#Z_Axis_Peak_Acceleration_Value").hasClass("font-color-Error") === true) {
                    $("#Z_Axis_Peak_Acceleration_Value").removeClass('font-color-Error');
                }

                $("#Z_Axis_Peak_Acceleration_Value").addClass('font-color-warning');
            } else if(lastZPeakAccelerationStatus == 2) {
                $("#Z_Axis_Peak_Acceleration_Value").addClass('font-color-Error');
            } else {
                if($("#Z_Axis_Peak_Acceleration_Value").hasClass("font-color-warning") === true) {
                    $("#Z_Axis_Peak_Acceleration_Value").removeClass('font-color-warning');
                }

                if($("#Z_Axis_Peak_Acceleration_Value").hasClass("font-color-Error") === true) {
                    $("#Z_Axis_Peak_Acceleration_Value").removeClass('font-color-Error');
                }
            }

            $("#Temperature_C_Value").text(lastTemperatureC);
            $("#Temperature_C_Warning_Value").text(lastTemperatureCWarning);
            $("#Temperature_C_Error_Value").text(lastTemperatureCAlarm);

            if(lastTemperatureCStatus == 1) {
                if($("#Temperature_C_Value").hasClass("font-color-Error") === true) {
                    $("#Temperature_C_Value").removeClass('font-color-Error');
                }

                $("#Temperature_C_Value").addClass('font-color-warning');
            } else if(lastTemperatureCStatus == 2) {
                $("#Temperature_C_Value").addClass('font-color-Error');
            } else {
                if($("#Temperature_C_Value").hasClass("font-color-warning") === true) {
                    $("#Temperature_C_Value").removeClass('font-color-warning');
                }

                if($("#Temperature_C_Value").hasClass("font-color-Error") === true) {
                    $("#Temperature_C_Value").removeClass('font-color-Error');
                }
            }

            $("#X_Axis_Peak_Velocity_mm_Value").text(xPeakVelocity);
            $("#Z_Axis_Peak_Velocity_mm_Value").text(zPeakVelocity);
            $("#X_Axis_RMS_Acceleration_Value").text(xRMSAcceleration);
            $("#Z_Axis_RMS_Acceleration_Value").text(zRMSAcceleration);
            $("#X_Axis_Crest_Factor_Value").text(xCrestFactor);
            $("#Z_Axis_Crest_Factor_Value").text(zCrestFactor);
            $("#X_Axis_High_Frequency_RMS_Acceleration_Value").text(zHighFrequencyRmsAcceleration);
            $("#Z_Axis_High_Frequency_RMS_Acceleration_Value").text(xHighFrequencyRmsAcceleration);
            $("#X_Axis_Peak_Velocity_Component_Frequency_Value").text(xPeakVelocityComponentFrequency);
            $("#Z_Axis_Peak_Velocity_Component_Frequency_Value").text(zPeakVelocityComponentFrequency);
            $("#X_Axis_Kurtosis_Value").text(xKurtosis);
            $("#Z_Axis_Kurtosis_Value").text(zKurtosis);
        }

        if(threadDelay > delay) {
            delay = threadDelay;
        }

        mainTimer = setTimeout(function () {
            selectVibrationSensorLowDataLastCountList("D");
        }, delay);
    }

    function test(obj) {
        let str = "";

        for (let i in obj) {
            str += ", " + i + " : '" + obj[i] + "'";
        }

        str = str.substring(1, str.length);

        return "{" + str + "}";
    }
</script>
</html>
