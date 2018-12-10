<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
>
<!-- 아래 두개는 좌석 선택 css -->
 <!-- Compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">	
<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

<script>
$(document).ready(function(){
	var seat = $("#selectedSeat");
	var seatPrice = $("#seatPrice"); 

	$(".seatNumber").click(function () {
	    var seatValue = $(this).attr("value");
	    var selectedSeat = $(seat).find(".selectedSeatNumber[value='" + seatValue + "']");
	    var seatLength = selectedSeat.length;

	    if(seatLength) {
	         selectedSeat.remove();
	    } else {
	        $(seat).append("<span class='selectedSeatNumber' value='" + seatValue + "'>" + seatValue + ' ' + "</span>");
	    }	

	    var totalSelectedSeat = $(".selectedSeatNumber").length;

        $(".totalPrice").remove();
	    if(totalSelectedSeat > 0) {
	        $(seatPrice).append("<span class='totalPrice'>" + (totalSelectedSeat * 10000) + "</span>");
	    }
	    
	    $("#hiddenPrice").attr("value", (totalSelectedSeat * 10000));
	    
	    
	});
	
	$('#resetSeatNum').click(function(){
	    $(".selectedSeatNumber").remove();	    
        $(".totalPrice").remove();
		
	});
	
	// div영역(#selectedSeat)에 세로로 추가하기
	/*var seat = $("#selectedSeat");

	$(".seatNumber").on("click", function () {
	    var seatValue = $(this).attr("value");

	    if($(seat).find(".seatNumber[value='" + seatValue + "']").length) {
	        $(seat).find(".seatNumber[value='" + seatValue + "']").remove();
	    } else {
	        $(seat).append("<div class='seatNumber' value='" + seatValue + "'>" + seatValue + "</div>");
	    }
	}); */
})


</script>

<h1>${bookVO.tt_num}번 상영관</h1>
<hr>
<div class="container">
	<div class="row">
		<div class="col-lg-8 col-md-10 mx-auto">
		<div id="page-wrapper">
		<div class="container-fluid">
		<form action="payment" method="post">
		<input type="hidden" name="mv_title" value="${mv_title}">
		<input type="hidden" name="tt_num" value="${bookVO.tt_num}">
		<input type="hidden" name="bk_wDate" value="${bookVO.bk_wDate}">
		<input type="hidden" name="mv_time" value="${bookVO.mv_time}">
		<input type="hidden" name="mv_num" value="${mv_num}">
		<input type="hidden" name="bk_price" id="hiddenPrice" value="">
<table>
<tr><th> </th><th>01</th><th>02</th><th>03</th><th>04</th><th>05</th><th>06</th><th>07</th><th>08</th><th>09</th><th>10</th></tr>
<tr><th>A</th>
		<th><div id="A01">01</div></th>
		<th><div id="A02">02</div></th>
		<th><div id="A03">03</div></th>
		<th><div id="A04">04</div></th>
		<th><div id="A05">05</div></th>
		<th><div id="A06">06</div></th>
		<th><div id="A07">07</div></th>
		<th><div id="A08">08</div></th>
		<th><div id="A09">09</div></th>
		<th><div id="A10">10</div></th>
		</tr>

</table> 	
<input type="reset" class="waves-effect waves-light btn-large" id="resetSeatNum" value="Reset">
<input type="submit" class="waves-effect waves-light btn-large" value="Select">

</form>
</div>
</div>
</div>
</div>
</div>
<hr>
<div id="selectedSeat">
    <span>선택한 좌석 : </span>
</div>
<div id="seatPrice">
    <span>가격 : </span>
