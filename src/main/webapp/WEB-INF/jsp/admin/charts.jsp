<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(siba);


function pieChart(list) {
	var dataTable = google.visualization.arrayToDataTable(list);
	
	var options = {
			title: '금일 상영 영화 예매 비율'
	};
	
	var objDiv = document.getElementById('pie_chart_div1');
	var chart = new google.visualization.PieChart(objDiv);
	
	chart.draw(dataTable, options);
	
	function selectHandler() {
			var selectedItem = chart.getSelection()[0];
	        var value = dataTable.getValue(selectedItem.row, 0);
	        alert('선택한 항목은 ' + value + ' 입니다.');
		}
	
	google.visualization.events.addListener(chart, 'select', selectHandler);
}

function siba() {
	$.ajax({
		url: '../api/admin/charts', 
		dataType: 'json',
		success: function(list) {
			pieChart(list);
    	}
	});
}
</script>
<%@include file="nav.jsp"%>

<title>SB Admin - Bootstrap Admin Template</title>

<body>
<div id="page-wrapper">
	<div class="container-fluid">
		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">chart </h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> <a href="main">Dashboard</a>
					</li>
					<li class="active"><i class="fa fa-table"></i> chart</li>
				</ol>
			
					<h3 class="panel-title">
						<i class="fa fa-long-arrow-right"></i> 오늘 상영중인 영화의 예매율
					</h3>
				</div>
				<div style="position: absolute; left: 40px; top: 200px; width: 100%; height: 100%;" id="pie_chart_div1" style="width:600px; height:500px;">
				</div>
				<div class="panel-body">
					<div class="flot-chart">
						<div class="flot-chart-content" id="flot-pie-chart"></div>
					</div>
					<div class="text-right">
						<a href="#">View Details <i class="fa fa-arrow-circle-right"></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Morris Charts JavaScript -->
	<script src="js/plugins/morris/raphael.min.js"></script>
	<script src="js/plugins/morris/morris.min.js"></script>
	<script src="js/plugins/morris/morris-data.js"></script>

	<!-- Flot Charts JavaScript -->
	<!--[if lte IE 8]><script src="js/excanvas.min.js"></script><![endif]-->
	<script src="js/plugins/flot/jquery.flot.js"></script>
	<script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script src="js/plugins/flot/jquery.flot.resize.js"></script>
	<script src="js/plugins/flot/jquery.flot.pie.js"></script>
	<script src="js/plugins/flot/flot-data.js"></script>

</body>

</html>