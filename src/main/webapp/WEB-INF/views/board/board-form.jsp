<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/board/board-form.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/navBar.jsp" %>
	<form action="/board/board-form" method="post" enctype="multipart/form-data" >
		<input name="category" value="${category}" type="hidden">
		<br><br>
		<div class="board_wrap">
	        <div class="board_title">
	            <strong><c:out value="${title}"></c:out>게시판</strong>
	            <p>이곳은 공유정보를 공유하는 것 입니다.</p>
	        </div>
	        <div class="board_write_wrap">
	            <div class="board_write">
	                <div class="title">
	                    <dl>
	                        <dt>제목</dt>
	                        <dd><input type="text" placeholder="제목 입력" name="bdTitle"></dd>
	                    </dl>
	                </div>
	                <div class="info">
	                    <dl>
							<dt>파일 첨부</dt>
							<dd><input type="file" class="btn" multiple name="files"></dd>
	                    </dl>
	                </div>
	                <div class="cont">
	                    <textarea placeholder="내용 입력" name="content"></textarea>
	                </div>
	            </div>
	            <div class="bt_wrap">
	                <button type="submit" class="on">등록</button>
	                <a href="list.html">취소</a>
	            </div>
	        </div>
	    </div>
    </form>
</body>
</html>