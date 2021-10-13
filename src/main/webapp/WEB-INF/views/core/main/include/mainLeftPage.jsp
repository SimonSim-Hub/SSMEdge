<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<input id="mainSessionUserId" type="hidden" class="form-control" type="text" value="<sec:authentication property='principal.userId'/>">
<input id="mainSessionUserName" type="hidden" class="form-control" type="text" value="<sec:authentication property='principal.userName'/>">
<input id="mainSessionUserAuthority" type="hidden" class="form-control" type="text" value="<sec:authentication property='principal.userAuthority'/>">

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="<%=request.getContextPath()%>/core/main/dashboardPage" class="brand-link">
        <img src="<%=request.getContextPath()%>/resources/img/TurckLogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">모니터링 시스템</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="<%=request.getContextPath()%>/resources/img/avatar5.png" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a id="mainUserName" href="javascript:void(0)" class="d-block"></a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li id="dashboardPage" class="nav-item">
                    <a href="<%=request.getContextPath()%>/core/main/dashboardPage" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            대시보드
                            <span id="alarmSensorCount" class="badge badge-danger right">0</span>
                            <span id="warningSensorCount" class="badge badge-warning right">0</span>
                        </p>
                    </a>
                </li>
                <li id="detailPage" class="nav-item">
                    <a href="<%=request.getContextPath()%>/core/main/detailPage" class="nav-link">
                        <i class="nav-icon fas fa-search"></i>
                        <p>
                            상세 정보
                        </p>
                    </a>
                </li>
                <li id="reportPage" class="nav-item">
                    <a href="<%=request.getContextPath()%>/core/main/reportPage" class="nav-link">
                        <i class="nav-icon fas fa-list-alt"></i>
                        <p>
                            이력 조회
                        </p>
                    </a>
                </li>
                <li id="alarmSttingTitle" class="nav-header">알람</li>
                <li id="alarmManagement" class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-bell"></i>
                        <p>
                            알람 관리
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li id="alarmManagementConfirmPage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/alarmManagement/confirmPage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>
                                    알람 확인
                                </p>
                            </a>
                        </li>
                        <li id="alarmManagementHistoryPage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/alarmManagement/historyPage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>
                                    알람 이력 조회
                                </p>
                            </a>
                        </li>
                        <li id="alarmManagementUpdatePage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/alarmManagement/updatePage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>
                                    알람 설정
                                </p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li id="deviceSttingTitle" class="nav-header">장치</li>
                <li id="locationManagement" class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-map-marker-alt"></i>
                        <p>
                            로케이션 관리
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li id="locationManagementSelectPage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/locationManagement/selectPage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>로케이션 조회</p>
                            </a>
                        </li>
                        <li id="locationManagementInsertPage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/locationManagement/insertPage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>로케이션 등록</p>
                            </a>
                        </li>
                        <li id="locationManagementUpdatePage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/locationManagement/updatePage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>로케이션 수정</p>
                            </a>
                        </li>
                        <li id="locationManagementDeletePage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/locationManagement/deletePage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>로케이션 삭제</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li id="deviceManagement" class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-mobile"></i>
                        <p>
                            디바이스 관리
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li id="deviceManagementSelectPage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/deviceManagement/selectPage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>디바이스 조회</p>
                            </a>
                        </li>
                        <li id="deviceManagementUpdatePage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/deviceManagement/updatePage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>디바이스 수정</p>
                            </a>
                        </li>
                        <li id="deviceManagementDeletePage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/deviceManagement/deletePage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>디바이스 삭제</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li id="sensorManagement" class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-podcast"></i>
                        <p>
                            센서 관리
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li id="sensorManagementSelectPage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/sensorManagement/selectPage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>센서 조회</p>
                            </a>
                        </li>
                        <li id="sensorManagementUpdatePage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/sensorManagement/updatePage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>센서 수정</p>
                            </a>
                        </li>
                        <li id="sensorManagementDeletePage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/sensorManagement/deletePage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>센서 삭제</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li id="tagManagement" class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-tag"></i>
                        <p>
                            태그 관리
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li id="tagManagementSelectPage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/tagManagement/selectPage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>태그 조회</p>
                            </a>
                        </li>
                        <li id="tagManagementInsertPage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/tagManagement/insertPage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>태그 등록</p>
                            </a>
                        </li>
                        <li id="tagManagementUpdatePage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/tagManagement/updatePage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>태그 수정</p>
                            </a>
                        </li>
                        <li id="tagManagementDeletePage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/turck/admin/tagManagement/deletePage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>태그 삭제</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li id="userTitle" class="nav-header">사용자</li>
                <li id="userManagement" class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-user"></i>
                        <p>
                            사용자 관리
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li id="userManagementSelectPage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/core/system/userManagement/selectPage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>사용자 조회</p>
                            </a>
                        </li>
                        <li id="userManagementInsertPage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/core/system/userManagement/insertPage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>사용자 등록</p>
                            </a>
                        </li>
                        <li id="userManagementUpdatePage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/core/system/userManagement/updatePage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>사용자 수정</p>
                            </a>
                        </li>
                        <li id="userManagementDeletePage" class="nav-item">
                            <a href="<%=request.getContextPath()%>/core/system/userManagement/deletePage" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>사용자 삭제</p>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>

