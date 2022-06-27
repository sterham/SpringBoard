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
    
				<!-- form태그 시작 -->
				<form class="form-horizontal" action="${cpath}/boardInsert.do" method="post">
					<!-- 제목 -->
					<div class="form-group">
						<label class="control-label col-sm-2" for="title">제목:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title"
								placeholder="제목을 입력하세요" name="title">
						</div>
					</div>
					
					<!-- 작성자 -->
					<div class="form-group">
						<label class="control-label col-sm-2" for="writer">작성자:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="writer"
								placeholder="작성자를 입력하세요" name="writer">
						</div>
					</div>
					
					<!-- 내용 -->
					<div class="form-group">
						<label class="control-label col-sm-2" for="content">내용:</label>
						<div class="col-sm-10">
							<textarea rows="10" id="content" class="form-control" name="content"></textarea>
						</div>
					</div>
					
					<!-- submit -->
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">작성하기</button>
						</div>
					</div>
				</form>
				<!-- form태그 끝 -->
				
    </div>
    <div class="panel-footer">지능형 IoT 8차 이설아</div>
  </div>
</div>

</body>
</html>
