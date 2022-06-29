<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	// scope(PageContext, request, session, application)
	// pageContext -> jsp 파일 내에서만 사용
	 // JSP 내장 객체에 attribute를 설정(데이터 저장)
	pageContext.setAttribute("cpath", request.getContextPath());
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
    
    	<table class="table table-hover">
    		<tr>
    			<td>제목 : </td>
    			<td>${vo.title }</td>
    		</tr>
    		<tr>
    			<td>작성자 : </td>
    			<td>${vo.writer }</td>
    		</tr>
    		<tr>
    		
    			<td>내용 : </td>
    			<%-- 내용에 엔터키 적용되게 하는 코드 --%>
    			<%-- ${}안에서 fn 을 사용하면 함수 자동완성 --%>
    			<%-- fn:replace("대상", "변경 전 문자열", "변경 후 문자열") --%>
    			<% pageContext.setAttribute("newLine", "\n");  %>
    			<td>${fn:replace(vo.content, newLine, "<br>" )}</td>
    		</tr>
    		<tr>
    			<td>작성일 : </td>
    			<td>${vo.indate }</td>
    		</tr>
    		<tr>
    		<td colspan="2" align="center">
    			<button onclick="goUpdate('${cpath}', ${vo.idx})" class="btn btn-sm btn-info">수정</button>
    			<button onclick="goDelete('${cpath}', ${vo.idx})" class="btn btn-sm btn-warning">삭제</button>
    			<button onclick="goList('${cpath}')" class="btn btn-sm btn-success">목록</button>
    		</td>
    		</tr>
    	</table>
    	
    </div>
    <div class="panel-footer">지능형 IoT 8차 이설아</div>
  </div>
</div>
<!-- board.js를 찾아갈 수 있는 경로 찾아주기 -->
<script src="${cpath}/resources/js/board.js"></script>
<script type="text/javascript">

</script>
</body>
</html>
