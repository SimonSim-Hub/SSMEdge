</html><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
    <base href="./">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

    <title>Dashboard</title>

    <!-- adminLTE -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/dist/css/adminlte.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/fontawesome-free/css/all.min.css">
    <!-- 알람 팝업 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/toastr-master/dist/css/toastr.css">
    <!-- confirm -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/jquery-confirm/dist/css/jquery-confirm.css">
    <!-- 로딩 이미지 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/loading-master/dist/css/easy-loading.css">
    <!-- c3 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/ssm/js/common/c3/c3.min.css">
    <!-- 공통 CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/ssm/css/ssmCSS.css">



</head>
<body class="hold-transition text-sm sidebar-mini hidden-scroll">
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
                        <h1 class="m-0">대시보드</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/core/main/dashboardPage">홈</a></li>
                            <li class="breadcrumb-item active">대시보드</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <input id="locationCode" type="hidden" value="">
            <input id="deviceCode" type="hidden" value="">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div>
                            <div id = "deviceButtonDiv" class="btn-group w-100 mb-2">
                                <a class="btn btn-info active" href="javascript:void(0)" data-filter="all"> 전체 보기 </a>
                                <a class="btn btn-info" href="javascript:void(0)" data-filter="device_code"> 설비 A (WHITE) </a>
                                <a class="btn btn-info" href="javascript:void(0)" data-filter="2"> 설비 B (BLACK) </a>
                                <a class="btn btn-info" href="javascript:void(0)" data-filter="3"> 설비 C (RED) </a>
                                <a class="btn btn-info" href="javascript:void(0)" data-filter="4"> 다중 선택 </a>
                            </div>
                            <div class="mb-2">
                                <a class="btn btn-secondary" href="javascript:void(0)" data-shuffle> 새로고침 </a>
                                <div class="float-right">
                                    <select class="custom-select" style="width: auto;" data-sortOrder>
                                        <option value="index"> 설비 정렬 </option>
                                        <option value="sortData"> 이상감지 정렬 </option>
                                    </select>
                                    <div class="btn-group">
                                        <a class="btn btn-default" href="javascript:void(0)" data-sortAsc> 오름차순 </a>
                                        <a class="btn btn-default" href="javascript:void(0)" data-sortDesc> 내림차순 </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div id="sensorCardDiv" class="filter-container p-0 row">

                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

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
<!-- 알람 팝업 -->
<script src="<%=request.getContextPath()%>/resources/plugins/toastr-master/dist/js/toastr.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/alarm/alarmPopUp.js"></script>
<!-- 로딩 이미지 -->
<script src="<%=request.getContextPath()%>/resources/plugins/loading-master/dist/js/easy-loading.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/loading/loading.js"></script>
<!-- Ekko Lightbox -->
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/ekko-lightbox/ekko-lightbox.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/dist/js/adminlte.min.js"></script>
<!-- Filterizr-->
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/filterizr/jquery.filterizr.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/dist/js/demo.js"></script>
<!-- c3 -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/c3/c3.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/c3/d3-5.8.2.min.js"></script>
<!-- 등록 정규식 -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/validate/userManagementValidate.js"></script>
<!-- Page specific script -->

<!-- Simon -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/include/include.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/filterContainer/filterContainer.js"></script>

