<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//장바구니에 담은 상품 코드 받기]
	String[] products=request.getParameterValues("cart");
	//상품코드를 쿠키로 설정]
	for(String productCode:products){
		Cookie cookie = new Cookie(productCode,productCode);
		cookie.setPath(request.getContextPath());
		//응답헤더에 설정
		response.addCookie(cookie);
	}
	
	response.sendRedirect("CookieExamCartResult.jsp");
	
%>
