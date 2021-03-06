<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
<head>
    <base href="./">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

    <title>알람 이력 조회</title>

    <!-- adminLTE -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/dist/css/adminlte.min.css">
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/fontawesome-free/css/all.min.css">
    <!-- 알람 팝업 -->
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
    <!-- Select2 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <!-- confirm -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/plugins/jquery-confirm/dist/css/jquery-confirm.css">
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
                        <h1 class="m-0">알람 이력 조회</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/core/main/dashboardPage">홈</a></li>
                            <li class="breadcrumb-item active">이력 조회</li>
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
                        <form id="selectAlarmHistoryListForm" action="<%=request.getContextPath()%>/turck/admin/alarmManagement/selectAlarmHistoryList" method="post">
                            <input id="resLocationCode" type="hidden" value="${locationCode}">
                            <input id="resDeviceCode" type="hidden" value="${deviceCode}">
                            <input id="resSensorCode" type="hidden" value="${sensorCode}">
                            <div class="card card-primary card-outline">
                                <div class="card-header">
                                    <h3 class="card-title">기본 검색조건</h3>
                                </div>
                                <div class="card-body">
                                    <div class="form-group row">
                                        <label for="alarmStatus" class="col-sm-3 col-form-label">알람상태 :</label>
                                        <div class="col-sm-9">
                                            <select id="alarmStatus" class="form-control" value="">
                                                <option value="">- 알람상태 선택 -</option>
                                                <option value="">전체</option>
                                                <option value="1">경고</option>
                                                <option value="2">알람</option>
                                            </select>
                                        </div>
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
                                    <div id="tagNameDiv" class="form-group row">
                                        <label for="tagName" class="col-sm-3 col-form-label">태그 :</label>
                                        <div class="col-sm-9">
                                            <select id="tagName" data-validate="null" class="form-control" value="">
                                                <option value="">- 태그 선택 -</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <div class="card collapsed-card">
                                <div class="card-header">
                                    <h3 class="card-title">추가 검색조건</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i id="additionalSearchIcon" class="fas fa-plus"></i>
                                        </button>
                                    </div>
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
                                    <div class="form-group row">
                                        <label for="confirmStatus" class="col-sm-3 col-form-label">확인상태 :</label>
                                        <div class="col-sm-9">
                                            <select id="confirmStatus" class="form-control">
                                                <option value="">- 확인상태 선택 -</option>
                                                <option value="">전체</option>
                                                <option value="0">확인</option>
                                                <option value="1">미확인</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </form>
                        <div class="row">
                            <div id = "selectAlarmHistoryBtnDiv" class = "col-6">
                                <a id="selectAlarmHistoryBtn" class="btn btn-primary btn-block mb-3">알람 이력 조회</a>
                            </div>
                            <div id="confirmAlarmListBtnDiv" class = "col-12">
                                <a id="confirmAlarmHistoryListBtn" class="btn btn-info btn-block mb-3">알람 이력 확인</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-9">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">알람 목록</h3>
                            </div>
                            <!-- card-header -->
                            <div class="card-body">
                                <table id="alarmHistoryList" class="table table-bordered table-striped" style = "width: 3500px">
                                    <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>로케이션</th>
                                        <th>디바이스</th>
                                        <th>센서</th>
                                        <th>알람상태</th>
                                        <th>알람</th>
                                        <th>발생시간</th>
                                        <th>확인상태</th>
                                        <th>확인시간</th>
                                        <th>태그값</th>
                                        <th>알람설정값</th>
                                        <th>확인자</th>
                                    </tr>
                                    </thead>
                                </table>
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
<!-- sha -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/sha/core.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/sha/sha256.min.js"></script>
<!-- Select2 -->
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/select2/js/select2.full.min.js"></script>
<!-- Form 컨트롤 -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/form/formReset.js"></script>
<!-- Key Event 컨트롤 -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/keyEvent/mainBodyKeyEvent.js"></script>
<!-- jquery-confirm -->
<script src="<%=request.getContextPath()%>/resources/plugins/jquery-confirm/dist/js/jquery-confirm.js"></script>
<!-- InputMask -->
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/moment/moment.min.js"></script>
<!-- date-range-picker -->
<script src="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/daterangepicker/daterangepicker.js"></script>

<!-- Page specific script -->

<!-- Simon -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/include/include.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/dataTable/dataTable.js"></script>

