<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- ImportedNate.jsp -->
<c:import url="http://www.nate.com" var="nate"/>
${fn:replace(nate,"/css/","http://www.nate.com/css/") }