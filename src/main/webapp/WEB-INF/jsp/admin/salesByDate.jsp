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
				<h1 class="page-header">Sales</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> <a href="main">Dashboard</a>
					</li>
					<li class="active"><i class="fa fa-table"></i> Sales &nbsp; / ${bk_date}</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
		<br>
		
		<form action="salesByDate" method="post">
			<input type="hidden" name="max" value="${max}"/>
			<div class="form-group">
		 	<input type="date" min="2018-01-01" max="${max}"name="bk_date">	
		 	<input class="btn btn-primary" type="submit" value="선택"/>
			</div> 
		</form>
		<br>		
	
		<c:if test="${not empty list}">
	  		<h4>Filter Table</h4>
	  		<input class="form-control" id="myInput" type="text" placeholder="Search.."><br>
	    </c:if>


		<div class="row">
			<div class="col-lg-12">
				<h2>${bk_date} 매출</h2>
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>No.</th>
								<th>예약번호</th>
								<th>회원ID</th>
								<th>예약일시</th>
								<th>영화제목</th>
								<th>상영관</th>
								<th>좌석</th>
								<th>매출</th>															
							</tr>
						</thead>
					    <tbody id="myTable">
						<c:set var="i" value="1"/>
						<c:set var="total" value="0"/>
							<c:choose>
								<c:when test="${not empty list}">
									<c:forEach var="list" items="${list}">
										<tr><!-- td 8개 -->
											<td>${i}</td>
											<td>${list.bk_num}</td>
											<td>${list.mb_ID}</td>
											<td>${list.bk_date}</td>
											<td>${list.mv_title}</td>
											<td>${list.tt_num}</td>
											<td>${list.tt_seatNum}</td>
											<td> <fmt:formatNumber value="${list.bk_price}" pattern="###,###,###"/></td>											
										</tr>
										<c:set var="i" value="${i+1}"/>
										<c:set var="total" value="${total+list.bk_price}"/>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="8">매출 정보가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
						<tfoot>
							<tr>
								<c:if test="${not empty list}">
									<td colspan="6"></td>
									<td><b>총 매출</b></td>
									<td><b><fmt:formatNumber value="${total}" pattern="###,###,###"/></b></td>
								</c:if>								
							</tr>						
						</tfoot>
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