package boarder.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Date;

import boarder.bean.WithDto;

public class With_dao {
	
	Connection conn=null; 
	Statement stmt=null;
	
	public With_dao() {//db연결할때 무조건 두개 사용
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e) {
			
		}
	}
	public void Driver() { //드라이버연결해주는 함수,db 열어줌
		try {
			 conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/data?useSSL=false&useUnicode=true&characterEncoding=utf8","root","gkdud0477");
		}catch(Exception e) {
			
		}
	}

	public void closed() {//db닫아주는 함수
		try{
			stmt.close();
		} catch(Exception e) {
		}
		try{
			conn.close();
		}catch (Exception e) {
		} 
		}
	
	public Date Date() { //투어날짜
		Date date = new Date(0);
		return date;
	}
	
	public  Date Writedate() { // 글작성일
		Date writedate = new Date(0);
		return writedate;
	}
	
	public  Date Limitdate() { // 마감일
		Date limitdate = new Date(0);
		return limitdate;
	}
	
	public ArrayList<WithDto> List() {
		ArrayList<WithDto> withlist = new ArrayList<WithDto>();
		try {
			String command = "select * from with order by num desc;";
			ResultSet rs=stmt.executeQuery(command);
			while(rs.next()) {
				
				WithDto dto=new WithDto();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setDate(rs.getDate("date"));
				dto.setPeople(rs.getInt("people"));
				dto.setLimit(rs.getString("limit"));
				dto.setPhoto(rs.getString("photo"));
				dto.setWritedate(rs.getDate("writedate"));
				dto.setLimitdate(rs.getDate("limitdate"));
				dto.setWriter(rs.getString("writer"));
				dto.setLocalcontent(rs.getString("localcontent"));
				dto.setContents(rs.getString("contents"));

				withlist.add(dto);
			}
			stmt.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		return withlist;

		
		
	}

	}//끝
	
	
	


