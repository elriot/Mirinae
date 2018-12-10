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
				<h1 class="page-header">Member list</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> <a href="main">Dashboard</a>
					</li>
					<li class="active"><i class="fa fa-table"></i> Member list</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
		<br>
	  <h4>Filter Table</h4>
	  <input class="form-control" id="myInput" type="text" placeholder="Search.."><br>

		<div class="row">
			<div class="col-lg-12">
				<h2>Member List</h2>
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>No.</th>
								<th>아이디</th>
								<th>이름</th>
								<th>이메일</th>
								<th>연락처</th>
								<th>등급</th>
								<th>포인트</th>
								<th>가입일</th>
							</tr>
						</thead>
					    <tbody id="myTable">
						<c:set var="i" value="1"/>
							<c:choose>
								<c:when test="${not empty list}">
									<c:forEach var="m" items="${list}">
										<tr><!-- td 8개 -->
											<td>${i}</td>
											<td>${m.mb_ID}</td>
											<td>${m.mb_name}</td>
											<td>${m.mb_email}</td>
											<td>${m.mb_phone}</td>
											<td>${m.mb_grade}</td>
											<td><fmt:formatNumber value="${m.mb_point}" pattern="###,###,###"/></td>
											<td>
												<fmt:parseDate var="parsed" value="${m.mb_joinDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
												<fmt:formatDate value="${parsed}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</td>
										</tr>
										<c:set var="i" value="${i+1}"/>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="7">데이터가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
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
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
</body>

</html>