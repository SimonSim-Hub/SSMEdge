package com.ssm.edge.core.commandLineRunner;

import com.ssm.edge.core.main.service.MainService;
import com.ssm.edge.core.main.service.impl.MainServiceImpl;
import com.ssm.edge.turck.admin.alarmManagement.dao.AlarmManagementDAO;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;

@Component
public class VibrationSensorPostgresqlCommandLineRunner implements CommandLineRunner {

    @Resource(name = "mainService")
    public MainService mainService;

    @Resource(name = "alarmManagementDAO")
    public AlarmManagementDAO alarmManagementDAO;

    @Override
    public void run(String... args) throws Exception {

        SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss.SSS");

        new Thread(() -> {
            mainService.deleteVibrationSensorLowDataHotListAll();

            mainService.resetVibrationSensorMemoryAlarmList();
        }).start();
    }
}
