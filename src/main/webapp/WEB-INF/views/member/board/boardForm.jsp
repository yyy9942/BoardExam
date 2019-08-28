<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	$(function() {

		$('#bo_content').summernote({
			lang : 'ko-KR',
			height : 150,
			codemirror : {
				theme : 'monokai'
			}
		});

		$('#boardListBtn').click(function() {
			$(location).attr('href', '${pageContext.request.contextPath}/member/board/boardList.do');
		});

		$('#boardRegistForm')
				.submit(
						function() {

							var content = $.trim($('#bo_content').summernote(
									'code'));

							if ($.trim($('#bo_title').val()) == "") {
								alert("제목을 입력해주세요");
								return false;
							}

							if (content == "<p><br></p>") {
								alert("내용을 입력해주세요");
								return false;
							}

							$("#boardRegistForm").attr("action",
									"${pageContext.request.contextPath}/member/board/boardInsert.do");
							$("#boardRegistForm")
									.append(
											'<input type="hidden" name="bo_ip" value="${pageContext.request.remoteAddr}"/>');
							$("#boardRegistForm")
									.append(
											'<input type="hidden" name="bo_content" value="'+content+'"/>');
							var formdata = $('#boardRegistForm').serialize();
							$.ajax({
								url:'${pageContext.request.contextPath}/member/board/boardInsert.do',
								type:'POST',
								dataType:'json',
								data:formdata,
								success:function(result){
									if(result.flag == "true"){
										alert('성공적으로 게시한거같음');
										$(location).attr('href', '${pageContext.request.contextPath}/member/board/boardList.do');
									}else if(result.flag=="false"){
										alert('게시글 올리는게 실패한듯?');
										return;
									}else{
										alert("뭔가 이상함. ");
									}
								},
								error:function(result){
									alert('ERROR : ' + result.status);
								}
							});
							
								return false;
						});

	});
</script>
</head>
<body>
	<form id="boardRegistForm" class="form-horizontal" action=""
		role="form" method="POST" enctype="multipart/form-data">
		<div class="form-group">
			<label class="control-label col-sm-2" for="bo_title">제목:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="bo_title"
					name="bo_title" placeholder="제목 입력...">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="bo_content">내용:</label>
			<div class="col-sm-10">
				<div id="bo_content"></div>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="file01">첨부파일1:</label>
			<div class="col-sm-10">
				<input type="file" class="filestyle" id="file01" name="files"
					data-buttonName="btn-primary">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="file02">첨부파일2:</label>
			<div class="col-sm-10">
				<input type="file" class="filestyle" id="file02" name="files"
					data-buttonName="btn-primary">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-info" style="float: right">등록</button>
				<button type="reset" class="btn btn-danger" style="float: right">취소</button>
				<button type="button" id="boardListBtn" class="btn btn-primary"
					style="float: right">목록</button>
			</div>
		</div>
	</form>
</body>
</html>