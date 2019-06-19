<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="calendarDAO.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String cnt = request.getParameter("cnt");
	deleteCal(cnt);
	ai_setting();
%>
<jsp:forward page="calendar.jsp"></jsp:forward>

</body>
</html>
