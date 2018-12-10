<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>

<div class="container mt-3">

	<h2>My Page</h2>
	<ul class="nav nav-tabs nav-justified">
        <li class="nav-item"><a class="nav-link" href="#profile">프로필수정</a></li>
		<li class="nav-item"><a class="nav-link" href="#bookInfo">예약확인</a></li>
		<li class="nav-item"><a class="nav-link" href="#customerCenter">1:1문의</a></li>
		<li class="nav-item"><a class="nav-link" href="#delete">탈퇴</a></li>
	</ul>
	
	<!-- 프로필수정  명령어 update-->
	<div class="tab-content">
	
		<div id="profile" class="container tab-pane fade">
			<br>
			<div class="container">
				<%@include file="memberUpdate.jsp"%>
			</div>
		</div>

		
	<!-- 예약확인 명령어  bookInfo-->

		<div id="bookInfo" class="container tab-pane fade">
				<%@include file="memberBookInfo.jsp"%>
		</div>
		
		
		<div id="customerCenter" class="container tab-pane fade">
			<br>
			<%@include file="memberCS.jsp"%>			
		</div>


			<!-- 회원탈퇴  명령어 delete-->

		<div id="delete" class="container tab-pane fade">
			<div class="container">
				<br>
				<%@include file="memberDelete.jsp"%>
			</div>

		</div>

	</div>

</div>


<script>

 $(document).ready(function() {
	$(".nav-tabs a").click(function() {
		$(this).tab('show');
	});

}); 

</script>

<%@include file="../footer.jsp"%>

