<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<!-- Page Header -->
<header class="masthead" style="background-image: url('/movie/startbootstrap-clean-blog-gh-pages/img/home-bg.jpg')">
	 <div class="overlay"></div>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto"> 
				<div class="site-heading">
					<h1>select movie</h1>
					<span class="subheading"></span>
				</div>
 			</div>
		</div>
	</div>
</header> 


<form action="selectTime" method="post">
<input type="hidden" name="mv_title" value="${mv_title}">
	<div class="form-group">
		선택 영화 : ${mv_title} <br>
	</div>
<!-- 상영관 입력 : <input type="text" name="tt_num"><br> -->
관람일 입력 : <input type="date" name="bk_wDate" min="${min}" max="${max}"><br>
<!-- 상영시간 선택 : <input type="text" name="rg_time"><br> -->
<input type="submit" value="다음으로">
</form>
<hr>
<%@include file="../footer.jsp"%>





