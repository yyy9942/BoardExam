<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 목록</title>
</head>
<script type="text/javascript">
$(function(){
	$('#insert').click(function(){
		$(location).attr('href', '${pageContext.request.contextPath}/member/board/boardForm.do');
		
	});
	
	
	$('#tbody tr').click(function(){
		var search = "";
		var search_keycode = '${param.search_keycode}';
		var search_keyword = encodeURIComponent('${param.search_keyword}');
		if(search_keycode != '' && search_keyword != ''){
			var search = "&search_keycode=" + search_keycode + "&search_keyword="+search_keyword;
		}
		var bo_id = $(this).find('td:eq(0) input[name=bo_id]').val();
		var rnum = $(this).find('td:eq(0)').text();
		$(location).attr('href', '${pageContext.request.contextPath}/member/board/boardView.do?bo_id='+bo_id+'&rnum='+rnum + search);
		
	});
	
});
</script>
<body>
<div id="boardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">게시판</div>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th scope="col" width="5%">No</th>
					<th scope="col" width="65%">제목</th>
					<th scope="col" width="10%">작성자</th>
					<th scope="col" width="10%">작성일</th>
					<th scope="col" width="10%">조회수</th>
				</tr>
			</thead>
			
			<c:if test="${empty boardList }">
				<tbody>
					<tr align="center">
						<td colspan="5"><font color="blue">등록된 게시글이 없습니다.</font></td>
					</tr>
				</tbody>	
			</c:if>
			<c:if test="${!empty boardList }">
				<tbody id="tbody">
				<c:forEach items="${boardList }" var="boardInfo">
					<tr>
						<td><input name="bo_id" type="hidden" value="${boardInfo.bo_id }"/>${boardInfo.rnum }</td>
						<td align="left">
							<c:forEach begin="1" end="${boardInfo.bo_depth }" varStatus="stat">
							&nbsp;&nbsp;&nbsp;
							<c:if test="${stat.last }">
								<i class="fa fa-angel-rignt"></i>
							</c:if>
							</c:forEach>
						${boardInfo.bo_title }</td>
						<td>${boardInfo.mem_id }</td>
						<td>${boardInfo.bo_time }</td>
						<td>${boardInfo.bo_hit }</td>
					</tr>
				 </c:forEach>
				</tbody>
			 </c:if>
		</table>
		${paginationHtmls }
	</div>
</div>
<div >
<form action="/member/board/boardList.do" method="get" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
			<option>검색조건</option>
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">작성자</option>
		</select>
	    <button type="submit" class="btn btn-primary form-control">검색</button>
	    <button type="button" id="insert" class="btn btn-info form-control">게시글 등록</button>
</form>
</div>	
</body>
</html>