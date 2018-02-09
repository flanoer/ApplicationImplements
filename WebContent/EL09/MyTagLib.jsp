<%@page import="eltag.MyTagLib"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="your" uri="/WEB-INF/tlds/mytaglib.tld" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>MyTagLib.jsp</title>
</head>
<body>
	<fieldset>
		<legend>내가 만든 태그 라이브러리</legend>
		<h2>자바코드로 메소드 호출</h2>
		<ul style="list-style-type:upper-roman;">
			<li>MyTagLib.isNumber("100"):<%=MyTagLib.isNumber("100") %></li>
			<li>\${MyTagLib.isNumber("100") } : ${MyTagLib.isNumber("100") }</li>
		</ul>
		<h2>EL에서 자바클래스로 만든 메소드 호출</h2>
		<ul style="list-style-type:upper-roman;">
			<li>\${your:isNumber("100") }:${your:isNumber("100") }</li>
			<li>\${your:isNumber("10a") }:${your:isNumber("10a") }</li>
			<li>\${your:getGender('123456-1234567') }:${your:getGender('123456-1234567') }</li>
			<li>\${your:getGender('123456-2234567') }:${your:getGender('123456-2234567') }</li>
		</ul>
		
	</fieldset>
</body>
</html>