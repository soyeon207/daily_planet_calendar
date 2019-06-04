<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	request.setCharacterEncoding("UTF-8");
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	String content = request.getParameter("content");
	String title = request.getParameter("title");
	
	System.out.println(end);
	System.out.println(start+" "+end+" "+content);
	insertCal(start,end,content,title); 
	
%>
<jsp:forward page="calendar.jsp"></jsp:forward>
</body>
</html>