<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
 <div class="container">
	<div class="row">
		<div class="col-pg-8 col-md-10 mx-auto">  
<table class="table">
<tr>
	<th>글번호</th><td>${noticeVO.nt_num}</td>
	<th>작성일</th><td>${noticeVO.nt_writeDate}</td>
	<th>조회수</th><td>${noticeVO.nt_readCount}</td>
</tr>
<tr>
	<td colspan="6" class="text-center"><b>${noticeVO.nt_subject}</b></td>
</tr>
<tr>
	<td colspan="6">${noticeVO.nt_content}</td>
</tr>
<tr>
	<td colspan="6">
		<input type="button" class="btn float-left" value="글목록" onclick="location.href='list?pageNum=${param.pageNum}'">
	</td>
</tr>
</table>
</div>
</div>
</div>

<%@include file="../footer.jsp"%>