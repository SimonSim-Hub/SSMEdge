<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
<head>
    <base href="./">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

    <title>센서 이력 목록 조회</title>

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
    <!-- Select2 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/daterangepicker/daterangepicker.css">

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
                        <h1 class="m-0">센서 이력 목록 조회</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/core/main/dashboardPage">홈</a></li>
                            <li class="breadcrumb-item active">이력 정보</li>
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
                        <form id="selectSensorReportForm" action="<%=request.getContextPath()%>/core/main/detail/selectSensorReport" method="post">
                            <input id="resTagCode" type="hidden" value="">
                            <input id="resSensorCode" type="hidden" value="${sensorCode}">
                            <input id="resDeviceCode" type="hidden" value="${deviceCode}">
                            <input id="resLocationCode" type="hidden" value="${locationCode}">
                            <div class="card card-primary card-outline">
                                <div class="card-header">
                                    <h3 class="card-title">기본 검색조건</h3>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label>검색 기간:</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="far fa-clock"></i></span>
                                            </div>
                                            <input id="searchDate" type="text" data-validate="null" class="form-control float-right">
                                        </div>
                                        <!-- /.input group -->
                                    </div>
                                    <div style="border-bottom: 1px solid rgba(0,0,0,.125); margin-bottom:15px"></div>
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
                                    <div style="border-bottom: 1px solid rgba(0,0,0,.125); margin-bottom:15px"></div>
                                    <div id="tagCodeDiv" class="form-group">
                                        <label>태그 :</label>
                                        <select id="tagCode" autocomplete="off" data-validate="null" class="select2" multiple="multiple" data-placeholder="- 태그 선택 -" style="width: 100%;">
                                            <option value="">- 태그 선택 -</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </form>
                        <a id="selectSensorReportBtn" class="btn btn-primary btn-block mb-3">이력 정보 조회</a>
                    </div>
                    <div id="sensorReportMainDiv" class="col-9">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="filter-container">
                                    <div id="Main_Header" class="card card-primary">
                                        <div id="Main_Header_Title" class="card-header">RMS_Velocity</div>
                                        <div class="banner-img min-height-300" style="padding-right: 20px; padding-top: 10px;">
                                            <div id="detailChart" style="margin-top: 5px"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-primary card-outline">
                                    <div class="card-header">
                                        <h3 class="card-title">태그 이력 목록</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <table id="tagReportList" class="table table-bordered table-striped" style = "width: 5000px">
                                            <thead>
                                            <tr>
                                                <th>NO</th>
                                                <th>OTIME</th>
                                                <th>로케이션</th>
                                                <th>디바이스</th>
                                                <th>센서</th>
                                                <th>X_Axis_RMS_Velocity</th>
                                                <th>Z_Axis_RMS_Velocity</th>
                                                <th>X_Axis_Peak_Acceleration</th>
                                                <th>Z_Axis_Peak_Acceleration</th>
                                                <th>Temperature_C</th>
                                                <th>X_Axis_Peak_Velocity</th>
                                                <th>Z_Axis_Peak_Velocity</th>
                                                <th>X_Axis_RMS_Acceleration</th>
                                                <th>Z_Axis_RMS_Acceleration</th>
                                                <th>X_Axis_Crest_Factor</th>
                                                <th>Z_Axis_Crest_Factor</th>
                                                <th>X_Axis_High_Frequency_RMS_Acceleration</th>
                                                <th>Z_Axis_High_Frequency_RMS_Acceleration</th>
                                                <th>X_Axis_Peak_Velocity_Component_Frequency</th>
                                                <th>Z_Axis_Peak_Velocity_Component_Frequency</th>
                                                <th>X_Axis_Kurtosis</th>
                                                <th>Z_Axis_Kurtosis</th>
                                            </tr>
                                            </thead>
                                        </table>
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
<!-- Select2 -->
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/select2/js/select2.full.min.js"></script>
<!-- InputMask -->
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/moment/moment.min.js"></script>
<!-- date-range-picker -->
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Page specific script -->

<!-- Simon -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/include/include.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/dataTable/dataTable.js"></script>
<!-- Form 컨트롤 -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/form/formReset.js"></script>

