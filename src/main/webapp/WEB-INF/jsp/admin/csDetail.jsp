<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>

<title>SB Admin - Bootstrap Admin Template</title>
<%@include file="nav.jsp"%>

<div id="page-wrapper">

	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">건의사항 </h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> <a href="main">Dashboard</a>
					</li>
					<li class="active"><i class="fa fa-table"></i> 1:1 문의사항</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
<div class="row">
<div class="col-lg-12">
	<div class="table-responsive">
		<table class="table table-bordered table-hover">


<form action="reply">

	<tr>
		<th>내용</th><th>문의일시</th><th>답변여부</th>
	</tr>
	<tr>
		<td>[작성자] ${csVO.id}<br>
		[제목] ${csVO.title}</b><br>
		[내용] ${csVO.content}
		<td><fmt:parseDate var="parsed" value="${csVO.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate value="${parsed}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		<td>
			<c:choose>
				<c:when test="${csVO.reply eq 'T'}">답변완료</c:when>	
				<c:otherwise>답변미완료</c:otherwise>	
			</c:choose>
		</td>	
	</tr>
	

	<c:choose>
		<c:when test="${empty csVO.reply_content}">
		<tr>
			<td colspan="3"><textarea class="form-control" name="reply_content" rows="5"></textarea></td>
		</tr> 
		</c:when>
		<c:otherwise>
		<tr>
			<td><i style='font-size:24px; color:blue' class='fab'>&#xf3e6;</i><br>${csVO.reply_content}</td>
			<td>답변일시<br><fmt:parseDate var="parsed2" value="${csVO.reply_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate value="${parsed2}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td></td>
		</tr>
		
		</c:otherwise>
	</c:choose>
</table>
<input type="hidden" name="num" value="${csVO.num}">
<input type="button" class="btn btn" value="목록" onclick="history.back();">
<c:if test="${empty csVO.reply_content}">
	<input type="submit" class="btn btn-primary" value="답글쓰기">
</c:if>
</form>

<!-- 
<form action="reply">
<table border="1">
	<tr>
		<th>내용</th><th>문의일시</th><th>답변여부</th>
	</tr>
	<tr>
		<td>${csVO.title}<br>${csVO.content}</td><td>${csVO.reg_date}</td><td><c:choose>
	<c:when test="${csVO.reply eq 'T'}">답변완료</c:when>	
	<c:otherwise>답변미완료</c:otherwise>	
</c:choose></td>
	</tr>
	<tr>
		<td>${csVO.reply_content}</td><td>${csVO.reply_date}</td>
	</tr>
	<tr>
		<td><textarea name="reply_content"></textarea></td>
	</tr>
</table>
<input type="hidden" name="num" value="${csVO.num}">
<input type="button" value="목록" onclick="history.back();">
<input type="submit" value="답글쓰기">
</form>


 -->


		<!-- /.row -->

	</div>
	<!-- /.container-fluid -->
</div>
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="../startbootstrap-sb-admin-3.3.7/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../startbootstrap-sb-admin-3.3.7/js/bootstrap.min.js"></script>
</body>

</html>


<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<H1>문의글보기</H1>
<hr>
<form action="reply">
<table border="1">
	<tr>
		<th>내용</th><th>문의일시</th><th>답변여부</th>
	</tr>
	<tr>
		<td>${csVO.title}<br>${csVO.content}</td><td>${csVO.reg_date}</td><td><c:choose>
	<c:when test="${csVO.reply eq 'T'}">답변완료</c:when>	
	<c:otherwise>답변미완료</c:otherwise>	
</c:choose></td>
	</tr>
	<tr>
		<td>${csVO.reply_content}</td><td>${csVO.reply_date}</td>
	</tr>
	<tr>
		<td><textarea name="reply_content"></textarea></td>
	</tr>
</table>
<input type="hidden" name="num" value="${csVO.num}">
<input type="button" value="목록" onclick="history.back();">
<input type="submit" value="답글쓰기">
</form>
</body>
</html>

 -->