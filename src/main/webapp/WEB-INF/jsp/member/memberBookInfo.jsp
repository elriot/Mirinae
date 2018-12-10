<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="container">

<form action="bookCancel" method="post" name="form">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>No.</th>
				<th>제목</th> 
				<th>예약일</th>
				<th>상영일</th>
				<th>상영관</th>
				<th>좌석정보</th>
				<th>취소</th>
			</tr>
		</thead>
		<tbody>	
		<c:choose>
			<c:when test="${not empty bkList}">		
			<c:set var="no" value="1"/>	
			<c:forEach var="item" items="${bkList}">
				<tr>
					<td>${no}</td>
					<td>${item.mv_title}</td>
					<td>${item.bk_date}</td>
					<td>${item.bk_wDate} &nbsp; ${item.mv_time}</td>
					<td>${item.tt_num }</td>					
					<td>
						<c:set var="mv_num" value="${item.mv_num}"/>
						<c:forEach var="list" items="${requestScope.map}" varStatus="num">												 
				 		   <c:forEach var="item2" items="${list.value}">
				 		   <c:set var="i" value="1"/>
				 		   	<c:if test="${mv_num eq list.key }">
				 		   			<c:if test="${i%5==0}">
										<br>
									</c:if>	
				 		   		<c:out value="${item2.tt_seatNum}"/>
	 		   					<c:set var="i" value="${i+1}"/>		
				 		   </c:if>
					     </c:forEach> 				    
			 		    </c:forEach>
					</td>															
					<td>
					<c:choose>
						<c:when test="${item.bk_paid eq 'T'}">
						   	  <input type="hidden" name="mv_num" value="${item.mv_num}">					   	  
						   	  <input type="submit" class="btn btn-danger float-left" value="예약취소" onclick="return confirm('예약을 취소하시겠습니까?')"/>

						</c:when>
						<c:otherwise>취소불가</c:otherwise>
					
					</c:choose>					
					</td>		
				</tr>
				<c:set var="no" value="${no+1}"/>
			</c:forEach>

			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="7">예약 정보가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		

		</tbody>	
	</table>
</form>
</div>