</div>
</body>
</html>
		
		
<%-- <form action="seatSelected?tt_num=${book.tt_num}&bk_wDate=${book.bk_wDate}&rg_time=${book.rg_time}" method="post">
<table>
<tr><th> </th><th>01</th><th>02</th><th>03</th><th>04</th><th>05</th><th>06</th><th>07</th><th>08</th><th>09</th><th>10</th></tr>
<tr><th>A</th>	
	<c:set var="i" value="1"/>
		<c:forEach var="b" items="${list}">
			<c:if test="${i==11}"></tr><tr><th>B</th></c:if>
			<c:if test="${i==21}"></tr><tr><th>C</th></c:if>
			<c:if test="${i==31}"></tr><tr><th>D</th></c:if>
			<c:choose>				
				<c:when test="${b.bk_placed eq 'F'}"><td>
				 <p><label><input type="checkbox" class="filled-in" id="checkBoxId" name="seatNum" value="${b.tt_seatNum}"/><span></span></label></p></td></c:when>
				<c:otherwise><td><p><label><input type="checkbox" disabled="disabled" /><span></span></label></p></c:otherwise>
			</c:choose>			
			<c:set var="i" value="${i+1}"/>

		</c:forEach>
</tr>
</table> 	
<input type="submit" class="waves-effect waves-light btn-large" value="Select">
</form> --%>


		<%-- <c:choose>
		<c:when test="${A02 == 0}"><th><input type="checkbox" value="${A02}" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="${A02}"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${A03 eq 'true'}"><th><input type="checkbox" value="A03" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="A03"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${A04 eq 'true'}"><th><input type="checkbox" value="A04" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="A04"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${A05 eq 'true'}"><th><input type="checkbox" value="A05" disabled></th></c:when>	
		<c:otherwise><th><input type="checkbox" name="seatNum" value="A05"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${A06 eq 'true'}"><th><input type="checkbox" value="A06" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="A06"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${A07 eq 'true'}"><th><input type="checkbox" value="A07" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="A07"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${A08 eq 'true'}"><th><input type="checkbox" value="A08" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="A08"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${A09 eq 'true'}"><th><input type="checkbox" value="A09" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="A09"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${A10 eq 'true'}"><th><input type="checkbox" value="A10" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="A10"></th></c:otherwise>
		</c:choose>
	</tr>
	<tr><th>B</th>
		<c:choose>
		<c:when test="${B01 eq 'true'}"><th><input type="checkbox" value="B01" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="B01"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${B02 eq 'true'}"><th><input type="checkbox" value="B02" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="B02"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${B03 eq 'true'}"><th><input type="checkbox" value="B03" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="B03"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${B04 eq 'true'}"><th><input type="checkbox" value="B04" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="B04"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${B05 eq 'true'}"><th><input type="checkbox" value="B05" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="B05"></th></c:otherwise>
		</c:choose>

		<c:choose>
		<c:when test="${B06 eq 'true'}"><th><input type="checkbox" value="B06" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="B06"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${B07 eq 'true'}"><th><input type="checkbox" value="A07" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="B07"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${B08 eq 'true'}"><th><input type="checkbox" value="B08" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="B08"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${B09 eq 'true'}"><th><input type="checkbox" value="B09" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="B09"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${B10 eq 'true'}"><th><input type="checkbox" value="B10" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" name="seatNum" value="B10"></th></c:otherwise>
		</c:choose>
	</tr>
 --%>

<%-- <form action="submit" method="post">
<table>
	<tr><th> </th><th>01</th><th>02</th><th>03</th><th>04</th><th>05</th><th>06</th><th>07</th><th>08</th><th>09</th><th>10</th></tr>
	<tr><th>A</th>
		<c:choose>
		<c:when test="${A01 eq 'true'}"><th><input type="checkbox" value="A01" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="A01"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${A02 eq 'true'}"><th><input type="checkbox" value="A02" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="A02"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${A03 eq 'true'}"><th><input type="checkbox" value="A03" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="A03"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${A04 eq 'true'}"><th><input type="checkbox" value="A04" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="A04"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${A05 eq 'true'}"><th><input type="checkbox" value="A05" disabled></th></c:when>	
		<c:otherwise><th><input type="checkbox" value="A05"></th></c:otherwise>
		</c:choose>

		<c:choose>
		<c:when test="${A06 eq 'true'}"><th><input type="checkbox" value="A06" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="A06"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${A07 eq 'true'}"><th><input type="checkbox" value="A07" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="A07"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${A08 eq 'true'}"><th><input type="checkbox" value="A08" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="A08"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${A09 eq 'true'}"><th><input type="checkbox" value="A09" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="A09"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${A10 eq 'true'}"><th><input type="checkbox" value="A10" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="A10"></th></c:otherwise>
		</c:choose>
	</tr>
	<tr><th>B</th>
		<c:choose>
		<c:when test="${B01 eq 'true'}"><th><input type="checkbox" value="B01" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="B01"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${B02 eq 'true'}"><th><input type="checkbox" value="B02" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="B02"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${B03 eq 'true'}"><th><input type="checkbox" value="B03" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="B03"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${B04 eq 'true'}"><th><input type="checkbox" value="B04" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="B04"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${B05 eq 'true'}"><th><input type="checkbox" value="B05" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="B05"></th></c:otherwise>
		</c:choose>

		<c:choose>
		<c:when test="${B06 eq 'true'}"><th><input type="checkbox" value="B06" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="B06"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${B07 eq 'true'}"><th><input type="checkbox" value="A07" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="B07"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${B08 eq 'true'}"><th><input type="checkbox" value="B08" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="B08"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${B09 eq 'true'}"><th><input type="checkbox" value="B09" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="B09"></th></c:otherwise>
		</c:choose>
		<c:choose>
		<c:when test="${B10 eq 'true'}"><th><input type="checkbox" value="B10" disabled></th></c:when>
		<c:otherwise><th><input type="checkbox" value="B10"></th></c:otherwise>
		</c:choose>
	</tr>