<script>
    let sensorChart = null;
    let autoSearchStatus = true;

    $(function () {
        $(document).ready(function () {
            commonIncludeLeftMenuImageChange("Parents", "reportPage");

            $("#tagCode").select2();

            $('#searchDate').daterangepicker({
                timePicker: true,
                timePickerIncrement: 5,
                locale: {
                    format: 'YYYY-MM-DD HH:mm'
                }
            });

            $.fn.selectBoxVisibleCheck($('#deviceCodeDiv'), false);
            $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);
            $.fn.selectBoxVisibleCheck($('#tagCodeDiv'), false);

            $.fn.selectBoxVisibleCheck($('#sensorReportMainDiv'), false);

            selectLocationMasterList();

            const table = $("#tagReportList").DataTable({
                responsive: true,
                scrollX: true,
                autoWidth: false,
                lengthChange: false,
                language:lang_kor,
                buttons: [
                    {
                        extend: 'copy',
                        text: '복사'
                    },
                    {
                        extend: 'excel',
                        text: '엑셀 다운로드'
                    },
                    {
                        extend: 'pdf',
                        text: 'PDF 다운로드'
                    },
                    {
                        extend: 'print',
                        text: '프린트'
                    }
                ],
                columns: [
                    {data: "rowNum"},
                    {data: "oTimeStr"},
                    {data: "locationName"},
                    {data: "deviceName"},
                    {data: "sensorName"},
                    {data: "xAxisRmsVelocityMmValue"},
                    {data: "zAxisRmsVelocityMmValue"},
                    {data: "xAxisPeakAccelerationValue"},
                    {data: "zAxisPeakAccelerationValue"},
                    {data: "temperatureCValue"},
                    {data: "xAxisPeakVelocityMmValue"},
                    {data: "zAxisPeakVelocityMmValue"},
                    {data: "xAxisRmsAccelerationValue"},
                    {data: "zAxisRmsAccelerationValue"},
                    {data: "xAxisCrestFactorValue"},
                    {data: "zAxisCrestFactorValue"},
                    {data: "xAxisHighFrequencyRmsAccelerationValue"},
                    {data: "zAxisHighFrequencyRmsAccelerationValue"},
                    {data: "xAxisPeakVelocityComponentFrequencyValue"},
                    {data: "zAxisPeakVelocityComponentFrequencyValue"},
                    {data: "xAxisKurtosisValue"},
                    {data: "zAxisKurtosisValue"}
                ],
                columnDefs: [
                    {targets: [0], width: "30px", className: "text-center"},
                    {targets: [1], width: "150px", className: "text-center", },
                    {targets: [2, 3, 4], width: "100px", className: "text-center"},
                    {targets: [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21], width: "200px", className: "text-center"}
                ],
                order: [0, 'asc']
            }).buttons().container().appendTo('#tagReportList_wrapper .col-md-6:eq(0)');
        });
    });

    $.fn.dataTable.ext.errMode = "none";

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
                if(autoSearchStatus) {
                    const resLocationCode = $("#resLocationCode").val();

                    if(resLocationCode != "") {
                        $("#locationCode").val(resLocationCode);

                        selectDeviceMasterList();
                    }
                }
            }
        });
    }

    $('#locationCode').on('change', function() {
        autoSearchStatus = false;

        $.fn.selectBoxReset($('#deviceCode'));
        $.fn.selectBoxVisibleCheck($('#deviceCodeDiv'), false);

        $.fn.selectBoxReset($('#sensorCode'));
        $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);

        $.fn.selectBoxReset($('#tagCode'));
        $.fn.selectBoxVisibleCheck($('#tagCodeDiv'), false);

        $.fn.selectBoxVisibleCheck($('#sensorReportMainDiv'), false);

        if(this.value != "") {
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
                if(autoSearchStatus) {
                    const resDeviceCode = $("#resDeviceCode").val();

                    if(resDeviceCode != "") {
                        $("#deviceCode").val(resDeviceCode);

                        selectSensorMasterList();
                    }
                }
            }
        });
    }

    $('#deviceCode').on('change', function() {
        $.fn.selectBoxReset($('#sensorCode'));
        $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);

        $.fn.selectBoxReset($('#tagCode'));
        $.fn.selectBoxVisibleCheck($('#tagCodeDiv'), false);

        $.fn.selectBoxVisibleCheck($('#sensorReportMainDiv'), false);

        if(this.value != "") {
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
                if(autoSearchStatus) {
                    const resSensorCode = $("#resSensorCode").val();

                    if (resSensorCode != "") {
                        $("#sensorCode").val(resSensorCode);

                        selectTagMasterList();
                    }
                }
            }
        });
    }

    $('#sensorCode').on('change', function() {
        $.fn.selectBoxReset($('#tagCode'));
        $.fn.selectBoxVisibleCheck($('#tagCodeDiv'), false);

        $.fn.selectBoxVisibleCheck($('#sensorReportMainDiv'), false);

        if(this.value != "") {
            selectTagMasterList();
        }
    });

    function selectTagMasterList() {
        const action = "<%=request.getContextPath()%>/core/main/selectTagMasterList";

        const sensorCode = $("#sensorCode").val();

        const form_data = {
            sensorCode: sensorCode
        };

        let tagMasterList = null;

        $.ajax({
            type: "POST",
            url: action,
            data: form_data,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (resultData) {
                if(resultData != null) {
                    tagMasterList = JSON.parse(resultData.tagMasterList);

                    $.fn.selectBoxReset($('#tagCode'));

                    if(tagMasterList.length > 0) {
                        $.fn.selectBoxVisibleCheck($('#tagCodeDiv'), true);

                        for(let i = 0; i < tagMasterList.length; i++) {
                            const name = tagMasterList[i].tagName;

                            if(i == 0) {
                                $.fn.selectBoxAddOption($('#tagCode'), "", "- 태그 선택 -");
                            }

                            $.fn.selectBoxAddOption($('#tagCode'), name, name);
                        }
                    } else {
                        $.fn.selectBoxVisibleCheck($('#tagCodeDiv'), false);
                    }
                }
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "태그 목록 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
                if(autoSearchStatus) {
                    autoSearchStatus = false;

                    $('#resLocationCode').val("");
                    $('#resDeviceCode').val("");
                    $('#resSensorCode').val("");

                    if(tagMasterList.length > 0) {
                        let tagValueArr = [];

                        for(let i = 0; i < tagMasterList.length; i++) {
                            const name = tagMasterList[i].tagRealname;

                            if(name == "X_Axis_RMS_Velocity_mm" || name == "Z_Axis_RMS_Velocity_mm") {
                                tagValueArr.push(name);
                            }
                        }

                        $("#tagCode").val(tagValueArr);
                    }

                    $.fn.selectBoxVisibleCheck($('#sensorReportMainDiv'), true);

                    drawReportChartData();
                }
            }
        });
    }

    $('#tagCode').on('change', function() {
        $.fn.selectBoxVisibleCheck($('#sensorReportMainDiv'), false);
    });

    $("#selectSensorReportBtn").click(function () {
        if(!$.fn.validate($("#selectSensorReportForm"))) {
            return false;
        }

        const chartListChartObject = sensorChart;

        if(chartListChartObject != null) {
            chartListChartObject.destroy();
        }

        $.fn.divVisibleCheck($('#sensorReportMainDiv'), true);

        drawReportChartData();
    });

    function drawReportChartData() {
        sensorChart = null;

        sensorChart = c3.generate({
            bindto: '#detailChart',
            size: {
                height: 500
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
            subchart: {
                show: true
            },
            axis: {
                x: {
                    type: 'timeseries',
                    tick: {
                        count: 100,
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

        selectVibrationSensorLowDataList();
    }

    function selectVibrationSensorLowDataList() {
        const action = "<%=request.getContextPath()%>/core/main/dashboard/selectVibrationSensorReportDataList";

        const locationCode = $("#locationCode").val();
        const deviceCode = $("#deviceCode").val();
        const sensorCode = $("#sensorCode").val();

        const searchDate = $("#searchDate").val();

        const startDate = searchDate.substr(0,16)+":00";
        const endDate = searchDate.substr(18,34)+":00";

        const form_data = {
            locationCode: locationCode,
            deviceCode: deviceCode,
            sensorCode: sensorCode,
            startDate: startDate,
            endDate: endDate
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
                    const vibrationSensorReportDataList = resultData.vibrationSensorReportDataList;
                    const reportVibrationSensorChartDataVOList = JSON.parse(resultData.reportVibrationSensorChartDataVOList);
                    const listType = resultData.listType;

                    const startDate = resultData.startDate.substring(0, 16);
                    const endDate = resultData.endDate.substring(0, 16);

                    if(listType == "LC") {
                        const searchDate = startDate+" - "+endDate;

                        $("#searchDate").val(searchDate);
                    }

                    addList($('#tagReportList'), vibrationSensorReportDataList);

                    drawTagLowDataLastCountListChart(reportVibrationSensorChartDataVOList);

                    alarmPopUp(resultData.resultStatus, resultData.resultMessage, "");
                }
            },
            error: function (jqXHR, resultData) {
            },
            complete: function () {
            }
        });
    }

    function drawTagLowDataLastCountListChart(realTimeVibrationSensorChartDataVOList) {
        const tagCode = $("#tagCode").val();

        let gridArr = [];

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

            const xRMSVelocityWarning = realTimeVibrationSensorChartDataVOList[i].x_axis_rms_velocity_mm_warning;
            const xRMSVelocityAlarm = realTimeVibrationSensorChartDataVOList[i].x_axis_rms_velocity_mm_alarm;
            const zRMSVelocityWarning = realTimeVibrationSensorChartDataVOList[i].z_axis_rms_velocity_mm_warning;
            const zRMSVelocityAlarm = realTimeVibrationSensorChartDataVOList[i].z_axis_rms_velocity_mm_alarm;
            const xPeakAccelerationWarning = realTimeVibrationSensorChartDataVOList[i].x_axis_peak_acceleration_warning;
            const xPeakAccelerationAlarm = realTimeVibrationSensorChartDataVOList[i].x_axis_peak_acceleration_alarm;
            const zPeakAccelerationWarning = realTimeVibrationSensorChartDataVOList[i].z_axis_peak_acceleration_warning;
            const zPeakAccelerationAlarm = realTimeVibrationSensorChartDataVOList[i].z_axis_peak_acceleration_alarm;
            const temperatureCWarning = realTimeVibrationSensorChartDataVOList[i].temperature_c_warning;
            const temperatureCAlarm = realTimeVibrationSensorChartDataVOList[i].temperature_c_alarm;

            dataCols.push(oTimeArr);

            if(tagCode.indexOf(xRMSVelocityArr[0].toString()) >= 0) {
                dataCols.push(xRMSVelocityArr);

                gridArr.push({value: xRMSVelocityWarning, text: 'X RMS Velocity 경고', position: 'start', class: 'warning'});
                gridArr.push({value: xRMSVelocityAlarm, text: 'X RMS Velocity 알람', position: 'start', class: 'error'});
            }
            if(tagCode.indexOf(zRMSVelocityArr[0].toString()) >= 0) {
                dataCols.push(zRMSVelocityArr);

                gridArr.push({value: zRMSVelocityWarning, text: 'Z RMS Velocity 경고', position: 'end', class: 'warning'});
                gridArr.push({value: zRMSVelocityAlarm, text: 'Z RMS Velocity 알람', position: 'end', class: 'error'});
            }
            if(tagCode.indexOf(xPeakAccelerationArr[0].toString()) >= 0) {
                dataCols.push(xPeakAccelerationArr);

                gridArr.push({value: xPeakAccelerationWarning, text: 'X Peak Acceleration 경고', position: 'start', class: 'warning'});
                gridArr.push({value: xPeakAccelerationAlarm, text: 'X Peak Acceleration 알람', position: 'start', class: 'error'});
            }
            if(tagCode.indexOf(zPeakAccelerationArr[0].toString()) >= 0) {
                dataCols.push(zPeakAccelerationArr);

                gridArr.push({value: zPeakAccelerationWarning, text: 'Z Peak Acceleration 경고', position: 'end', class: 'warning'});
                gridArr.push({value: zPeakAccelerationAlarm, text: 'Z Peak Acceleration 알람', position: 'end', class: 'error'});
            }
            if(tagCode.indexOf(temperatureCArr[0].toString()) >= 0) {
                dataCols.push(temperatureCArr);

                gridArr.push({value: temperatureCWarning, text: '온도 경고', position: 'middle', class: 'warning'});
                gridArr.push({value: temperatureCAlarm, text: '온도 알람', position: 'middle', class: 'error'});
            }
            if(tagCode.indexOf(xPeakVelocityArr[0].toString()) >= 0) {
                dataCols.push(xPeakVelocityArr);
            }
            if(tagCode.indexOf(zPeakVelocityArr[0].toString()) >= 0) {
                dataCols.push(zPeakVelocityArr);
            }
            if(tagCode.indexOf(xRMSAccelerationArr[0].toString()) >= 0) {
                dataCols.push(xRMSAccelerationArr);
            }
            if(tagCode.indexOf(zRMSAccelerationArr[0].toString()) >= 0) {
                dataCols.push(zRMSAccelerationArr);
            }
            if(tagCode.indexOf(xCrestFactorArr[0].toString()) >= 0) {
                dataCols.push(xCrestFactorArr);
            }
            if(tagCode.indexOf(zCrestFactorArr[0].toString()) >= 0) {
                dataCols.push(zCrestFactorArr);
            }
            if(tagCode.indexOf(zHighFrequencyRmsAccelerationArr[0].toString()) >= 0) {
                dataCols.push(zHighFrequencyRmsAccelerationArr);
            }
            if(tagCode.indexOf(xHighFrequencyRmsAccelerationArr[0].toString()) >= 0) {
                dataCols.push(xHighFrequencyRmsAccelerationArr);
            }
            if(tagCode.indexOf(xPeakVelocityComponentFrequencyArr[0].toString()) >= 0) {
                dataCols.push(xPeakVelocityComponentFrequencyArr);
            }
            if(tagCode.indexOf(zPeakVelocityComponentFrequencyArr[0].toString()) >= 0) {
                dataCols.push(zPeakVelocityComponentFrequencyArr);
            }
            if(tagCode.indexOf(xKurtosisArr[0].toString()) >= 0) {
                dataCols.push(xKurtosisArr);
            }
            if(tagCode.indexOf(zKurtosisArr[0].toString()) >= 0) {
                dataCols.push(zKurtosisArr);
            }

            const chartListChartObject = sensorChart;

            let chartListRedrawArgs = {};

            chartListRedrawArgs.columns = dataCols;

            chartListChartObject.load(chartListRedrawArgs);
        }

        sensorChart.ygrids.add(gridArr);
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
