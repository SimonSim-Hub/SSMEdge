<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
<head>
    <base href="./">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=sensor-width, initial-scale=1.0, shrink-to-fit=no">

    <title>센서 목록 조회</title>

    <!-- adminLTE -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/dist/css/adminlte.min.css">
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/fontawesome-free/css/all.min.css">
    <!-- confirm -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/jquery-confirm/dist/css/jquery-confirm.css">
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
                        <h1 class="m-0">센서 목록 조회</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/core/main/dashboardPage">홈</a></li>
                            <li class="breadcrumb-item active">센서 조회</li>
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
                        <form id="selectSensorMasterListForm" action="<%=request.getContextPath()%>/turck/admin/sensorManagement/selectSensorMasterList" method="post">
                            <div class="card card-primary card-outline">
                                <div class="card-header">
                                    <h3 class="card-title">기본 검색조건</h3>
                                </div>
                                <div class="card-body">
                                    <div class="form-group row">
                                        <label for="locationCode" class="col-sm-3 col-form-label">로케이션 :</label>
                                        <div class="col-sm-9">
                                            <select id="locationCode" class="form-control">
                                                <option value="">- 로케이션 선택 -</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="deviceCodeDiv" class="form-group row">
                                        <label for="deviceCode" class="col-sm-3 col-form-label">디바이스 :</label>
                                        <div class="col-sm-9">
                                            <select id="deviceCode" class="form-control">
                                                <option value="">- 디바이스 선택 -</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="sensorName" class="col-sm-3 col-form-label">센서 :</label>
                                        <div class="col-sm-9">
                                            <input id="sensorName" autocomplete="off" type="text" class="form-control enterEvent-selectSensorMasterListBtn">
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </form>
                        <a id="selectSensorMasterListBtn" class="btn btn-primary btn-block mb-3">센서 목록 조회</a>
                    </div>
                    <div class="col-9">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">센서 목록</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="sensorMasterList" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>센서번호</th>
                                        <th>로케이션</th>
                                        <th>로케이션코드</th>
                                        <th>디바이스</th>
                                        <th>디바이스코드</th>
                                        <th>센서경로</th>
                                        <th>센서코드</th>
                                        <th>센서</th>
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
<!-- Page specific script -->

<!-- Simon -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/include/include.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/dataTable/dataTable.js"></script>
<!-- Form 컨트롤 -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/form/formReset.js"></script>

<script>
    $(function () {
        $(document).ready(function () {
            commonIncludeLeftMenuImageChange("Parents", "sensorManagement");
            commonIncludeLeftMenuImageChange("Child", "sensorManagementSelectPage");

            $.fn.selectBoxVisibleCheck($('#deviceCodeDiv'), false);

            selectLocationMasterList();
        });

        const table = $("#sensorMasterList").DataTable({
            responsive: true,
            lengthChange: false,
            autoWidth: false,
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
                {data: "sensorNo"},
                {data: "locationName"},
                {data: "locationCode"},
                {data: "deviceName"},
                {data: "deviceCode"},
                {data: "sensorFullname"},
                {data: "sensorCode"},
                {data: "sensorName"}
            ],
            columnDefs: [
                {targets: 0, width: "4%", className: "text-center"},
                {targets: [2, 4, 7, 8], width: "24%", className: "text-center"},
                {targets: [1, 3, 5, 6], "visible": false}
            ],
            order: [0, 'asc']
        }).buttons().container().appendTo('#sensorMasterList_wrapper .col-md-6:eq(0)');
    });

    $.fn.dataTable.ext.errMode = "none";

    $("#selectSensorMasterListBtn").click(function () {
        selectSensorMasterList(1);
    });

    function selectSensorMasterList(option) {
        loadingStart("센서 목록 조회 중 입니다. 잠시만 기다려주세요.");

        const action = $("#selectSensorMasterListForm").attr('action');

        const form_data = {
            sensorName: $("#sensorName").val(),
            locationCode: $("#locationCode").val(),
            deviceCode: $("#deviceCode").val()
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
                    const sensorMasterList = resultData.sensorMasterList;

                    if(option != 0) {
                        alarmPopUp(resultData.resultStatus, resultData.resultMessage, "");
                    }

                    addList($('#sensorMasterList'), sensorMasterList);
                }
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "센서 목록 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
                loadingEnd();
            }
        });
    }

    function selectLocationMasterList() {
        loadingStart("로케이션 목록 조회 중 입니다. 잠시만 기다려주세요.");

        const action = "<%=request.getContextPath()%>/turck/admin/locationManagement/selectLocationMasterList";

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
                selectSensorMasterList(0);

                loadingEnd();
            }
        });
    }

    $('#locationCode').on('change', function() {
        $("#sensorName").val("");

        if(this.value != "") {
            selectDeviceMasterList();
        } else {
            $.fn.selectBoxReset($('#deviceCode'));

            $.fn.selectBoxVisibleCheck($('#deviceCodeDiv'), false);
        }
    });

    function selectDeviceMasterList() {
        loadingStart("디바이스 목록 조회 중 입니다. 잠시만 기다려주세요.");

        const action = "<%=request.getContextPath()%>/turck/admin/deviceManagement/selectDeviceMasterList";

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

                        for (let i = 0; i < deviceMasterList.length; i++) {
                            const code = deviceMasterList[i].deviceCode;
                            const name = deviceMasterList[i].deviceName;

                            if (i == 0) {
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
                // selectSensorMasterList(0);

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
