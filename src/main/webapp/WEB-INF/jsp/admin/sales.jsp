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
					<li class="active"><i class="fa fa-table"></i> Sales</li>
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