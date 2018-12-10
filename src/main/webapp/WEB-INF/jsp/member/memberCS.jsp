<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<div class="container">
	<c:set var="index" value="1" />
	<form action="csDelete" method="post" name="form">
		<table class="table table-hover">
			<tr>
				<th>선 택</th>
				<th>게시글번호</th>
				<th>문의유형</th>
				<th>제 목</th>
				<th>작성시간</th>
				<th>답변여부</th>
			</tr>
			<c:forEach items="${myCsList}" var="cs">
				<tr>
					<td><input type="checkbox" name="check" id="chk"
						value="${cs.num}"></td>
					<td>${cs.num}</td>
					<td>${cs.cs_type}</td>
					<%-- <td><a href="#table_collapse_${index}" class="btn btn-primary"
                data-toggle="collapse" role="button" aria-expanded="false">${cs.title}</a></td> --%>
					<td>${cs.title}
					<a href="#table_collapse_${index}" data-toggle="collapse" role="button" aria-expanded="false">
					<i style="font-size: 24px; color: blue; float:right" class="fa">&#xf0d7;</i></a>
					<td>
						<fmt:parseDate var="parsed" value="${cs.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${parsed}" pattern="yyyy-MM-dd HH:mm:ss"/>

					</td>
					<td><c:choose>
							<c:when test="${cs.reply eq 'F'}">답변미완료</c:when>
							<c:otherwise>답변완료</c:otherwise>
						</c:choose></td>
				</tr>
				<!-- 클릭하면 보여지는 내용들 -->
				<tr class="collapse" id="table_collapse_${index}">
					<td colspan="6">					  
					    <b>나의 문의 내역</b><br><textarea class="form-control" rows="5" readonly>${cs.content}</textarea> 
						<hr>
					    <c:if test="${cs.reply_content ne null}">
							<b>관리자 답변 : <fmt:parseDate var="parsed2" value="${cs.reply_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${parsed2}" pattern="yyyy-MM-dd HH:mm:ss"/></b><br>
							<textarea class="form-control" rows="5" readonly> ${cs.reply_content} </textarea> 
						</c:if>
					</td>
					<c:set var="index" value="${index+1}" />


			</c:forEach>
		</table>
		<input type="submit" class="btn btn-danger" value="삭제">
		<input type="button" class="btn btn-primary" value="글쓰기" data-toggle="modal" data-target="#write">
	</form>

</div>




<!-- The Modal -->
  <div class="modal fade" id="write">
    <div class="modal-dialog">
      <div class="modal-content">
      
      
        <!-- <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">문의사항 작성</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
       </div>
      <form action="write" method="post" name="w_form">
            <div class="modal-body">
                <div class="form-group">
	                <select name="cs_type" class="form-control" required>
		                <option value="">문의유형 선택</option>
		                <option value="결제/환불">결제/환불</option>
		                <option value="회원정보">회원정보</option>
		                <option value="건의사항">건의사항</option>
		                <option value="할인정보">할인정보</option>
		                <option value="기타사항">기타사항</option>
	                </select>
                </div>
                <div class="form-group">
                    <input type="text" name="title" class="form-control"
                        placeholder="제목을 입력하세요" required/>
                </div>
                <div class="form-group">
	                <textarea rows="10" cols="61" name="content" 
	                placeholder="▶친절히모시겠습니다. 문의해주세요." required></textarea>
<!--                     <input type="textarea" name="title" class="form-control"
                        placeholder="제목을 입력하세요" required/> -->
                </div>
            </div>

            <div class="modal-footer">
               <input type="reset" class="btn btn-warning float-left" value="초기화">
               <input type="submit" class="btn btn-primary float-right" value="문의하기">    
            </div>
       </form>
      </div>
    </div>
  </div>
