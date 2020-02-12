package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.Map;

public class Action_select {
	static Action_select model = new Action_select();
	public static Action_select instance(){
		return model;
	}


	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java 파일을 찾아옴

	public List<Dto> userlist(){
		List<Dto> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("tip_select");//mapper에서 지정한 id 넣어주기
		sqlSession.close();
		return list;
	}
	
	
}



