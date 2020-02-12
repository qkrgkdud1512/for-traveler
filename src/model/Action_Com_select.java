package model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import mybatis.Map;

public class Action_Com_select {
	static Action_Com_select model = new Action_Com_select();
	public static Action_Com_select instance(){
		return model;
	}


	private SqlSessionFactory factory = Map.getSqlSession(); //Map.java 파일을 찾아옴

	public List<Comment_Dto> com_list(String b_number){
		
		List<Comment_Dto> list = null;
		
		String num = b_number;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("com_select",num);//mapper에서 지정한 id 넣어주기
		
		sqlSession.close();
		
		return list;
	}	
}



