<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set value="${fn:split(requestScope ['javax.servlet.forward.request_uri'], '/')[1]  }" var="URLCategory"></c:set>
<c:set value="${fn:split(fn:split(requestScope ['javax.servlet.forward.request_uri'], '/')[2], '.')[0]  }" var="URLAction"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var URLCategory = '${URLCategory}';
	var URLAction = '${URLAction}';
	
	if(URLCategory == 'freeboard'){
		$('#URLCategory').text('자유게시판');
		$('#URLCategory').attr('href', '${pageContext.request.contextPath}/member/freeboard/freeboardList.door');
		
		$('#URLAction').text('게시글 목록');
		$('#URLAction').attr('href', '${pageContext.request.contextPath}/member/freeboard/freeboardList.door');
		
		if(URLAction == 'freeboardView'){
			$('#URLAction').text('게시글 조회');
		}else if(URLAction == 'freeboardForm'){
			$('#URLAction').text('게시글 작성');
		}else if(URLAction == 'freeboardReplyForm'){
			$('#URLAction').text('게시글 댓글 작성');
		}
	}else if(URLCategory == 'noticeboard'){
		$('#URLCategory').text('공지사항');
		$('#URLCategory').attr('href', '${pageContext.request.contextPath}/member/noticeboard/noticeboardList.door');
		
		$('#URLAction').text('게시글 목록');
		$('#URLAction').attr('href', '${pageContext.request.contextPath}/member/noticeboard/noticeboardList.door');
		
		if(URLAction == 'noticeboardView'){
			$('#URLAction').text('게시글 조회');
		}else if(URLAction == 'noticeboardForm'){
			$('#URLAction').text('게시글 작성');
		}
		
	}else if(URLCategory == 'fileboard'){
		$('#URLCategory').text('자료실');
		$('#URLCategory').attr('href', '${pageContext.request.contextPath}/member/fileboard/fileboardList.door');
		
		$('#URLAction').text('게시글 목록');
		$('#URLAction').attr('href', '${pageContext.request.contextPath}/member/fileboard/fileboardList.door');
		
		if(URLAction == 'fileboardView'){
			$('#URLAction').text('게시글 조회');
		}else if(URLAction == 'freeboardForm'){
			$('#URLAction').text('게시글 작성');
		}else if(URLAction == 'freeboardReplyForm'){
			$('#URLAction').text('게시글 댓글 작성');
		}
	}else if(URLCategory == 'qnaboard'){
		$('#URLCategory').text('Q&A게시판');
		$('#URLCategory').attr('href', '${pageContext.request.contextPath}/member/qnaboard/qnaboardList.door');
		
		$('#URLAction').text('게시글 목록');
		$('#URLAction').attr('href', '${pageContext.request.contextPath}/member/qnaboard/qnaboardList.door');
		
		if(URLAction == 'qnaboardView'){
			$('#URLAction').text('게시글 조회');
		}else if(URLAction == 'qnaboardForm'){
			$('#URLAction').text('게시글 작성');
		}else if(URLAction == 'qnaboardReplyForm'){
			$('#URLAction').text('게시글 댓글 작성');
		}
	}else if(URLCategory == 'thumbnailboard'){
		$('#URLCategory').text('썸네일 게시판');
		$('#URLCategory').attr('href', '${pageContext.request.contextPath}/member/thumbnailboard/thumbnailboardList.door');
		
		$('#URLAction').text('게시글 목록');
		$('#URLAction').attr('href', '${pageContext.request.contextPath}/member/thumbnailboard/thumbnailboardList.door');
		
		if(URLAction == 'thumbnailboardView'){
			$('#URLAction').text('게시글 조회');
		}else if(URLAction == 'thumbnailboardForm'){
			$('#URLAction').text('게시글 작성');
		}
	}else if(URLCategory == 'join'){
		$('#URLCategory').text('회원가입');
		$('#URLCategory').attr('href', '${pageContext.request.contextPath}/member/join/memberRegistForm.door');
		
		
		$('#URLAction').text('회원가입 폼');
		$('#URLAction').attr('href', '${pageContext.request.contextPath}/member/join/memberRegistForm.door');
	}else if(URLCategory == 'mypage.door'){
		$('#URLCategory').text('내 정보');
		$('#URLCategory').attr('href', '${pageContext.request.contextPath}/member/mypage.door');
		
		
		$('#URLAction').text('내 정보 수정');
		$('#URLAction').attr('href', '${pageContext.request.contextPath}/member/mypage.door');
	}
});
</script>
</head>
<body>
<div class="page-title-breadcrumb">
	<ol class="breadcrumb">
		<li><i class="fa fa-home"></i>&nbsp;<a href="${pageContext.request.contextPath }/member/noticeboard/noticeboardList.door">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li><a id="URLCategory">Door</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
		<li><a id="URLAction">Door</a></li>
	</ol>
	<div class="clearfix"></div>
</div>
</body>
</html>