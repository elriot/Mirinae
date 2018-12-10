<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<body>
 <div class="container">
	<div class="row">
		<div class="col-pg-12 col-md-12 mx-auto">  
<H1>문의글보기</H1>
<hr>
<table border="1">
	<tr>
		<th>내용</th><th>문의일시</th><th>답변여부</th>
	</tr>
	<tr>
		<td>${csVO.title}<br>${csVO.content}</td><td>${csVO.reg_date}</td>
			<td>
				<c:choose>
					<c:when test="${csVO.reply eq 'F'}">답변미완료</c:when>
					<c:otherwise>답변완료</c:otherwise>
				</c:choose>
			</td>
	</tr>
	<tr>
		<td>${csVO.reply_content}</td><td>${csVO.reply_date}</td><td></td>
	</tr>
</table>
<input type="button" value="목록" onclick="history.back();">
</div>
</div>
</div>


</body>