<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<hr/>
<h4>포함된 페이지:ImportedPage.jsp</h4>
<h5>리퀘스트 영역에 저장된 속성값</h5>
\${requestvar} : ${requestvar}
<h5>파라미터로 전달된 값</h5>
<ul>
	<li>\${param.user } :${param.user }</li>
	<li>\${param.pass } :${param.pass }</li>
</ul>
<hr/>