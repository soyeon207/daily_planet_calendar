<%@page import="com.mysql.fabric.Response"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.Connection"%>
<meta charset='utf-8' />
<%!
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<%
	String url ="jdbc:mysql://localhost:3306/daily_planet?useUnicode=yes&amp;characterEncoding=utf8&amp;useSSL=false&amp;serverTimezone=UTC";
	String user="daily_planet";
	String pw="mirim12345!";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,user,pw);
		System.out.println("DB 연결 성공");
	}catch(ClassNotFoundException e1){
		System.out.println("드라이버 로드문제");
		e1.printStackTrace();
	}catch(SQLException e2){
		System.out.println("SQLException: " + e2.getMessage());
		System.out.println("SQLState: " + e2.getSQLState());
		System.out.println("VendorError: " + e2.getErrorCode());
	}
%>

<%!


	public void insertCal(String start,String end,String content) {
		String insertcal = "insert into calendar (content,start_date,end_date) value (?, ?, ?)";
		System.out.println("insertCal");
		try{ 
			
			pstmt = conn.prepareStatement(insertcal); 
			pstmt.setString(1,content); 
			pstmt.setString(2,start); 
			pstmt.setString(3,end);
			
			pstmt.executeUpdate(); 
			System.out.println("Inserting calendar Successfully!"); 
			pstmt.close(); 
			conn.close(); 
			} 
		catch (Exception e){ 
			System.out.println(e.getMessage()); 
		} 
		finally{
			System.out.println("연결은 됨");
		}
	}
%>
