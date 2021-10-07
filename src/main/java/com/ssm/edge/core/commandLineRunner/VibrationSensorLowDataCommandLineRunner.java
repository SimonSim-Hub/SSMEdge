package com.ssm.edge.core.commandLineRunner;

import com.ssm.edge.core.main.dao.MainDAO;
import com.ssm.edge.core.main.service.MainService;
import com.ssm.edge.core.main.vo.TagLowDataThreadDelayVO;
import com.ssm.edge.core.main.vo.VibrationSensorLowDataVO;
import com.ssm.edge.core.util.ConvertUtil;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Component
public class VibrationSensorLowDataCommandLineRunner implements CommandLineRunner {

    @Resource(name = "mainService")
    public MainService mainService;

    @Resource(name = "mainDAO")
    public MainDAO mainDAO;

    @Override
    public void run(String... args) throws Exception {
        SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss.SSS");

        new Thread(() -> {
            while (true) {

                try {
                    TagLowDataThreadDelayVO tagLowDataThreadDelayVO = new TagLowDataThreadDelayVO();

                    tagLowDataThreadDelayVO = mainDAO.selectTagLowDataThreadDelay();

                    int delay = tagLowDataThreadDelayVO.getTimerDelay();

                    if(delay > 0) {
                        String minDate_String = mainService.selectTagLowDataMinDate();

                        if(minDate_String != null && minDate_String != "") {

                            if(minDate_String.length() == 19) {
                                minDate_String = minDate_String + ".000";
                            }

                            long minDate_Long = ConvertUtil.stringToLong(format, minDate_String);

                            long startDate_Long = minDate_Long;
                            long endDate_Long = System.currentTimeMillis();

                            Date currentDate = new Date();

                            long currentDate_Long = ConvertUtil.dateTolong(format, currentDate);

                            Date startDate = ConvertUtil.longToDate(startDate_Long);
                            Date endDate = ConvertUtil.longToDate(endDate_Long);

                            if(startDate != null) {
                                if(endDate != null) {
                                    VibrationSensorLowDataVO vibrationSensorLowDataVO = new VibrationSensorLowDataVO();

                                    vibrationSensorLowDataVO.setStartDate(startDate);
                                    vibrationSensorLowDataVO.setEndDate(endDate);

                                    List<VibrationSensorLowDataVO> vibrationSensorLowDataGrouppingList = mainService.vibrationSensorLowDataGrouppingList(vibrationSensorLowDataVO);

                                    if(vibrationSensorLowDataGrouppingList != null) {
                                        for (int i = 0; i < vibrationSensorLowDataGrouppingList.size(); i++) {
                                            VibrationSensorLowDataVO insertVibrationSensorLowDataVO = new VibrationSensorLowDataVO();

                                            insertVibrationSensorLowDataVO = vibrationSensorLowDataGrouppingList.get(i);

                                            insertVibrationSensorLowDataVO.setOTime(endDate);
                                            insertVibrationSensorLowDataVO.setStartDate(startDate);
                                            insertVibrationSensorLowDataVO.setEndDate(endDate);

                                            mainService.insertVibrationSensorLowDataGrouppingList(insertVibrationSensorLowDataVO);
                                        }
                                    }
                                }
                            }
                        }

                        Thread.sleep(delay);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();

    }
}
