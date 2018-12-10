<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@include file="../header.jsp"%>

<%-- <div class="group">
관람일 입력 : <input type="date" name="bk_wDate" min="${min}" max="${max}"><br>
<input class="btn btn-primary" type="submit" value="선택">
</div> --%>
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
		 	<input type="date" min="${min }" max="${max }" name="pickDate">
		 	<input type="hidden" name="min"value="${min }">
		 	<input type="hidden" name="max"value="${max }">
		 	<input class="btn btn-primary" type="submit" value="선택"/>
			</div> 
		</form>
		<br>		
		
	 	

	</div>
	<!-- /.container-fluid -->

</div>
</div>
</div>
</div>
<%@include file="../footer.jsp"%>





