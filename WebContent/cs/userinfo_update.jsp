<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); 
String s = (String)session.getAttribute("ADDR");
String [] s1 = s.split("/");%>
<%
String se=null;
se=(String)session.getAttribute("NAME");
String pn=request.getParameter("userphone");
String pc=request.getParameter("sample6_postcode");
String ad1=request.getParameter("sample6_address");
String ad2=request.getParameter("addr1");
String pw=request.getParameter("pw_1");

Connection conn=null;
Statement stmt=null;
try{
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useSSL=false&useUnicode=true&characterEncoding=utf8","root","gkdud0477");
if(conn == null)
	throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
stmt=conn.createStatement();
String command ="update userinfo set phone='"+pn+"',"+"postcode='"+pc+"',"+"addr='"+ad1+"/"+ad2+"',"+"pw='"+pw+"'"+" where name='"+se+"';";

System.out.print(command);
int rowNum = stmt.executeUpdate(command);
if(rowNum<1){
	out.println("<script>alert('Error');");
	}
}
	finally{
	try{
		stmt.close();
	}catch(Exception e){
	}
	try{
		conn.close();
	}catch(Exception e){
	}
}
RequestDispatcher dispatcher=request.getRequestDispatcher("Loginheader.jsp?pageChange=mypage.jsp");
dispatcher.forward(request,response);
%>