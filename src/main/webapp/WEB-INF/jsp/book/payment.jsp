<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<c:set var="i" value="1" />
<c:set var="totalPrice" value="0" />
<div class="container">
	<div class="row">
		<div class="col-lg-8 col-md-10 mx-auto">
			<form action="complete" method="post">
				<input type="hidden" name="mv_title" value="${mv_title}"> <input
					type="hidden" name="mv_num" value="${bookVO.mv_num}"> <input
					type="hidden" name="tt_num" value="${bookVO.tt_num}"> <input
					type="hidden" name="bk_wDate" value="${bookVO.bk_wDate}"> <input
					type="hidden" name="mv_time" value="${bookVO.mv_time}"> <input
					type="hidden" name="mv_num" value="${bookVO.mv_num}">
				<div class="overlay"></div>
				<h2 class="text-center"><b> ${mv_title} </b></h2>
				<h5 class="text-center"><b> ${bookVO.bk_wDate} ${bookVO.mv_time} </b></h5>
				<div class="form-group text-center">
					<hr>
					${bookVO.tt_num}번 상영관<br>
					<br>
					<br>
					<c:choose>

						<c:when test="${list.size() > 0 }">
							<c:forEach var="list" items="${list }">
								<b>[${i}]</b>
								<b>좌석번호</b> ${list.tt_seatNum}, <b>금액</b> <fmt:formatNumber value="${list.bk_price}" pattern="###,###,###"/> <br>
								<br>
								<input type="hidden" name="tt_seatNum"
									value="${list.tt_seatNum}">
								<c:set var="i" value="${i+1}" />
								<c:set var="totalPrice" value="${totalPrice+list.bk_price}" /><br>
							</c:forEach>
						</c:when>
						<c:otherwise>
							선택한 좌석이 없습니다.
						</c:otherwise>
					</c:choose>
					<hr>
					<b>총 금액</b> <fmt:formatNumber value="${totalPrice}" pattern="###,###,###"></fmt:formatNumber>
				</div>
				<input type="submit" class="btn btn-info float-right" value="결제하기">
				<input type="button" value="좌석 다시 선택" class="btn float-left" onclick="history.back()">
				

			</form>
			
			<hr>
		</div>
	</div>
</div>
<%@include file="../footer.jsp"%>





