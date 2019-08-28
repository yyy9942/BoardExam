<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.carousel {
	width: 200px;
	height: 150px;
	margin-left: 200px;
}

.carousel-inner>.item>img {
	width: 200px;
	height: 150px;
}
</style>
</head>
<script type="text/javascript">
	$(function() {

		$('#bo_content').summernote({
			height : 150,
			codemirror : {
				theme : 'monokai'
			}
		});

		$('#bo_title').val('${boardInfo.bo_title}');
		$('#mem_id').val('${boardInfo.mem_id}');
		$('#bo_content').summernote('code', '${boardInfo.bo_content}');

		$('#btn2').click(
				function() {
					if ('${LOGIN_MEMBERINFO.mem_id}' != '${boardInfo.mem_id}') {
						BootstrapDialog.show({
							title : '경고',
							message : '해당 게시글 작성자가 아닙니다. 삭제할 수 없습니다!'
						});
						return false;
					}

					$.ajax({
						url : "${pageContext.request.contextPath}/member/board/boardDelete.do",
						data : "bo_id=" + '${boardInfo.bo_id}',
						type : "POST",
						dataType : "text",
						success : function(result) {
							BootstrapDialog.show({
								title : '경고',
								message : '게시글 삭제 성공'
							});
							var search = "";
							var search_keycode = '${param.search_keycode}';
							var search_keyword = '${param.search_keyword}';
							var currentPage = '${param.currentPage}';

							if (currentPage != '') {
								search += ('?currentPage=' + currentPage);
							} else {
								search += ('?currentPage=1');
							}
							if (search_keycode != '' && search_keyword != '') {
								search = search + "&search_keycode="
										+ search_keycode + "&search_keyword="
										+ search_keyword;
							}
							$(location).attr(
									'href',
									"${pageContext.request.contextPath}/member/board/boardList.do"
											+ search);
						},
						error : function(result) {
							BootstrapDialog.show({
								title : '경고',
								message : '게시글 삭제 실패'
							});
							return false;
						}

					});

				});

		// 	$('#btn3').click(function(){
		//     	var title = encodeURIComponent('${boardInfo.bo_title}');
		//     	var url ='?contentPage=/12/freeboard/freeboardReplyForm.jsp?rnum=${param.rnum}&bo_group=${freeboardInfo.bo_group}&bo_seq=${freeboardInfo.bo_seq}&bo_depth=${freeboardInfo.bo_depth}&bo_title='+title;
		//     	$(location).attr('href','${pageContext.request.contextPath}/12/main.jsp'+url);
		//     });

		$('#btn1').click(function() { //글쓰기
			$(location).attr('href', '/member/board/boardForm.do');
		});

		$('#btn4').click(
				function() { //목록
					var search = "";
					var search_keycode = '${param.search_keycode}';
					var search_keyword = '${param.search_keyword}';
					var currentPage = '${param.currentPage}';

					if (currentPage != '') {
						search += ('?currentPage=' + currentPage);
					} else {
						search += ('?currentPage=1');
					}
					if (search_keycode != '' && search_keyword != '') {
						search = search + "&search_keycode=" + search_keycode
								+ "&search_keyword=" + search_keyword;
					}
					$(location).attr('href',
							'${pageContext.request.contextPath}/member/board/boardList.do' + search);

				});

		$('#btn3')
				.click(
						function() { //답글
							var title = encodeURIComponent('${boardInfo.bo_title}');
							var url = 'mem_id=${boardInfo.mem_id}&rnum=${param.rnum}&bo_group=${boardInfo.bo_group}&bo_seq=${boardInfo.bo_seq}&bo_depth=${boardInfo.bo_depth}&bo_title='
									+ title;
							$(location).attr(
									'href',
									'${pageContext.request.contextPath}/member/board/boardReplyForm.do?'
											+ url);
						});

		// 수정
		$('#boardViewForm')
				.submit(
						function() {

							if ('${LOGIN_MEMBERINFO.mem_id}' != '${boardInfo.mem_id}') {
								BootstrapDialog.show({
									title : '경고',
									message : '해당 게시글 작성자가 아닙니다 수정할 수 없습니다'
								});
								return false;
							}

							var content = $.trim($('#bo_content').summernote(
									'code'));

							if ($.trim($('#bo_title').val()) == "") {
								alert("제목을 입력해주세요");
								return false;
							}

							if (content == "<p><br></p>" || content == "") {
								alert("내용을 입력해주세요");
								return false;
							}

							$(this).attr('action',
									'${pageContext.request.contextPath}/member/board/boardUpdate.do');
							$(this)
									.append(
											'<input type="hidden" name="bo_id" value="${boardInfo.bo_id}"/>');

							// 썸머노트 웹 에디터에 작성된 컨텐츠 취득
							var bo_content = $('#bo_content')
									.summernote('code');
							$(this)
									.append(
											'<input type="hidden" name="bo_content" value="'+bo_content+'"/>');

							return true;
						});

	});
</script>
<body>
	<form id="boardViewForm" class="form-horizontal" role="form"
		action="" method="post">
		<div class="form-group">
			<label class="control-label col-sm-2" for="bo_title">제목:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="bo_title"
					name="bo_title">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="bo_title">작성자:</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control" id="mem_id"
					name="mem_id">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="bo_content">내용:</label>
			<div class="col-sm-10">
				<div id="bo_content"></div>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="bo_content">첨부파일:</label>
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<c:forEach items="${boardInfo.items }" var="fileitem"
					varStatus="stat">
					<c:if test="${stat.first }">
						<div class="item active"></div>
					</c:if>
					<c:if test="${stat.last }">
						<div class="item"></div>
					</c:if>
					<c:if test="${!empty boardInfo.items}">
						<a
							href="${pageContext.request.contextPath }/member/board/fileDownload.do?file_id=${fileitem.file_id }">
							${fileitem.file_name }</a>
					</c:if>
					<c:if test="${empty boardInfo.items}">
						<p>첨부파일이 없습니다</p>
					</c:if>
			</c:forEach>
			</div>
		</div>
		<div class="form-group">
			<br>
			<br>
			<br>
			<br>
			<div class="col-sm-offset-2 col-sm-10">
				<button type="button" id="btn1" class="btn btn-success">글쓰기</button>
				<button type="button" id="btn2" class="btn btn-danger">삭제</button>
				<button type="button" id="btn3" class="btn btn-primary">댓글</button>
				<button type="button" id="btn4" class="btn btn-info">목록</button>
				<button type="submit" class="btn btn-default" style="float: right">수정</button>
			</div>
		</div>
	</form>
</body>
</html>