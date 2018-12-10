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


<form action="selectSeat" method="post">
<input type="hidden" name="mv_title" value="${mv_title}">
<input type="hidden" name="bk_wDate" value="${bk_wDate}">
<input type="hidden" name="mv_time" value="${mv_time}">
	<div class="form-group">
		선택 영화 : ${mv_title} <br>
		관람일     : ${bk_wDate} <br>
		선택 시간 : ${mv_time} <br>
	</div> 

		<label>	상영관 선택 :</label> <br>
			<c:choose>
				<c:when test="${list.size() > 0 }">
					<c:forEach var="m" items="${list}">
						<input type="radio" name="tt_num" value="${m.tt_num}"><b>${m.tt_num}번</b> 상영관  (잔여석 표기)        
					</c:forEach>
					
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
	<br>
<input type="submit" value="상영관 선택">
</form>
<hr>
<%@include file="../footer.jsp"%>





