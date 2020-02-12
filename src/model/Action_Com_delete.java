package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import model.Action_Com_delete;
import mybatis.Map;

public class Action_Com_delete {
	static Action_Com_delete del = new Action_Com_delete();
	public static Action_Com_delete instance(){
		return del;
}
		
private SqlSessionFactory factory = Map.getSqlSession(); //Map.java 파일을 찾아옴
	
	public void userdelete(int number){	
		
		Dto dto = new Dto();
		dto.setNumber(number);
		
		SqlSession sqlSession = factory.openSession();
		sqlSession.delete("tip_delete",dto);//mapper에서 지정한 id 넣어주기
	    sqlSession.commit();
		sqlSession.close();
			
		}	
	}