<script>
    let autoSearchStatus = true;

    $(function () {
        $(document).ready(function () {
            commonIncludeLeftMenuImageChange("Parents", "alarmManagement");
            commonIncludeLeftMenuImageChange("Child", "alarmManagementHistoryPage");

            $.fn.selectBoxVisibleCheck($('#deviceCodeDiv'), false);
            $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);
            $.fn.selectBoxVisibleCheck($('#tagNameDiv'), false);

            $.fn.selectBoxVisibleCheck($('#selectAlarmHistoryBtnDiv'), false);

            $('#searchDate').daterangepicker({
                timePicker: true,
                timePickerIncrement: 5,
                locale: {
                    format: 'YYYY-MM-DD HH:mm'
                }
            });

            const table = $("#alarmHistoryList").DataTable({
                scrollX: true,
                autoWidth: false,
                lengthChange: false,
                autoWidth: false,
                language: lang_kor,
                buttons: [
                    {
                        extend: 'copy',
                        text: '복사'
                    },
                    {
                        extend: 'excel',
                        text: '엑셀 다운로드'
                    }
                ],
                columns: [
                    {data: "rowNum"},
                    {data: "locationName"},
                    {data: "deviceName"},
                    {data: "sensorName"},
                    {data: "alarmStatusStr"},
                    {data: "alarmName"},
                    {data: "createDateStr"},
                    {data: "confirmStatusStr"},
                    {data: "confirmDateStr"},
                    {data: "tagValue"},
                    {data: "alarmValue"},
                    {data: "userName"}
                ],
                columnDefs: [
                    {targets: 0, width: "30px", className: "text-center"},
                    {targets: [1, 2, 3], width: "100px", className: "text-center"},
                    {
                        targets: [4],
                        width: "50px",
                        className: "text-center",
                        render: function(data, type, row, meta) {
                            if (data == "알람") {
                                return '<span class="badge badge-danger" style="font-size:100%">' + data + '</span>';
                            } else if (data == "경고") {
                                return '<span class="badge badge-warning" style="font-size:100%">' + data + '</span>';
                            } else if (data == "정상") {
                                return '<span class="badge badge-success" style="font-size:100%">' + data + '</span>';
                            }
                        }
                    },
                    {targets: [5], width: "150px", className: "text-center"},
                    {targets: [6], width: "150px", className: "text-center"},
                    {
                        targets: [7],
                        width: "50px",
                        className: "text-center",
                        render: function(data, type, row, meta) {
                            if (data == "확인") {
                                return '<span class="badge badge-success" style="font-size:100%">' + data + '</span>';
                            } else if (data == "미확인") {
                                return '<span class="badge badge-danger" style="font-size:100%">' + data + '</span>';
                            }
                        }
                    },
                    {targets: [8], width: "150px", className: "text-center"},
                    {targets: [9, 10], width: "80px", className: "text-center"},
                    {targets: [11], width: "80px", className: "text-center"}
                ],
                order: [1, 'asc']
            }).buttons().container().appendTo('#alarmHistoryList_wrapper .col-md-6:eq(0)');

            selectLocationMasterList();
        });

        $.fn.dataTable.ext.errMode = "none";

        $('#selectBoxTr-select-all').on('click', function(){
            const rows = table.rows({'search': 'applied'}).nodes();

            $('input[type="checkbox"]', rows).prop('checked', this.checked);
        });

        $('#selectBoxTr tbody').on('change', 'input[type="checkbox"]', function(){
            if(!this.checked){
                const el = $('#selectBoxTr-select-all').get(0);

                if(el && el.checked && ('indeterminate' in el)){
                    el.indeterminate = true;
                }
            }
        });
    });

    $('#confirmAlarmHistoryListBtn').on('click', function() {
        selectAlarmHistoryList();
    });

    function selectAlarmHistoryList() {
        loadingStart("알람 이력 조회 중 입니다. 잠시만 기다려주세요.");

        const action = $("#selectAlarmHistoryListForm").attr('action');

        let form_data = {};

        if($("#additionalSearchIcon").hasClass("fa-plus") === true) {
            form_data = {
                locationCode: $("#locationCode").val(),
                deviceCode: $("#deviceCode").val(),
                sensorCode: $("#sensorCode").val(),
                tagName: $("#tagName").val(),
                alarmStatus: $("#alarmStatus").val(),
                updateUser: $("#mainSessionUserId").val(),
                confirmStatus: 1
            };
        } else {
            const searchDate = $("#searchDate").val();

            const startDate = searchDate.substr(0,16)+":00";
            const endDate = searchDate.substr(19,34)+":00";

            form_data = {
                locationCode: $("#locationCode").val(),
                deviceCode: $("#deviceCode").val(),
                sensorCode: $("#sensorCode").val(),
                tagName: $("#tagName").val(),
                alarmStatus: $("#alarmStatus").val(),
                confirmStatus: $("#confirmStatus").val(),
                updateUser: $("#mainSessionUserId").val(),
                startDate: startDate,
                endDate: endDate
            };
        }

        $.ajax({
            type: "POST",
            url: action,
            data: form_data,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (resultData) {
                if(resultData != null) {
                    const alarmHistoryList = resultData.alarmHistoryList;

                    addList($('#alarmHistoryList'), alarmHistoryList);

                    if(resultData.startDate != null) {
                        const startDate = resultData.startDate.substring(0, 16);
                        const endDate = resultData.endDate.substring(0, 16);

                        const searchDate = startDate+" - "+endDate;

                        $("#searchDate").val(searchDate);
                    }
                }
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "알람 목록 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
                $('#selectBoxTr-select-all').prop('checked',false);

                loadingEnd();
            }
        });
    }

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
        $('#resSensorCode').val("");
        $('#resDeviceCode').val("");
        $('#resLocationCode').val("");

        $.fn.selectBoxReset($('#sensorCode'));
        $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);

        $.fn.selectBoxReset($('#deviceCode'));
        $.fn.selectBoxVisibleCheck($('#deviceCodeDiv'), false);

        $.fn.selectBoxReset($('#tagName'));
        $.fn.selectBoxVisibleCheck($('#tagNameDiv'), false);

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
        $('#resSensorCode').val("");
        $('#resDeviceCode').val("");
        $('#resLocationCode').val("");

        $.fn.selectBoxReset($('#sensorCode'));
        $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);

        $.fn.selectBoxReset($('#tagName'));
        $.fn.selectBoxVisibleCheck($('#tagNameDiv'), false);

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
                const resSensorCode = $("#resSensorCode").val();

                if(resSensorCode != "") {
                    $("#sensorCode").val(resSensorCode);

                    $.fn.divVisibleCheck($('#sensorDetailMainDiv'), true);

                    if(autoSearchStatus) {
                        autoSearchStatus = false;

                        selectAlarmHistoryList();
                    }
                }
            }
        });
    }

    $('#sensorCode').on('change', function() {
        $.fn.selectBoxReset($('#tagName'));
        $.fn.selectBoxVisibleCheck($('#tagNameDiv'), false);

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

        $.ajax({
            type: "POST",
            url: action,
            data: form_data,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (resultData) {
                if(resultData != null) {
                    const tagMasterList = JSON.parse(resultData.tagMasterList);

                    $.fn.selectBoxReset($('#tagName'));

                    if(tagMasterList.length > 0) {
                        $.fn.selectBoxVisibleCheck($('#tagNameDiv'), true);

                        $.fn.selectBoxAddOption($('#tagName'), "", "- 태그 선택 -");
                        $.fn.selectBoxAddOption($('#tagName'), "X_Axis_RMS_Velocity_mm", "X_Axis_RMS_Velocity_mm");
                        $.fn.selectBoxAddOption($('#tagName'), "Z_Axis_RMS_Velocity_mm", "Z_Axis_RMS_Velocity_mm");
                        $.fn.selectBoxAddOption($('#tagName'), "X_Axis_Peak_Acceleration", "X_Axis_Peak_Acceleration");
                        $.fn.selectBoxAddOption($('#tagName'), "Z_Axis_Peak_Acceleration", "Z_Axis_Peak_Acceleration");
                        $.fn.selectBoxAddOption($('#tagName'), "Temperature_C", "Temperature_C");
                    } else {
                        $.fn.selectBoxVisibleCheck($('#tagNameDiv'), false);
                    }
                }
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "태그 목록 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {

            }
        });
    }

    $("#aBTN").click(function() {
        const locationCode = $("#locationCode").val();
        const deviceCode = $("#deviceCode").val();
        const sensorCode = $("#sensorCode").val();

        window.location = "/SSMEdge/turck/admin/alarmManagement/selectAlarmHistoryList?locationCode="+locationCode+"&deviceCode="+deviceCode+"&sensorCode="+sensorCode;
    });

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