<script>
    window.addEventListener('DOMContentLoaded', function() {
        let authority = "";

        if($("#mainSessionUserAuthority").val() == "ROLE_SYSTEM") {
            authority = "시스템 관리자";
        } else if($("#mainSessionUserAuthority").val() == "ROLE_ADMIN") {
            $("#userTitle").hide();
            $("#userManagement").hide();

            authority = "관리자";
        } else if ($("#mainSessionUserAuthority").val() == "ROLE_USER") {
            $("#userTitle").hide();
            $("#userManagement").hide();
            $("#alarmManagementUpdatePage").hide();
            $("#deviceSttingTitle").hide();
            $("#locationManagement").hide();
            $("#deviceManagement").hide();
            $("#sensorManagement").hide();
            $("#tagManagement").hide();

            $("#systemSetting").hide();

            authority = "사용자";
        } else if ($("#mainSessionUserAuthority").val() == "ROLE_GUEST") {
            $("#userTitle").hide();
            $("#userManagement").hide();
            $("#alarmManagementUpdatePage").hide();
            $("#deviceSttingTitle").hide();
            $("#locationManagement").hide();
            $("#deviceManagement").hide();
            $("#sensorManagement").hide();
            $("#tagManagement").hide();

            $("#systemSetting").hide();

            authority = "임시사용자";
        }

        $("#warningSensorCount").hide();
        $("#alarmSensorCount").hide();

        selectAlarmSensorCount()

        $("#mainUserName").text($("#mainSessionUserName").val() + " (" + authority + ")");
    });

    function selectAlarmSensorCount() {
        const action = "<%=request.getContextPath()%>/turck/admin/alarmManagement/selectAlarmSensorCount";

        let delay = 2000;
        let threadDelay = 0;

        const form_data = null;

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
                    const warningSensorCount = resultData.warningSensorCount;
                    const alarmSensorCount = resultData.alarmSensorCount;

                    if(warningSensorCount > 0) {
                        $("#warningSensorCount").show();
                        $("#warningSensorCount").text(warningSensorCount);
                    } else {
                        $("#warningSensorCount").hide();
                    }

                    if(alarmSensorCount > 0) {
                        $("#alarmSensorCount").show();
                        $("#alarmSensorCount").text(alarmSensorCount);
                    } else {
                        $("#alarmSensorCount").hide();
                    }

                    threadDelay = resultData.threadDelay;
                }
            },
            error: function (jqXHR, resultData) {
            },
            complete: function () {
                if(threadDelay > delay) {
                    delay = threadDelay;
                }

                setTimeout(function(){
                    selectAlarmSensorCount();
                }, delay);
            }
        });
    }
</script>
