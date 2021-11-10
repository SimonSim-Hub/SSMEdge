<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
<head>
    <base href="./">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

    <title>알람 정보 확인</title>

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
                        <h1 class="m-0">알람 정보 확인</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/core/main/dashboardPage">홈</a></li>
                            <li class="breadcrumb-item active">알람 확인</li>
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
                        <form id="selectAlarmMasterListForm" action="<%=request.getContextPath()%>/turck/admin/alarmManagement/selectAlarmMasterList" method="post">
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
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </form>
                        <div class="row">
                            <div id = "selectAlarmHistoryBtnDiv" class = "col-6">
                                <a id="selectAlarmHistoryBtn" class="btn btn-primary btn-block mb-3">알람 이력 조회</a>
                            </div>
                            <div id="confirmAlarmListBtnDiv" class = "col-12">
                                <a id="confirmAlarmListBtn" class="btn btn-info btn-block mb-3">알람 확인</a>
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
                                <table id="alarmMasterList" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th><input name="select_all" value="1" id="selectBoxTr-select-all" type="checkbox" /></th>
                                        <th>NO</th>
                                        <th>로케이션</th>
                                        <th>디바이스</th>
                                        <th>센서</th>
                                        <th>알람상태</th>
                                        <th>알람코드</th>
                                        <th>알람</th>
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
<!-- Page specific script -->

<!-- Simon -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/include/include.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/dataTable/dataTable.js"></script>

<script>
    $(function () {
        $(document).ready(function () {
            commonIncludeLeftMenuImageChange("Parents", "alarmManagement");
            commonIncludeLeftMenuImageChange("Child", "alarmManagementConfirmPage");

            $.fn.selectBoxVisibleCheck($('#deviceCodeDiv'), false);
            $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);

            $.fn.selectBoxVisibleCheck($('#selectAlarmHistoryBtnDiv'), false);

            selectLocationMasterList();

            selectAlarmMasterList();
        });

        const table = $("#alarmMasterList").DataTable({
            responsive: true,
            lengthChange: false,
            autoWidth: false,
            scrollY: "550px",
            scrollCollapse: true,
            paging:false,
            language: lang_kor,
            columns: [
                {data: null},
                {data: "rowNum"},
                {data: "locationName"},
                {data: "deviceName"},
                {data: "sensorName"},
                {data: "alarmStatusStr"},
                {data: "alarmCode"},
                {data: "alarmName"}
            ],
            columnDefs: [
                {
                    searchable:false,
                    targets: 0,
                    width: "2%",
                    orderable: false,
                    className: 'dt-body-center',
                    render: function (data, type, full, meta){
                        return '<input type="checkbox" name="alarmListCheck" value="' + $('<div/>').text(data).html() + '">';
                    }
                },
                {targets: 1, width: "4%", className: "text-center"},
                {targets: [6], width: "22%", className: "text-center"},
                {targets: [2, 3, 4], width: "12%", className: "text-center"},
                {targets: 7, width: "24%", className: "text-center"},
                {
                    targets: [5],
                    width: "12%",
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
                }
            ],
            order: [1, 'asc']
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

    function selectAlarmMasterList() {
        const action = $("#selectAlarmMasterListForm").attr('action');

        const form_data = {
            locationCode: $("#locationCode").val(),
            deviceCode: $("#deviceCode").val(),
            sensorCode: $("#sensorCode").val(),
            alarmStatus: $("#alarmStatus").val()
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
                    const alarmMasterList = resultData.alarmMasterList;

                    addList($('#alarmMasterList'), alarmMasterList);
                }
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "알람 목록 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
                $('#selectBoxTr-select-all').prop('checked',false);
            }
        });
    }

    function selectLocationMasterList() {
        const action = "<%=request.getContextPath()%>/core/main/selectLocationMasterList";

        const form_data = null;

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
            }
        });
    }

    $('#locationCode').on('change', function() {
        autoSearchStatus = false;

        $.fn.selectBoxReset($('#deviceCode'));
        $.fn.selectBoxVisibleCheck($('#deviceCodeDiv'), false);

        $.fn.selectBoxReset($('#sensorCode'));
        $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);

        historyBynUseYnCheck();

        if(this.value != "") {
            selectDeviceMasterList();
        }

        selectAlarmMasterList();
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
            }
        });
    }

    $('#deviceCode').on('change', function() {
        $.fn.selectBoxReset($('#sensorCode'));
        $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);

        historyBynUseYnCheck();

        if(this.value != "") {
            selectSensorMasterList();
        }

        selectAlarmMasterList();
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
            }
        });
    }

    $('#sensorCode').on('change', function() {
        historyBynUseYnCheck();

        selectAlarmMasterList();
    });

    $('#alarmStatus').on('change', function() {
        selectAlarmMasterList();
    });

    function historyBynUseYnCheck() {
        const sensorCode = $('#sensorCode').val();

        console.log(sensorCode);
        if(sensorCode != null && sensorCode != "") {
            $.fn.selectBoxVisibleCheck($('#selectAlarmHistoryBtnDiv'), true);

            if($("#confirmAlarmListBtnDiv").hasClass("col-12") === true) {
                $("#confirmAlarmListBtnDiv").removeClass('col-12');
            }

            $("#confirmAlarmListBtnDiv").addClass('col-6');
        } else {
            $.fn.selectBoxVisibleCheck($('#selectAlarmHistoryBtnDiv'), false);

            if($("#confirmAlarmListBtnDiv").hasClass("col-6") === true) {
                $("#confirmAlarmListBtnDiv").removeClass('col-6');
            }

            $("#confirmAlarmListBtnDiv").addClass('col-12');
        }
    }

    $("#confirmAlarmListBtn").click(function() {
        const alarmCodeList = new Array();
        const checkbox = $("input[name=alarmListCheck]:checked");

        if(checkbox.length == 0) {
            alarmPopUp(2, "알람 목록을 선택하지 않았습니다. <br>알람 목록 선택 후 다시 시도해주세요.", "");

            return;
        } else {
            confirmPopUp("알람 정보 확인", "알람 정보를 확인 하시겠습니까?", function() {
                checkbox.each(function (i) {
                    const tr = checkbox.parent().parent().eq(i);
                    const td = tr.children();

                    const alarmCode = td.eq(6).text();

                    alarmCodeList.push({"alarmCode": alarmCode, "updateUser": $("#mainSessionUserId").val()});
                });

                confirmAlarmList(JSON.stringify(alarmCodeList));
            });
        }
    });

    $("#selectAlarmHistoryBtn").click(function() {
        const locationCode = $("#locationCode").val();
        const deviceCode = $("#deviceCode").val();
        const sensorCode = $("#sensorCode").val();

        window.location = "/SSMEdge/turck/admin/alarmManagement/historyPage?locationCode="+locationCode+"&deviceCode="+deviceCode+"&sensorCode="+sensorCode;
    });

    function confirmAlarmList(alarmCodeList) {
        loadingStart("알람 확인 중 입니다. 잠시만 기다려주세요.");

        const action = "<%=request.getContextPath()%>/turck/admin/alarmManagement/confirmAlarmList";

        const form_data = {
            alarmCodeList: alarmCodeList
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
                alarmPopUp(2, "알람 확인 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
                selectAlarmMasterList();

                loadingEnd();
            }
        });
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
