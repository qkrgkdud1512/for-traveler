package boarder.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DB {
	Connection conn=null; 
	Statement stmt=null;	


public DB() {//db연결할때 무조건 두개 사용
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(Exception e) {
		
	}
}
public void Driver() { //드라이버연결해주는 함수,db 열어줌
	try {
		 conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/pro","root","gkdud0477");
	}catch(Exception e) {
		
	}
}

public void closed() {//db닫아주는 함수
	try{
		stmt.close();
	} catch(Exception ignored) {
	}
	try{
		conn.close();
	}catch (Exception ignored) {
	} 
	}
}
