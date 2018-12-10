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


<title>SB Admin - Bootstrap Admin Template</title>
<%@include file="nav.jsp"%>

<div id="page-wrapper">

	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Notice</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> <a href="main">Dashboard</a>
					</li>
					<li class="active"><i class="fa fa-table"></i> Notice</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
		<div class="container">
			<div class="row">
				<div class="col-pg-8 col-md-10 mx-auto">
					<!-- List Content -->

					<table class="table table-hover">
						<tr>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
						<c:choose>
							<c:when test="${not empty list}">
								<c:forEach var="notice" items="${list}">
									<tr>
										<td>${notice.nt_num}</td>
										<td><a
											href="noticeContent?nt_num=${notice.nt_num}&pageNum=${page.pageNum}">${notice.nt_subject}</a></td>
										<td>${notice.nt_writeDate}</td>
										<td>${notice.nt_readCount}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">게시판 글 없음</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>


					<c:if test="${page.count gt 0}">
						<ul class="pagination">
							<%-- [이전] --%>
							<c:if test="${page.startPage gt page.pageBlock}">
								<li class="page-item"><a class="page-link"
									href="noticeList?pageNum=${page.startPage - page.pageBlock}">Previous</a></li>
							</c:if>
							<%-- 1~10 페이지블록 범위 출력 --%>
							<c:forEach var="i" begin="${page.startPage}"
								end="${page.endPage}" step="1">
								<c:choose>
									<c:when test="${i eq page.pageNum}">
										<li class="page-item"><a class="page-link"
											href="noticeList?pageNum=${i}"><b>${i}</b></a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="noticeList?pageNum=${i}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<%-- [다음] --%>
							<c:if test="${page.endPage lt page.pageCount}">
								<li class="page-item"><a class="page-link"
									href="noticeList?pageNum=${page.startPage + page.pageBlock}">Next</a></li>
								<%--  <a href="list?pageNum=${page.startPage + page.pageBlock}">[다음]</a> --%>
							</c:if>
						</ul>
					</c:if>
				</div>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container-fluid -->

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