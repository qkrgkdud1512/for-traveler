package model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import boarder.bean.BoardDto;
import model.Action_Com_update;
import mybatis.Map;

public class Action_Com_update {
	static Action_Com_update up = new Action_Com_update();
	public static Action_Com_update instance(){
		return up;
}
	
	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java 파일을 찾아옴
	

		
	public void userupdate(String title, String contents, int number){

		
		Dto dto = new Dto();
		dto.setTitle(title);
		dto.setContents(contents);
		dto.setNumber(number);
		
		SqlSession sqlSession = factory.openSession();
		sqlSession.update("tip_update",dto);//mapper에서 지정한 id 넣어주기
	    sqlSession.commit();
		sqlSession.close();
		
	}
}