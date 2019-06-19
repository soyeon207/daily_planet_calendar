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
	System.out.println("cnt : "+cnt);
	String content = SearchData(cnt);
	System.out.println("content : "+content);
	String[] c = content.split(",");
	

%>
<script>

	 location.href="calendar.jsp?title="+encodeURI("<%=c[0]%>"  , "UTF-8")+"&content="+encodeURI("<%=c[1]%>"  , "UTF-8")+"&cnt=<%=cnt%>"; 
</script> 

</body>
</html>
