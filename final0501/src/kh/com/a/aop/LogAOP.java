package kh.com.a.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class LogAOP {
	
	@Around("within(kh.com.a.dao.impl.*)")
	public Object loggerAop(ProceedingJoinPoint joinpoint)throws Throwable {
		
		String signatureStr = joinpoint.getSignature().toShortString();
//		System.out.println(signatureStr + " 시작");
		
		// 공통 기능
//		System.out.println("실행전:" + System.currentTimeMillis());
		
		try {
			
			System.out.println("[loggerAop] " + signatureStr + " 메소드 실행");
			
			Object obj = joinpoint.proceed();	// 핵심기능 실행
			return obj;
		}finally {
//			System.out.println("실행후:" + System.currentTimeMillis());
			
//			System.out.println(signatureStr + " 종료");
		}
		
	}

}








