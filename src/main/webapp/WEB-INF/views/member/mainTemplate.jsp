<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"/></title>
</head>
<body>
<tiles:insertAttribute name="header"></tiles:insertAttribute>
<div id="wrapper">
	<tiles:insertAttribute name="left"></tiles:insertAttribute>
	<div id="page-wrapper">
		<tiles:insertAttribute name="content_header"></tiles:insertAttribute>
		<div class="page-content">
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</div>
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
</div>
</body>
</html>