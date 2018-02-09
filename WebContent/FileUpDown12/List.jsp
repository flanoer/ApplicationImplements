
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>List.jsp</title>
</head>
<body>
	<fieldset>
		<legend>저장된 파일 목록</legend>
		
		<ul	 style="list-style-type:upper-roman;">
			<%
			String saveDirectory = application.getRealPath("/Upload");
			File file = new File(saveDirectory);
			File[] files=file.listFiles();
			for(File f:files){
				String filename=f.getName();
				int filesize=(int)Math.ceil(f.length()/1024.0);
			%>
			<li>파일명:<a href='Download.jsp?filename=<%=URLEncoder.encode(filename,"UTF-8") %>'><%=filename %></a>,크기:<%=filesize %>KB</li>
			<%} %>
		</ul>
	
	</fieldset>
</body>
</html>