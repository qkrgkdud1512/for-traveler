package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action_insert;
import model.Action_select;
import model.Dto;



public class Service_insert implements Cominterface{
	
	static Service_insert in = new Service_insert();
	public static Service_insert instance() {
		return in;
	}


	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		

		
		String category = new String(request.getParameter("category").getBytes("8859_1"),"UTF-8");
		String title = new String(request.getParameter("title").getBytes("8859_1"),"UTF-8");
		String writer = request.getParameter("writer");
		String contents = new String(request.getParameter("contents").getBytes("8859_1"),"UTF-8");
		//System.out.println(title);

		Action_insert in = Action_insert.instance(); //싱글톤 객체
		
		Action_select model = Action_select.instance();
		ArrayList<Dto> list = (ArrayList<Dto>)model.userlist();
		
		
		int number = list.size()+1;
		
		in.userinsert(category,title,writer,contents,number);
		
		return "tip.do?command=select";
		
	}

}
