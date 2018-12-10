<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>

<div class="container mt-3">
  <h1 class="text-center">아이디/비밀번호 찾기</h1>
	<ul class="nav nav-tabs nav-justified">
        <li class="nav-item"><a class="nav-link" href="#searchID">아이디 찾기</a></li>
		<li class="nav-item"><a class="nav-link" href="#searchPasswd">비밀번호 찾기</a></li>
	</ul>
	<br>
	

	<div class="tab-content">
	
	
		<!-- 아이디 찾기  -->
		<div id="searchID" class="container tab-pane fade">
			<br>
			<div class="container">
			<form action="emailChk" method="post" id=frm2>
				<div class="form-group">
					이 메 일 <input type="email" name="mb_email" id="email" class="form-control" >
					<input type="button" class="btn btn-primary" value="인증번호받기" id="emailBtn"><br>
					<input type="hidden" id="checkCode">
					<input type="hidden" id="emailHi" value=""><br>
					인증코드 <input type="text" class="form-control" name="emailCode" id="emailCode" >
					<input type="button" class="btn btn-primary" value="인증확인" id="codeBtn"><br><br>
					<input type="submit" class="btn btn-warning" id="abcd" value="다음">
				</div>
			</form>
			</div>
		</div>
		
		<!-- 비밀번호 찾기  -->
		<div id="searchPasswd" class="container tab-pane fade">
			<br>
			<div class="container">
				<div class="form-group">			
					<form action="../mail/mailPwd" method="post" id="frm">
						<input type="text" class="form-control" name="mb_ID" id="id" placeholder="찾고자하는 아이디를 입력해주세요."><br><span id="dupIdMsg"></span><br><br>
						<input type="email" class="form-control" name="mb_email" id="emailChk" placeholder="이메일 입력">
						<input type="hidden" id="searchPwd"> <input type="hidden"
						id="hiddenVal"><br><input type="submit" class="btn btn-warning" value="비밀번호 요청">
					</form>
				</div>
<!-- 			<form action="emailChk" method="post" id=frm33>
				<div class="form-group">
					아이디 <input type="text" class="form-control" name="mb_ID" id="--">
					이 메 일 <input type="email" name="mb_email" id="email" class="form-control">	<br><br>			
					<input type="submit" class="btn btn-warning" id="send" value="인증코드발송">
				</div>
			</form> -->
			</div>
		</div>


	</div><!-- tab-content -->

</div><!-- container -->


<script>
$(document).ready(function() {
	$(".nav-tabs a").click(function() {
		$(this).tab('show');
	});
	
	$('#emailBtn').click(function () {
		
		var userEmail = $('#email').val();
		var userName = $('#name').val();
		if(userEmail ==""){alert("이메일을 입력해주세요.");}
		else{
			alert(userEmail)
		}
		
		$.ajax({

			url: '../mail/mail',
			data: {
				email: userEmail
			},
			success: function (result) {
				$('#checkCode').val(result);
			}
			
		
			
		});
		
		$('#codeBtn').click(function () {
			
			if($('#emailCode').val() == $('#checkCode').val()){
				alert('인증되었습니다.');
				$('#emailHi').val(0);
			}else{
				alert('인증번호가 틀렸습니다.');
				$('#emailHi').val(1);
			}
		});
		
		// var sss= "sss";
		$('#abcd').click(function(){			
			if($('#emailHi').val() == 1){
				alert('틀림');
				return false;
			}
		}); 
		
	});
	
	
	
	// 비밀번호 찾기
	$('#id').keyup(
			function() {
				var id = $('#id').val();

				$.ajax({
					url : '../api/member/chkDupId',
					data : {
						id : id
					},
					success : function(result) {
						if (result.count == 1) {
							$('#dupIdMsg').text(
									'가입된 아이디가 확인되었습니다. 이메일을 입력하세요.')
									.css('color', 'green');
						} else {
							$('#dupIdMsg').text('가입된 아이디가 아닙니다.')
									.css('color', 'red');
						}
					}
				});

			});
	

	$('#frm').submit(function() {
		var a = $('#emailChk').val();
		if ($('#id').val() == "") {
			alert('아이디를 확인해주세요.');
			return false;
		} else if ($('#emailChk').val() == "") {
			alert('메일을 확인해주세요.');
			return false;
		}
	});
	
	$('#frm2').submit(function() {
		
		if ($('#email').val() == "") {
			alert('이메일을 확인해주세요.');
			return false;
		} else if ($('#emailCode').val() == "") {
			alert('인증코드를 입력해주세요.');
			return false;
		}
	});

});
</script>

<!-- <script>
//아이디찾기
$(document).ready(function() {
		/* $(".nav-tabs a").click(function() {
		$(this).tab('show'); */		
	
});





</script> -->
<%@include file="../footer.jsp"%>

