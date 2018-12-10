<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
</head>
<body>

<h1>글 목록</h1>
<hr>
<form action="list" method="post">
<table border="1">
	<tr>
		<th>글번호</th><th class="nt_num">제목</th><th>관리자</th>
		<th>작성일</th><th>조회수</th><th>IP</th>
	</tr>
<c:choose>
	<c:when test="${not empty list}">
	</c:when>
</c:choose>
</table>
</form>

</body>
</html>