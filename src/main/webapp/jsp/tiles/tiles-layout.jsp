<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="today" class="java.util.Date" /> 
<fmt:formatDate value="${today}" pattern="yyyyMMddhhmmss" var="nowDate" />
<!DOCTYPE html>
<html>
	<head>
		<tiles:insertAttribute name="common_style" />
		<link rel="stylesheet" type="text/css" 	href="<c:url value="${css}"><c:param name="dt" value="${nowDate}"/></c:url>" />
		<meta charset="UTF-8">
		<title>${title}</title>
	</head>
	<body>
		<tiles:insertAttribute name="header" />
		<div class="main_section">
			<tiles:insertAttribute name="body" />
		</div>
		<tiles:insertAttribute name="footer" />
		<tiles:insertAttribute name="popup" />
		<tiles:insertAttribute name="common_script" />
	</body>
</html>