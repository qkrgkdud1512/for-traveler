package model;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import mybatis.Map;

public class Action_contents_select {
	static Action_contents_select model = new Action_contents_select();
	public static Action_contents_select instance(){
		return model;
	}


	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java 파일을 찾아옴

	public List<Dto> boaderlist(int number){
		List<Dto> list = null;
		
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList("tip_contentsview",number);//mapper에서 지정한 id 넣어주기
		sqlSession.close();
		return list;
	}
	
	
}



