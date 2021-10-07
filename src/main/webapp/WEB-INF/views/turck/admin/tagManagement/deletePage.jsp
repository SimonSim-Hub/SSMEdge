<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
<head>
    <base href="./">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

    <title>태그 목록 삭제</title>

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
                        <h1 class="m-0">태그 목록 삭제</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/core/main/dashboardPage">홈</a></li>
                            <li class="breadcrumb-item active">태그 삭제</li>
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
                        <form id="deleteTagMasterListForm" action="<%=request.getContextPath()%>/turck/admin/tagManagement/deleteTagMasterList" method="post">
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
                                    <div id="sensorCodeDiv" class="form-group row">
                                        <label for="sensorCode" class="col-sm-3 col-form-label">센서 :</label>
                                        <div class="col-sm-9">
                                            <select id="sensorCode" class="form-control">
                                                <option value="">- 센서 선택 -</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="tagName" class="col-sm-3 col-form-label">태그 :</label>
                                        <div class="col-sm-9">
                                            <input id="tagName" autocomplete="off" type="text" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </form>
                        <a id="deleteTagMasterListBtn" class="btn btn-danger btn-block mb-3">태그 목록 삭제</a>
                    </div>
                    <div class="col-9">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">사용자 목록</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="tagMasterList" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th><input name="select_all" value="1" id="selectBoxTr-select-all" type="checkbox" /></th>
                                        <th>NO</th>
                                        <th>태그번호</th>
                                        <th>로케이션</th>
                                        <th>로케이션코드</th>
                                        <th>디바이스</th>
                                        <th>디바이스코드</th>
                                        <th>센서</th>
                                        <th>센서코드</th>
                                        <th>타입</th>
                                        <th>태그코드</th>
                                        <th>태그</th>
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
            commonIncludeLeftMenuImageChange("Parents", "tagManagement");
            commonIncludeLeftMenuImageChange("Child", "tagManagementDeletePage");

            $.fn.selectBoxVisibleCheck($('#deviceCodeDiv'), false);
            $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);

            selectLocationMasterList();
        });

        const table = $("#tagMasterList").DataTable({
            responsive: true,
            lengthChange: false,
            autoWidth: false,
            language: lang_kor,
            columns: [
                {data: null},
                {data: "rowNum"},
                {data: "tagNo"},
                {data: "locationName"},
                {data: "locationCode"},
                {data: "deviceName"},
                {data: "deviceCode"},
                {data: "sensorName"},
                {data: "sensorCode"},
                {data: "tagType"},
                {data: "tagCode"},
                {data: "tagName"}
            ],
            columnDefs: [
                {
                    searchable:false,
                    targets: 0,
                    width: "2%",
                    orderable: false,
                    className: 'dt-body-center',
                    render: function (data, type, full, meta){
                        return '<input type="checkbox" name="tagMasterListCheck" value="' + $('<div/>').text(data).html() + '">';
                    }
                },
                {targets: 1, width: "8%", className: "text-center"},
                {targets: 9, width: "8%", className: "text-center"},
                {targets: [3, 5, 7], width: "14%", className: "text-center"},
                {targets: 10, width: "20%", className: "text-center"},
                {targets: 11, width: "26%", className: "text-center"},
                {targets: [2, 4, 6, 8], "visible": false}
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

    $('#tagName').keyup(function() {
        selectTagMasterList();
    });

    function selectTagMasterList() {
        const action = "<%=request.getContextPath()%>/turck/admin/tagManagement/selectTagMasterList";

        const form_data = {
            tagName: $("#tagName").val(),
            sensorCode: $("#sensorCode").val(),
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
                    const tagMasterList = resultData.tagMasterList;

                    addList($('#tagMasterList'), tagMasterList);
                }
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "태그 목록 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
                $('#selectBoxTr-select-all').prop('checked',false);
            }
        });
    }

    function selectLocationMasterList() {
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
                selectTagMasterList();
            }
        });
    }

    $('#locationCode').on('change', function() {
        $.fn.selectBoxReset($('#deviceCode'));
        $.fn.selectBoxVisibleCheck($('#deviceCodeDiv'), false);

        $.fn.selectBoxReset($('#sensorCode'));
        $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);

        if(this.value != "") {
            selectDeviceMasterList();
        } else {

            selectTagMasterList();
        }
    });

    function selectDeviceMasterList() {
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
                selectTagMasterList();
            }
        });
    }

    $('#deviceCode').on('change', function() {
        $.fn.selectBoxReset($('#sensorCode'));
        $.fn.selectBoxVisibleCheck($('#sensorCodeDiv'), false);

        if(this.value != "") {
            selectSensorMasterList();
        } else {
            selectTagMasterList();
        }
    });

    function selectSensorMasterList() {
        const action = "<%=request.getContextPath()%>/turck/admin/sensorManagement/selectSensorMasterList";

        const form_data = {
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
                selectTagMasterList();
            }
        });
    }

    $('#sensorCode').on('change', function() {
        selectTagMasterList();
    });

    $("#deleteTagMasterListBtn").click(function() {
        const tagMasterList = new Array();
        const checkbox = $("input[name=tagMasterListCheck]:checked");

        if(checkbox.length == 0) {
            alarmPopUp(2, "태그 목록을 선택하지 않았습니다. <br>태그 목록 선택 후 다시 시도해주세요.", "");

            return;
        } else {
            confirmPopUp("태그 정보 삭제", "태그 정보를 삭제 하시겠습니까?", function() {
                checkbox.each(function (i) {
                    const tr = checkbox.parent().parent().eq(i);
                    const td = tr.children();

                    const tagCode = td.eq(6).text();

                    tagMasterList.push({"tagCode": tagCode});
                });

                deleteTagMasterList(JSON.stringify(tagMasterList));
            });
        }
    });

    function deleteTagMasterList(tagMasterList) {
        loadingStart("태그 정보 삭제 중 입니다. 잠시만 기다려주세요.");

        const action = $("#deleteTagMasterListForm").attr('action');

        const form_data = {
            tagMasterList: tagMasterList
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
                alarmPopUp(2, "태그 마스터 삭제 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
                selectTagMasterList();

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
