/*
 * PerformanceInterceptor
 * 
 * Company: Atomic Axis
 *
 * Author:
 * Gene Fojtik
 *
 * Date:
 * 20120131
/*
 * This code is Copyright (c) 2013 Atomic Axis. All rights reserved.
 * You are not allowed to remember or reproduce anything you read below.
 * 
 */

package com.atomicaxis.ctlg_app.interceptor;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class PerformanceInterceptor implements MethodInterceptor {

	public Object invoke(MethodInvocation method) throws Throwable {
		long startTime = System.currentTimeMillis();
		try {
			Object result = method.proceed();
			return result;
		} finally {
			long endTime = System.currentTimeMillis();
			long executionTime = endTime - startTime;
			System.out.println("Method Name: " + method.getMethod().getName()
					+ " Execution Time:- " + executionTime + " ms");
		}
	}
}