<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript" src="../editor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="../editor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>

<%@include file="../header.jsp"%>

<h1>공지사항 글쓰기</h1>
<hr>
<div id="page-wrapper">

	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="row">
			<div class="container">
				<form action="insert" method="post" name="w_form">
					<div class="form-group">
						<input type="text" name="nt_subject" class="form-control"
							placeholder="Enter Subject">
					</div>
					<div class="form-group">
						<textarea name="nt_content" id="textAreaContent"
							style="width: 100%" rows="15" cols="80"
							placeholder="Enter Content"></textarea>
					</div>
					<button type="button" class="btn btn-primary"
						onClick="submitContents(this)">글쓰기</button>
				</form>
			</div>

			<!-- Naver Smart Editor 2 -->
			<script>
				var form = document.w_form;
				var oEditors = [];
				nhn.husky.EZCreator.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : "textAreaContent",
					sSkinURI : "../editor/SmartEditor2Skin.html",
					fCreator : "createSEditor2"
				});

				// submit
				function submitContents(elClickedObj) {
					// 에디터의 내용이 textarea에 적용된다.
					oEditors.getById["textAreaContent"].exec(
							"UPDATE_CONTENTS_FIELD", []);
					/*       var con = document.w_form.nt_content;
					 con.value = document.getElementById("textAreaContent").value;  */
					try {
						elClickedObj.form.submit();
					} catch (e) {

					}
				}

				// textArea에 이미지 첨부
				function pasteHTML(filepath) {
					var sHTML = '<img src="../editor/upload/'+ filepath + '">';
					oEditors.getById["textAreaContent"].exec("PASTE_HTML",
							[ sHTML ]);
				}
			</script>
			<!-- Naver Smart Editor 2 END-->
		</div>
	</div>
</div>


<%@include file="../footer.jsp"%>