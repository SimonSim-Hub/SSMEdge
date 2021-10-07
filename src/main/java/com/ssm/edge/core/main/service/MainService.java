package com.ssm.edge.core.main.service;

import com.ssm.edge.core.main.vo.VibrationSensorLowDataVO;
import com.ssm.edge.core.map.CommonCommandMap;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

public interface MainService {
    // 메인 센서 차트 데이터 조회
    ModelAndView selectSensorMainChartData(CommonCommandMap commonCommandMap);
    // 로우 테이블 시작 시간 조회
    String selectTagLowDataMinDate();
    // 태그 로우 데이터 그루핑 리스트 조회 (Postgresql)
    List<VibrationSensorLowDataVO> vibrationSensorLowDataGrouppingList(VibrationSensorLowDataVO tagLowDataVO);
    // 태그 로우 데이터 그루핑 리스트 등록 삭제 (Mssql -> Postgresql)
    void insertVibrationSensorLowDataGrouppingList(VibrationSensorLowDataVO insertVibrationSensorLowDataVO);
    // 센서 이력 마지막 N건 조회
    ModelAndView selectVibrationSensorLowDataLastCountList(CommonCommandMap commonCommandMap);
    // 스레드 딜레이 조회
    ModelAndView selectThreadDelay(CommonCommandMap commonCommandMap);
    // 로케이션, 디바이스, 센서 마스터 코드 조회
    ModelAndView selectMasterCode(CommonCommandMap commonCommandMap);
    // 센서 기간 별 리포트 데이터 조회
    ModelAndView selectVibrationSensorReportDataList(CommonCommandMap commonCommandMap);
    // 데이터 카운트 조회 1000개 이상이면 일괄 처리
    int selectVibrationSensorLowDataCount();
    // 시스템 설정 조회
    ModelAndView selectSystemSetting(CommonCommandMap commonCommandMap);
    // 시스템 설정 변경
    ModelAndView updateSystemSetting(CommonCommandMap commonCommandMap);
}
