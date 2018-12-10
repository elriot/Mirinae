<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@include file="../header.jsp"%>
  <div class="container">
	<div class="row">
		<div class="col-pg-12 col-md-12 mx-auto">  
 <div id="page-wrapper">

	<div class="container-fluid">

<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">상영시간표</h1>
			
			</div>
		</div>
		<!-- /.row -->
		<br>



<form action="scheduleAll" method="post">
			<div class="form-group">	
		 	<input type="date" min="${min }" max="${max }"name="pickDate">
		 	<input type="hidden" name="min" value="${min }">
		 	<input type="hidden" name="max" value="${max }">
		 	<input class="btn btn-primary" type="submit" value="선택"/>
			</div>
		</form>
					
<br>
<input class="form-control" id="myInput" type="text" placeholder="영화 제목을 입력하세요">
<br>
상영일 : ${pickDate}<br>
<table class="table table-bordered table-hover" style="text-align: center; vertical-align: middle">
	<thead class="thead-dark">
		<tr>
			<th>No.</th>
			<th>관람등급</th>
			<th>제목</th>		
			<th>상영관번호</th>
			<th>시간</th>
			<th>예약</th>
		</tr>
	</thead>
	<tbody id="myTable">
		<c:set var="i" value="1" />
		<c:choose>
			<c:when test="${not empty list}">
				<c:forEach var="m" items="${list}">
					<tr>

						<!-- td 8개 -->
						<td>${i}</td>
						<td><img src="../img/${m.mv_rating}.png" width="50" height="50"/></td>
						<td><a href="#">${m.mv_title}</a></td>
						<td>${m.tt_num}</td>
						<td>${m.mv_time}</td>
						<td>
	
						<form action="../book/selectSeat" method="post">
							<c:choose>				
								<c:when test="${m.mv_isTrue eq 'T'}">
									<input type="hidden" name="mv_title" value="${m.mv_title}">
									<input type="hidden" name="bk_wDate" value="${pickDate}">
									<input type="hidden" name="mv_time" value="${m.mv_time}">
									<input type="hidden" name="tt_num" value="${m.tt_num}">
									<input class="btn btn-success" type="submit" value="예약가능"/>							
								</c:when>
								<c:otherwise>
									  								
								</c:otherwise>				
							</c:choose>	
							</form>		
						</td>
					</tr>
					<c:set var="i" value="${i+1}" />
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">데이터가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

	</div>
	<!-- /.container-fluid -->
</div>
</div>
</div>
</div>
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
<%@include file="../footer.jsp"%>





