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
					<table class="table">
						<tr>
							<th>글번호</th>
							<td>${noticeVO.nt_num}</td>
							<th>작성일</th>
							<td>${noticeVO.nt_writeDate}</td>
							<th>조회수</th>
							<td>${noticeVO.nt_readCount}</td>
						</tr>
						<tr>
							<td colspan="6" class="text-center"><b>${noticeVO.nt_subject}</b></td>
						</tr>
						<tr>
							<td colspan="6">${noticeVO.nt_content}</td>
						</tr>
						<tr>
							<td colspan="6"><c:if
									test="${sessionScope.mb_ID eq 'admin'}">
									<input type="button" value="글수정" class="btn btn-warning"
										onclick="location.href='noticeUpdate?nt_num=${noticeVO.nt_num}&pageNum=${param.pageNum}'">
									 <input type="button" value="글삭제" class="btn btn-danger"
										onclick="location.href='noticeDelete?nt_num=${noticeVO.nt_num}&pageNum=${param.pageNum}'"> 
<%-- 									<a href="noticeDelete?nt_num=${noticeVO.nt_num}&pageNum=${param.pageNum}'"
									class="btn btn-danger" role="button" onclick="return confirm('정말 삭제하시겠습니까?')">글삭제</a> --%>
								</c:if> <input type="button" class="btn btn-primary float-left"
								value="글목록"
								onclick="location.href='list?pageNum=${param.pageNum}'">
							</td>
						</tr>
					</table>
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