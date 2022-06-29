<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	/경로로 요청하면 index.jsp가 열림 
	조건
	- 이름을 index.jsp로 할 것
	- webapp 폴더에 만들 것

--%>

<%--
방법1. sendRedirect 형태로 페이지 넘기기
<% 
	response.sendRedirect("boardList.do");
%>
 --%>
 
 <%-- 방법2. JSP 액션 태그 사용하기 --%>
 <jsp:forward page="boardList.do"></jsp:forward>
 
</body>
</html>