<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<style>
div, ul, li {
/* 	border: 1px solid red; */	
	margin: 0px;
	padding: 0px;
}

ul {
	list-style: none;	
}
.mx-auto d-block {
    max-width: 100%;
    width: 110px;
    height: 350px;
}
div.imgDiv{
  max-width: 100px;
}

</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/movie/scripts/jquery.innerfade.js"></script>
<script>
$(document).ready(function () {
	$('#portfolio').innerfade({
		speed: 'slow',
		timeout: 4000,
		type: 'sequence',
		containerheight: '300px'
	});
});
</script>
<body>
 <div class="container">
	<div class="row">
		<div class="col-pg-12 col-md-12 mx-auto">
		  <div class="imgDiv">		
	 			<ul id="portfolio">
					<li><img src="img/01.png" class="mx-auto d-block"/></li>
					<li><img src="img/04.png" class="mx-auto d-block"/></li>
					<li><img src="img/03.png" class="mx-auto d-block"/></li>
					<li><img src="img/02.png" class="mx-auto d-block"/></li>
				</ul>
		  </div>
			
			<br><br><br><br><br>

 		<table class="table table">
        <tr>
		<c:choose>
		
			<c:when test="${not empty list}">		
			<c:set var="no" value="1"/>	
			
			<c:forEach var="item" items="${list}">

				<td class="text-center">
					<img src="img/${item.mv_title}.jpg" width="270" height="400" class="img-thumbnail"><br>
					<img src="img/${item.mv_rating}_mini.png" width="20" height="20"><b>&nbsp;${item.mv_title }</b><br>
					 ${item.mv_releaseDate } 개봉  --- ${item.mv_num}<br>
					 ${item.toString() }	
					<input type="button" class="btn center" onclick="location.href='movie/detail?mv_num=${item.mv_num}'" value="상세보기"><br>
				</td>

				<c:if test="${no%3==0 }">
					</tr><tr>
				</c:if>		
				<c:set var="no" value="${no+1}"/>											
			</c:forEach>
			
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="3">개봉된 영화 없음</td>
				</tr>
			</c:otherwise>
			
		</c:choose>
		</tr>

	</table> 
	</div>
	</div>

</div>
</body>
   
<%@include file="../footer.jsp"%>