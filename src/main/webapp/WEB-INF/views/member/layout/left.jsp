<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set value="${fn:split(requestScope ['javax.servlet.forward.request_uri'], '/')[1]  }" var="currentURI"></c:set>
<%-- <c:set value="${fn:split(currentURI, '.')[0]  }" var="currentURI"></c:set> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var currentURI = '${currentURI}';
	if(currentURI == 'noticeboard'){
		$('.leftbar:eq(0)').attr('class', 'active');
	}else if(currentURI == 'freeboard'){
		$('.leftbar:eq(1)').attr('class', 'active');
	}else if(currentURI == 'fileboard'){
		$('.leftbar:eq(2)').attr('class', 'active');
	}else if(currentURI == 'qnaboard'){
		$('.leftbar:eq(3)').attr('class', 'active');
	}else if(currentURI == 'thumbnailboard'){
		$('.leftbar:eq(4)').attr('class', 'active');
	}else{
// 		$('.leftbar:eq(0)').attr('class', 'active');
	}
});
</script>
</head>
<body>
<!--BEGIN SIDEBAR MENU-->
<nav id="sidebar" role="navigation" data-step="2"
	data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
	data-position="right" class="navbar-default navbar-static-side">
	<div class="sidebar-collapse menu-scroll">
		<ul id="side-menu" class="nav">
			<div class="clearfix"></div>
			<li class="leftbar">
				<a href="${pageContext.request.contextPath}/member/noticeboard/noticeboardList.door">
					<i class="fa fa-tachometer fa-fw"><div class="icon-bg bg-orange"></div></i>
					<span class="menu-title">공지사항</span>
				</a>
			</li>
			<li class="leftbar">
				<a href="${pageContext.request.contextPath}/member/freeboard/freeboardList.door">
					<i class="fa fa-desktop fa-fw"><div class="icon-bg bg-pink"></div></i>
					<span class="menu-title">자유게시판</span>
				</a>
			</li>
			<li class="leftbar">
				<a href="/member/fileboard/fileboardList.door">
					<i class="fa fa-send-o fa-fw"><div class="icon-bg bg-green"></div></i>
					<span class="menu-title">자료실</span>
				</a>
			</li>
			<li class="leftbar">
				<a href="/member/qnaboard/qnaboardList.door">
					<i class="fa fa-edit fa-fw"><div class="icon-bg bg-violet"></div></i>
					<span class="menu-title">Q&A게시판</span>
				</a>
			</li>
			<li class="leftbar">
				<a href="${pageContext.request.contextPath }/member/thumbnailboard/thumbnailboardList.door">
					<i class="fa fa-database fa-fw"><div class="icon-bg bg-red"></div></i>
					<span class="menu-title">썸네일 게시판</span>
				</a>
			</li> 
		</ul>
	</div>
</nav>
</body>
</html>