<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*"%>
<%
String na=request.getParameter("username");
String em=request.getParameter("email");
//out.print(na+em);
Connection conn=null;
Statement stmt=null;
try{
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useSSL=false&useUnicode=true&characterEncoding=utf8","root","gkdud0477");
if(conn == null)
	throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select * from userinfo where name='"+na+"' and email='"+em+"';");
if(rs.next()){
	String id = rs.getString("id");
	String name = rs.getString("name");
	String email = rs.getString("email");

	if(email.equals(em)){
		
	out.print("<script>location.href='header.jsp?pageChange=IDmessage.jsp?ID="+id+"';</script>");
    }

}
	else{
		out.println("<script>alert('입력하신 정보가 다릅니다'); history.back();</script>");
	}

}finally{
	try{
		stmt.close();
	}catch(Exception ignored){
	}
	try{
		conn.close();
	}catch(Exception ignored){
	}
}
%>
