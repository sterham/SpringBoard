<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// scope(PageContext, request, session, application)
	// pageContext -> jsp 파일 내에서만 사용
	 // JSP 내장 객체에 attribute를 설정(데이터 저장)
	pageContext.setAttribute("cpath", "/web");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
<div class="container">
  <h2>SpringMVC01</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판 만들기</div>
    <div class="panel-body">
    
    </div>
    <div class="panel-footer">지능형 IoT 8차 이설아</div>
  </div>
</div>

</body>
</html>