</table>
<input type="submit">
</form>
 --%>

<%-- <c:set var="A1"/><c:set var="A2"/><c:set var="A3"/><c:set var="A4"/><c:set var="A5"/>
<c:set var="A6"/><c:set var="A7"/><c:set var="A8"/><c:set var="A9"/><c:set var="A10"/>
<c:set var="B1"/><c:set var="B2"/><c:set var="B3"/><c:set var="B4"/><c:set var="B5"/>
<c:set var="B6"/><c:set var="B7"/><c:set var="B8"/><c:set var="B9"/><c:set var="B10"/>
<c:choose>
	<c:when test="${list.size() > 0}">
		<c:set var="index" value="1"></c:set>
		<c:set var="seatNumA" value="A${index}"/>
		<c:set var="seatNumB" value="A${index}"/>			
 		<c:forEach var="list" items="${list}">
			<c:out value="${index }"></c:out>
 			<c:if test="${list.tt_seatNum eq seatNumA}"><c:set var="${seatNumA}" value="true"/></c:if> 		
			<c:if test="${list.tt_seatNum eq seatNumB}"><c:set var="${seatNumB}" value="true"/></c:if>
 		
 			<c:set var="index" value="${index+1}"/>							
		</c:forEach> 
		<c:out value="${seatNumA1}"></c:out>
		<c:out value="${seatNumA5}"></c:out>
	</c:when>		
</c:choose>  --%>


<%-- 	<c:when test="${list.size() > 0}">	
		<c:forEach var="list" items="${list}">
<!-- 			<tr> -->
				<th><c:if test="${list.tt_seatNum ne 'A01'}"><input type="checkbox" value="A01"></c:if></th>
				<th><c:if test="${list.tt_seatNum ne 'A02'}"><input type="checkbox" value="A02"></c:if></th>
				<th><c:if test="${list.tt_seatNum ne 'A03'}"><input type="checkbox" value="A03"></c:if></th>
				<th><c:if test="${list.tt_seatNum ne 'A04'}"><input type="checkbox" value="A04"></c:if></th>
				<th><c:if test="${list.tt_seatNum ne 'A05'}"><input type="checkbox" value="A05"></c:if></th>
<!-- 			</tr> -->
				
<!-- 			<tr> -->
				<th><c:if test="${list.tt_seatNum ne 'A06'}"><input type="checkbox" value="A06"></c:if></th>
				<th><c:if test="${list.tt_seatNum ne 'A07'}"><input type="checkbox" value="A07"></c:if></th>
				<th><c:if test="${list.tt_seatNum ne 'A08'}"><input type="checkbox" value="A08"></c:if></th>
				<th><c:if test="${list.tt_seatNum ne 'A09'}"><input type="checkbox" value="A09"></c:if></th>
				<th><c:if test="${list.tt_seatNum ne 'A10'}"><input type="checkbox" value="A10"></c:if></th>
<!-- 			</tr> -->
		</c:forEach>
	</c:when>		
 --%>