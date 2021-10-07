<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
<head>
    <base href="./">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

    <title>사용자 목록 조회</title>

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
                        <h1 class="m-0">사용자 목록 조회</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/core/main/dashboardPage">홈</a></li>
                            <li class="breadcrumb-item active">사용자 조회</li>
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
                        <form id="selectUserMasterListForm" action="<%=request.getContextPath()%>/core/system/userManagement/selectUserMasterList" method="post">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">기본 검색조건</h3>
                                </div>
                                <div class="card-body">
                                    <div class="form-group row">
                                        <label for="userName" class="col-sm-3 col-form-label">이름 :</label>
                                        <div class="col-sm-9">
                                            <input id="userName" autocomplete="off" type="text" class="form-control enterEvent-selectUserMasterListBtn">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="userId" class="col-sm-3 col-form-label">아이디 :</label>
                                        <div class="col-sm-9">
                                            <input id="userId" autocomplete="off" type="text" class="form-control enterEvent-selectUserMasterListBtn">
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <div class="card collapsed-card">
                                <div class="card-header">
                                    <h3 class="card-title">추가 검색조건</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse"><i
                                                class="fas fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-group row">
                                        <label for="userEmail" class="col-sm-3 col-form-label">이메일 :</label>
                                        <div class="col-sm-9">
                                            <input id="userEmail" autocomplete="off" type="text" class="form-control enterEvent-selectUserMasterListBtn">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="userAuthority" class="col-sm-3 col-form-label">권한 :</label>
                                        <div class="col-sm-9">
                                            <select id="userAuthority" class="form-control">
                                                <option value="">- 권한 선택 -</option>
                                                <option value="ROLE_SYSTEM">시스템 관리자</option>
                                                <option value="ROLE_ADMIN">관리자</option>
                                                <option value="ROLE_USER">사용자</option>
                                                <option value="ROLE_GUEST">게스트</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </form>
                        <a id="selectUserMasterListBtn" class="btn btn-primary btn-block mb-3">사용자 목록 조회</a>
                    </div>
                    <div class="col-9">
                        <div class="card card-primary card-outline">
                            <div class="card-header">
                                <h3 class="card-title">사용자 목록</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="userMasterList" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>이름</th>
                                        <th>아이디</th>
                                        <th>이메일</th>
                                        <th>권한</th>
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

<script>
    $(function () {
        $(document).ready(function () {
            commonIncludeLeftMenuImageChange("Parents", "userManagement");
            commonIncludeLeftMenuImageChange("Child", "userManagementSelectPage");

            selectUserMasterList(0);
        });

        const table = $("#userMasterList").DataTable({
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
                {data: "userName"},
                {data: "userId"},
                {data: "userEmail"},
                {data: "userAuthorityStr"}
            ],
            columnDefs: [
                {targets: 0, width: "10%", className: "text-center"},
                {targets: [1, 2], width: "20%", className: "text-center"},
                {targets: 3, width: "30%", className: "text-center"},
                {targets: 4, width: "20%", className: "text-center"}
            ],
            order: [0, 'asc']
        }).buttons().container().appendTo('#userMasterList_wrapper .col-md-6:eq(0)');
    })

    $.fn.dataTable.ext.errMode = "none";

    $("#selectUserMasterListBtn").click(function () {
        selectUserMasterList(1);
    });

    function selectUserMasterList(option) {
        if (!$.fn.validate($("#selectUserMasterListForm"))) {
            return false;
        } else {
            loadingStart("사용자 마스터 조회 중 입니다. 잠시만 기다려주세요.");
        }

        const action = $("#selectUserMasterListForm").attr('action');


        const form_data = {
            userId: $("#userId").val(),
            userName: $("#userName").val(),
            userEmail: $("#userEmail").val(),
            userAuthority: $("#userAuthority").val()
        };

        $.ajax({
            type: "POST",
            url: action,
            data: form_data,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (resultData) {
                console.log(resultData);
                if(resultData != null) {
                    const userMasterList = resultData.userMasterList;

                    if(option != 0) {
                        alarmPopUp(resultData.resultStatus, resultData.resultMessage, "");
                    }

                    addList($('#userMasterList'), userMasterList);
                }
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "사용자 마스터 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
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
