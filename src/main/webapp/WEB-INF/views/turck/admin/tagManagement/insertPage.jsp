<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
<head>
    <base href="./">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

    <title>태그 정보 등록</title>

    <!-- adminLTE -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/adminLTE/dist/css/adminlte.min.css">
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/plugins/adminLTE/plugins/fontawesome-free/css/all.min.css">
    <!-- 알람 팝업 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/toastr-master/dist//css/toastr.css">
    <!-- confirm -->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/resources/plugins/jquery-confirm/dist/css/jquery-confirm.css">
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
                        <h1 class="m-0">태그 정보 등록</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/core/main/dashboardPage">홈</a></li>
                            <li class="breadcrumb-item active">태그 등록</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">태그 정보</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="tagMasterList" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
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
<!-- jquery-confirm -->
<script src="<%=request.getContextPath()%>/resources/plugins/jquery-confirm/dist/js/jquery-confirm.js"></script>
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
            commonIncludeLeftMenuImageChange("Parents", "tagManagement");
            commonIncludeLeftMenuImageChange("Child", "tagManagementInsertPage");

            selectTagMasterList();
        });

        const table = $("#tagMasterList").DataTable({
            responsive: true,
            lengthChange: false,
            autoWidth: false,
            language: lang_kor,
            buttons: [
                {
                    text: '엑셀 업로드',
                    action: function (e, dt, node, config) {
                        tagMasterListExcelUpload();
                    },
                    className: 'btn btn-success btn-block'
                }
            ],
            columns: [
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
                {targets: 0, width: "4%", className: "text-center"},
                {targets: 8, width: "8%", className: "text-center"},
                {targets: [2, 4, 6], width: "14%", className: "text-center"},
                {targets: 9, width: "20%", className: "text-center"},
                {targets: 10, width: "26%", className: "text-center"},
                {targets: [1, 3, 5, 7], "visible": false}
            ],
            order: [0, 'asc']
        }).buttons().container().appendTo('#tagMasterList_wrapper .col-md-6:eq(0)');

        $.fn.dataTable.ext.errMode = "none";
    });

    function selectTagMasterList() {
        loadingStart("태그 정보 목록 조회 중 입니다. 잠시만 기다려주세요.");

        const action = "<%=request.getContextPath()%>/turck/admin/tagManagement/selectTagMasterList";

        const form_data = {
            tagName: $("#tagName").val(),
            locationCode: $("#locationCode").val(),
            deviceCode: $("#deviceCode").val(),
            tagGroupCode: $("#tagGroupCode").val(),
            tagType: $("#tagType").val(),
            createUser: $("#mainSessionUserId").val()
        };

        $.ajax({
            type: "POST",
            url: action,
            data: form_data,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (resultData) {
                if (resultData != null) {
                    const tagMasterList = resultData.tagMasterList;

                    addList($('#tagMasterList'), tagMasterList);
                }
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "태그 정보 목록 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
                loadingEnd();
            }
        });
    }

    function tagMasterListExcelDownload() {
        const f = document.tagMasterExcelDownLoadForm;
        f.action = "<%=request.getContextPath()%>/core/tag/tagMasterExcelDownload";
        f.submit();
    };

    function tagMasterListExcelUpload() {
        const title = '태그 정보 엑셀 업로드';
        const content = '' +
            '<form id="tagMasterListExcelUploadForm" action="<%=request.getContextPath()%>/turck/admin/tagManagement/tagMasterListExcelUpload" method="post" enctype="multipart/form-data">' +
            '   <input id = "tagMasterListExcelUploadFile" name="tagMasterListExcelUploadFile" type="file">' +
            '</form>';
        const buttonTitle = "업로드";

        const commonCodeMasterExcelUpdateModal = promptPopUp(title, content, buttonTitle, 'col-md-4', function() {
            const nullCheckStr = document.getElementById("tagMasterListExcelUploadFile").value;

            if(nullCheckStr.length > 0) {
                loadingStart("태그 목록 업로드 중입니다. 잠시만 기다려주세요.");
            } else {
                alarmPopUp (2, "파일이 선택되지 않았습니다.", "");

                return false;
            }

            const action = $("#tagMasterListExcelUploadForm").attr('action');

            let form_data = new FormData(document.getElementById("tagMasterListExcelUploadForm"));

            $.ajax({
                type: "POST",
                url: action,
                data: form_data,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (resultData) {
                    alarmPopUp(resultData.resultStatus, resultData.resultMessage, "");
                },
                error: function (jqXHR, resultData) {
                    alert(resultData);
                    alarmPopUp(2, "공통 코드 목록 엑셀 업로드 중 : " + jqXHR.status + " 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
                },
                complete: function () {
                    selectTagMasterList();

                    loadingEnd();
                }
            });
        });
    };

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
