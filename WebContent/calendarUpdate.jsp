<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ include file="calendarDAO.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String cnt = request.getParameter("cnt");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String cntInt = request.getParameter("cnt");
	UpdateCal(cntInt,title,content);
%>
<jsp:forward page="calendar.jsp"></jsp:forward>

</body>
</html>
