package com.ssm.edge.core.exceptionHandling.service.impl;

import com.ssm.edge.core.exceptionHandling.dao.ExceptionHandlingDAO;
import com.ssm.edge.core.exceptionHandling.service.ExceptionHandlingService;
import com.ssm.edge.core.exceptionHandling.vo.ExceptionHandlingVO;
import com.ssm.edge.core.map.CommonCommandMap;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Service("exceptionHandlingService")
public class ExceptionHandlingServiceImpl implements ExceptionHandlingService {
    @Resource(name="exceptionHandlingDAO")
    public ExceptionHandlingDAO exceptionHandlingDAO;

    String resultStatus = null;
    String resultMessage = null;

    ModelMapper modelMapper = new ModelMapper();

    @Override
    public ModelAndView insertErrorMessage(CommonCommandMap commonCommandMap) {
        ModelAndView mv = new ModelAndView("jsonView");

        ExceptionHandlingVO exceptionHandlingVO = modelMapper.map(commonCommandMap.getMap(), ExceptionHandlingVO.class);

        try {
            exceptionHandlingDAO.insertErrorMessage(exceptionHandlingVO);

            resultStatus = "1";
            resultMessage = "에러 메시지 등록이 완료되었습니다.<br>5초 후 메인 페이지로 이동 합니다.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);
        } catch (Exception e) {
            e.printStackTrace();

            resultStatus = "3";
            resultMessage = "[ERR_EHS_IEM_0001]<br>에러 메시지 등록에 실패하였습니다.<br>관리자에게 문의하세요.";

            mv.addObject("resultStatus", resultStatus);
            mv.addObject("resultMessage", resultMessage);

            return mv;
        }

        mv.addObject("resultStatus", resultStatus);
        mv.addObject("resultMessage", resultMessage);

        return mv;
    }
}
