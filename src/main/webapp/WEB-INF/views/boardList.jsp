<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- table에 테두리 넣고 싶으면 class 안에 table-bordered 넣기 -->
    	<table class="table table-bordered table-hover">
    		<thead>
    			<tr>
    				<td>글번호</td>
    				<td>제목</td>
    				<td>작성자</td>
    				<td>작성일</td>
    				<td>조회수</td>
    			</tr>
    		</thead>
    		
    		<tbody>
    		<!-- foreach문으로 tbody에 데이터 집어넣기 -->
    			<!-- request 영역에 있는 list를 items에, items에서 가져온 데이터 담아줄 변수를 var에 집어넣기 -->
    			<c:forEach items="${list}" var="vo">
    			<tr>
    				<td>${vo.idx }</td>
    				<!-- url?name=value&___%__... -->
    				<td><a href="${cpath}/boardContent.do?idx=${vo.idx}">${vo.title }</a></td>
    				<!-- /web/baordContent.do?idx=${vo.idx}의 /web/을 자동으로 생성(pageContext 속성 반드시 같이! -->
    				<td>${vo.writer }</td>
    				<td>${vo.indate }</td>
    				<td>${vo.count }</td>
    			</tr>
    			</c:forEach>
    		</tbody>
    	</table>
    
    	<!-- 글작성 버튼 : 누르면 boardForm.jsp로 이동하기 -->
    	<!-- jsp가 WEB-INF 안에 있기 때문에 boardForm.jsp로 바로 들어가면 404 오류가 난다. boardForm.do로 매핑해주기 -->
    	<button onclick="window.location.href='${cpath}/boardForm.do'" class="btn btn-sm btn-success">글작성</button>
    	<!-- /web//boardForm.do의 /web/을 자동으로 생성(pageContext 속성 반드시 같이! -->
    </div>
    <div class="panel-footer">지능형 IoT 8차 이설아</div>
  </div>
</div>

</body>
</html>
