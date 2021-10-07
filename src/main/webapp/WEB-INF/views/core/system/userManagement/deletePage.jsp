<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
<head>
    <base href="./">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

    <title>사용자 정보 삭제</title>

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
                        <h1 class="m-0">사용자 정보 삭제</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/core/main/dashboardPage">홈</a></li>
                            <li class="breadcrumb-item active">사용자 삭제</li>
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
                        <form id="selectUserMasterListForm"
                              action="<%=request.getContextPath()%>/core/system/userManagement/selectUserMasterList"
                              method="post">
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
                        <div class="row">
                            <div class = "col-6">
                                <a id="deleteUserMasterListBtn" class="btn btn-danger btn-block mb-3">사용자 정보 삭제</a>
                            </div>
                            <div class = "col-6">
                                <a id="selectUserMasterListBtn" class="btn btn-primary btn-block mb-3">사용자 목록 조회</a>
                            </div>
                        </div>

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
                                        <th><input name="select_all" value="1" id="example-select-all" type="checkbox" /></th>
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
<!-- Page specific script -->

<!-- Simon -->
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/include/include.js"></script>
<script src="<%=request.getContextPath()%>/resources/ssm/js/common/dataTable/dataTable.js"></script>
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

<script>
    $(function () {
        $(document).ready(function () {
            commonIncludeLeftMenuImageChange("Parents", "userManagement");
            commonIncludeLeftMenuImageChange("Child", "userManagementDeletePage");

            selectUserMasterList();
        });

        const table = $("#userMasterList").DataTable({
            responsive: true,
            lengthChange: false,
            autoWidth: false,
            language: lang_kor,
            columns: [
                {data: null},
                {data: "rowNum"},
                {data: "userName"},
                {data: "userId"},
                {data: "userEmail"},
                {data: "userAuthorityStr"}
            ],
            columnDefs: [
                {
                    searchable:false,
                    orderable:false,
                    targets: 0,
                    width: "2%",
                    className: 'dt-body-center',
                    render: function (data, type, full, meta){
                        return '<input type="checkbox" name="userMasterListCheck" value="'
                            + $('<div/>').text(data).html() + '">';
                    }
                },
                {targets: 1, width: "7%", className: "text-center"},
                {targets: [2, 3], width: "20%", className: "text-center"},
                {targets: 4, width: "30%", className: "text-center"},
                {targets: 5, width: "20%", className: "text-center"}
            ],
            order: [1, 'asc']
        });

        $.fn.dataTable.ext.errMode = "none";

        $('#example-select-all').on('click', function(){
            const rows = table.rows({'search': 'applied'}).nodes();

            $('input[type="checkbox"]', rows).prop('checked', this.checked);
        });

        $('#example tbody').on('change', 'input[type="checkbox"]', function(){
            if(!this.checked){
                const el = $('#example-select-all').get(0);

                if(el && el.checked && ('indeterminate' in el)){
                    el.indeterminate = true;
                }
            }
        });
    });

    $("#selectUserMasterListBtn").click(function () {
        selectUserMasterList();
    });

    function selectUserMasterList() {
        loadingStart("사용자 마스터 조회 중 입니다. 잠시만 기다려주세요.");

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
                const userMasterList = resultData.userMasterList;

                addList($('#userMasterList'), userMasterList);
            },
            error: function (jqXHR, resultData) {
                alarmPopUp(2, "사용자 마스터 조회 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {

                loadingEnd();
            }
        });
    }

    $("#deleteUserMasterListBtn").click(function() {
        const userMasterList = new Array();
        const checkbox = $("input[name=userMasterListCheck]:checked");

        if(checkbox.length == 0) {
            alarmPopUp(2, "사용자 목록을 선택하지 않았습니다. <br>사용자 목록 선택 후 다시 시도해주세요.", "");

            return;
        } else {
            confirmPopUp("사용자 정보 삭제", "사용자 정보를 삭제 하시겠습니까?", function() {
                checkbox.each(function (i) {
                    const tr = checkbox.parent().parent().eq(i);
                    const td = tr.children();

                    const userId = td.eq(3).text();
                    const userEmail = td.eq(4).text();

                    userMasterList.push({"userId": userId, "userEmail": userEmail});
                });

                deleteUserMasterList(JSON.stringify(userMasterList));
            });
        }
    });

    function deleteUserMasterList(userMasterList) {
        loadingStart("사용자 정보 삭제 중 입니다. 잠시만 기다려주세요.");

        const action = "<%=request.getContextPath()%>/core/system/userManagement/deleteUserMasterInfo";

        const form_data = {
            userMasterList: userMasterList
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
                alarmPopUp(2, "사용자 마스터 삭제 중 [" + jqXHR.status + "] 오류가 발생했습니다.<br>관리자에게 문의하세요.", "");
            },
            complete: function () {
                selectUserMasterList();

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
