package com.bbs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	//返回值：表示我们是否需要将当前的请求拦截下来
	//     true：表示继续执行请求接下来的动作
	//    false：表示执行完preHandle方法后，请求将被终止
	//   参数Object handler：表示当前被拦截的请求的对象
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("执行preHandle方法。。。");
		return true;
	}

	
	//可以通过ModelandView参数来改变显示的视图，或者修改发往视图的方法
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("执行postHandle方法。。。");
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("执行afterCompletion方法。。。");
		
	}

}