<script>
    let chartObjectList = [];
    let repeatStatus = false;

    let mainTimer = null;

    $(function () {
        $( document ).ready(function() {
            commonIncludeLeftMenuImageChange("Parents", "dashboardPage");
        });
        $(document).on('click', '[data-toggle="lightbox"]', function(event) {
            event.preventDefault();
            $(this).ekkoLightbox({
                alwaysShowClose: true
            });
        });
        selectDeviceMasterList();
    });

    function selectDeviceMasterList() {
        const action = "<%=request.getContextPath()%>/core/main/selectDeviceMasterList";

        const locationCode = $("#locationCode").val();

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
                    const deviceMasterList = JSON.parse(resultData.deviceMasterList);
                    // 헤더 그리기
                    $.fn.drawHeader(deviceMasterList, $("#deviceButtonDiv"));
                }
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "디바이스 목록 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
                selectSensorMasterList();
            }
        });
    }

    function selectSensorMasterList() {
        const action = "<%=request.getContextPath()%>/core/main/selectSensorMasterList";

        const locationCode = $("#locationCode").val();

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
                    const sensorMasterList = JSON.parse(resultData.sensorMasterList);

                    // 카드 그리기
                    $.fn.drawSensorCard(sensorMasterList, $("#sensorCardDiv"));
                }
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "센서 목록 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
                $('.filter-container').filterizr({gutterPixels: 3});
                $('.btn[data-filter]').on('click', function() {
                    $('.btn[data-filter]').removeClass('active');
                    $(this).addClass('active');
                });

                selectSensorMainChartData();
            }
        });
    }

    function selectSensorMainChartData() {
        const action = "<%=request.getContextPath()%>/core/main/dashboard/selectSensorMainChartData";
        chartObjectList = [];

        const locationCode = $("#locationCode").val();

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
                    const sensorMasterList = JSON.parse(resultData.sensorMasterList);

                    for(let i = 0; i < sensorMasterList.length; i++){
                        const sensorCode = sensorMasterList[i].sensorCode;
                        const deviceCode = sensorMasterList[i].deviceCode;
                        drawSensorMainChartData(sensorCode, deviceCode);
                    }
                }
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "센서 목록 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
                selectVibrationSensorLowDataLastCountList("M");
            }
        });
    }

    function drawSensorMainChartData(sensorCode, deviceCode) {
        const chartId = '#chart_' + sensorCode;
        const sensorChart = c3.generate({
            bindto: chartId,
            size: {
                height: 160
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
                        count: 10,
                        format: '%H:%M:%S'
                    }
                },
                y: {
                    tick: {
                        count: 5,
                        format: d3.format(".3f")
                    }
                }
            },

            color: {
                pattern: ['#6610f2', '#f012be']
            }
        });

        const chartObj = {
            sensorCode: sensorCode,
            deviceCode: deviceCode,
            sensorChart: sensorChart,
            redrawArgs: {},
            oTimeArr: ["OTIME"],
            xRMSVelocityArr: ["X_RMS_Velocity"],
            zRMSVelocityArr: ["Z_RMS_Velocity"]
        };

        chartObjectList.push(chartObj);
    }

    function selectVibrationSensorLowDataLastCountList(chartType) {
        const action = "<%=request.getContextPath()%>/core/main/dashboard/selectVibrationSensorLowDataLastCountList";

        const locationCode = $("#locationCode").val();
        const deviceCode = $("#deviceCode").val();

        const form_data = {
            chartType: chartType,
            locationCode: locationCode,
            deviceCode: deviceCode
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
                repeatStatus = true;
            }
        });
    }

    function drawTagLowDataLastCountListChart(realTimeVibrationSensorChartDataVOList, threadDelay) {
        let delay = 2000;

        for(let i = 0; i < realTimeVibrationSensorChartDataVOList.length; i++) {
            let oTimeArr = [];
            let xRMSVelocityArr = [];
            let zRMSVelocityArr = [];

            let dataCols = [];

            const dbListSensorCode = realTimeVibrationSensorChartDataVOList[i].sensorCode;

            const dbOTimeArr = realTimeVibrationSensorChartDataVOList[i].oTimeArr;

            for(let j = 0; j < dbOTimeArr.length; j++) {
                if(j == 0) {
                    oTimeArr.push("OTIME");
                }

                oTimeArr.push(new Date(dbOTimeArr[j]));
            }

            xRMSVelocityArr = realTimeVibrationSensorChartDataVOList[i].xRMSVelocityArr;
            zRMSVelocityArr = realTimeVibrationSensorChartDataVOList[i].zRMSVelocityArr;

            dataCols.push(oTimeArr);
            dataCols.push(xRMSVelocityArr);
            dataCols.push(zRMSVelocityArr);

            for(let j = 0; j < chartObjectList.length; j++) {
                const chartListSensorCode = chartObjectList[j].sensorCode;
                const chartListChartObject = chartObjectList[j].sensorChart;

                let chartListRedrawArgs = chartObjectList[j].redrawArgs;

                if(dbListSensorCode == chartListSensorCode) {
                    const xRMSVelocity = realTimeVibrationSensorChartDataVOList[i].x_axis_rms_velocity_mm_value;
                    const xRMSVelocityWarning = realTimeVibrationSensorChartDataVOList[i].x_axis_rms_velocity_mm_warning;
                    const xRMSVelocityAlarm = realTimeVibrationSensorChartDataVOList[i].x_axis_rms_velocity_mm_alarm;
                    const xRMSVelocityStatus = realTimeVibrationSensorChartDataVOList[i].x_axis_rms_velocity_mm_status;

                    $("#" + chartListSensorCode + "_X_Axis_RMS_Velocity_mm_Value").text(xRMSVelocity);
                    $("#" + chartListSensorCode + "_X_Axis_RMS_Velocity_Warning_Value").text(xRMSVelocityWarning);
                    $("#" + chartListSensorCode + "_X_Axis_RMS_Velocity_Alarm_Value").text(xRMSVelocityAlarm);

                    let headerAlarmStatus = 0;

                    if(xRMSVelocityStatus == 1) {
                        $("#" + chartListSensorCode + "_X_Axis_RMS_Velocity_mm_Value").addClass('font-color-warning');

                        headerAlarmStatus = 1;
                    } else if (xRMSVelocityStatus == 2) {
                        $("#" + chartListSensorCode + "_X_Axis_RMS_Velocity_mm_Value").addClass('font-color-Error');

                        headerAlarmStatus = 2;
                    } else {
                        $("#" + chartListSensorCode + "_X_Axis_RMS_Velocity_mm_Value").removeClass('font-color-warning');
                        $("#" + chartListSensorCode + "_X_Axis_RMS_Velocity_mm_Value").removeClass('font-color-Error');
                    }

                    const zRMSVelocity = realTimeVibrationSensorChartDataVOList[i].z_axis_rms_velocity_mm_value;
                    const zRMSVelocityWarning = realTimeVibrationSensorChartDataVOList[i].z_axis_rms_velocity_mm_warning;
                    const zRMSVelocityAlarm = realTimeVibrationSensorChartDataVOList[i].z_axis_rms_velocity_mm_alarm;
                    const zRMSVelocityStatus = realTimeVibrationSensorChartDataVOList[i].z_axis_rms_velocity_mm_status;

                    $("#" + chartListSensorCode + "_Z_Axis_RMS_Velocity_mm_Value").text(zRMSVelocity);
                    $("#" + chartListSensorCode + "_Z_Axis_RMS_Velocity_Warning_Value").text(zRMSVelocityWarning);
                    $("#" + chartListSensorCode + "_Z_Axis_RMS_Velocity_Alarm_Value").text(zRMSVelocityAlarm);

                    if(zRMSVelocityStatus == 1) {
                        $("#" + chartListSensorCode + "_Z_Axis_RMS_Velocity_mm_Value").addClass('font-color-warning');

                        headerAlarmStatus = 1;
                    } else if (zRMSVelocityStatus == 2) {
                        $("#" + chartListSensorCode + "_Z_Axis_RMS_Velocity_mm_Value").addClass('font-color-Error');

                        headerAlarmStatus = 2;
                    } else {
                        $("#" + chartListSensorCode + "_Z_Axis_RMS_Velocity_mm_Value").removeClass('font-color-warning');
                        $("#" + chartListSensorCode + "_Z_Axis_RMS_Velocity_mm_Value").removeClass('font-color-Error');
                    }

                    if(headerAlarmStatus == 0) {
                        $("#" + chartListSensorCode + "_Card_Header").removeClass('card-warning');
                        $("#" + chartListSensorCode + "_Card_Header").removeClass('card-danger');
                    } else if (headerAlarmStatus == 1) {
                        $("#" + chartListSensorCode + "_Card_Header").addClass('card-warning');
                    } else if (headerAlarmStatus == 2) {
                        $("#" + chartListSensorCode + "_Card_Header").addClass('card-danger');
                    }

                    chartListRedrawArgs.columns = dataCols;

                    chartListChartObject.load(chartListRedrawArgs);
                }
            }
        }

        if(threadDelay > delay) {
            delay = threadDelay;
        }

        mainTimer = setTimeout(function(){
            selectVibrationSensorLowDataLastCountList("M");
        }, delay);
    }

    function deviceBtnClick(deviceCode) {
        repeatStatus = false;

        clearTimeout(mainTimer);

        if(deviceCode == 0) {
            $("#deviceCode").val("");
        } else {
            $("#deviceCode").val(deviceCode);
        }

        selectVibrationSensorLowDataLastCountList("M");
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