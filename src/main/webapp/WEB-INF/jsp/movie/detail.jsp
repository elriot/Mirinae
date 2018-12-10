<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-lg-8 mx-auto">

			<h1 class="text-center"><b>${movieVO.mv_title}</b> <img src="../img/${movieVO.mv_rating}.png" width="50" height="50"/></h1>
			<hr>
			<div style="display:block; width: 270px; margin: 0 auto;">		
			     <img src="../img/${movieVO.mv_title}.jpg" width="270" height="400"/>
                 <b style=" margin: 10px auto; display: block; width: auto; text-align: center;">개봉일 : ${movieVO.mv_startDate}</b> 
                 <c:if test="${movieVO.mv_isTrue eq 'T'}"> 
                     <input type="button" class="btn btn-info" onclick="location.href='/movie/book/selectMovie?mv_title=${movieVO.mv_title }'"value="예매하러 가기" style="margin: 10px auto; display: block;">           
                    
                 </c:if>
			</div>

			<hr>
			<br>
			<h4><b>시놉시스</b></h4>
			${movieVO.mv_detail}<hr>
		
			
			<br>
			<h4><b>무비 트레일러</b></h4>
			<iframe id="player" type="text/html" width="100%" height="409" src="${movieVO.mv_trailer}" frameborder="0" webkitallowfullscreen="\" mozallowfullscreen="\" allowfullscreen="\"></iframe>
			<hr>


			<input type="button" value="메인으로" class="btn float-left" onclick="history.back()">
			</form>		
			
		</div>
	</div>

</div>

<%@include file="../footer.jsp"%>
    
