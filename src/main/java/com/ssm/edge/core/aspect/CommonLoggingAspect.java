package com.ssm.edge.core.aspect;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

// import org.slf4j.Logger;
// import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Slf4j
@Aspect
@Component
public class CommonLoggingAspect {
    // private static final Logger logger = LoggerFactory.getLogger(CommonLoggingAspect.class);

    static String name = "";
    static String type = "";

    @Around("execution(* com.ssm.edge..controller.*Controller.*(..)) || execution(* com.ssm.edge..service.impl.*Impl.*(..)) || execution(* com.ssm.edge..dao.*DAO.*(..))")
    public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {

        type = joinPoint.getSignature().getDeclaringTypeName();

        if (type.indexOf("Controller") > -1) {
            name = "[SIMON_LOG] [Controller] [Info] ";
        }
        else if (type.indexOf("Service") > -1) {
            name = "[SIMON_LOG] [Service] [Info] ";
        }
        else if (type.indexOf("DAO") > -1) {
            name = "[SIMON_LOG] [DAO] [Info] ";
        } else {
            name = "[SIMON_LOG] [SYSTEM] [Info] ";
        }

        // logger.info(name + type + "." + joinPoint.getSignature().getName() + "()");

        return joinPoint.proceed();
    }
}