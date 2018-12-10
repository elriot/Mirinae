<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <div class="container">
	<div class="row">
		<div class="col-pg-12 col-md-12 mx-auto">  
<body>
<h1>글 쓰기페이지</h1>
<hr>
<form action="write" method="post">
<table border="1">
	<tr>
		<th>문 의 유 형</th> 
			<td>	
				<select name="cs_type">
				<option value="">선 택</option>
				<option value="결제/환불">결제/환불</option>
				<option value="회원정보">회원정보</option>
				<option value="건의사항">건의사항</option>
				<option value="할인정보">할인정보</option>
				<option value="기타사항">기타사항</option>
				</select>
			</td>
	</tr>
	<tr>
		<th>제 목</th>		
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<th>
			내 용
		</th>		
			<td>
				<textarea rows="30" cols="50" name="content" 
				placeholder="▶친절히모시겠습니다. 문의해주세요."></textarea>
			</td>
	</tr>
</table>	
<input type="submit" value="문의하기">	
<input type="reset" value="초기화">
</form>	
</div>
</div>
</div>	
</body>
