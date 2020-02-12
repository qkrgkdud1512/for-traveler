package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import model.Action_insert;
import mybatis.Map;

public class Action_insert {
	static Action_insert in = new Action_insert();
	public static Action_insert instance(){
		return in;
}

	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java 파일을 찾아옴
	
	public void userinsert(String category,String title,String writer,String contents,int number) {	
		
		
		
		Dto dto = new Dto();
		dto.setCategory(category);
		dto.setTitle(title);
		dto.setWriter(writer);
		dto.setContents(contents);
		dto.setNumber(number);
		
		
		SqlSession sqlSession = factory.openSession();
		//System.out.println(title);
		sqlSession.insert("tip_insert",dto);//mapper에서 지정한 id 넣어주기
	    sqlSession.commit();
		sqlSession.close();
		
	}
}