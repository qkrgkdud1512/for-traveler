package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import model.Action_Com_insert;
import mybatis.Map;

public class Action_Com_insert {
	static Action_Com_insert in = new Action_Com_insert();
	public static Action_Com_insert instance(){
		return in;
}

	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java 파일을 찾아옴
	
	public void cominsert(String comment_box,String writer) {	
		
		Comment_Dto dto = new Comment_Dto();

		dto.setComment_box(comment_box);
		dto.setWriter(writer);

		
		SqlSession sqlSession = factory.openSession();
		
		sqlSession.insert("com_insert",dto);//mapper에서 지정한 id 넣어주기
	    sqlSession.commit();
		sqlSession.close();
		
	}


}