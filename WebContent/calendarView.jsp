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
	String cnt = request.getParameter("cnt");

	String content = SearchData(Integer.parseInt(cnt));
	
	
	String[] c = content.split(",");

%>
<script>

	 location.href="calendar.jsp?title="+encodeURI("<%=c[0]%>"  , "UTF-8")+"&content="+encodeURI("<%=c[1]%>"  , "UTF-8"); 
</script>

</body>
</html>