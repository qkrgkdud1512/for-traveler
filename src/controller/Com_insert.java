package controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.DateTimeException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action_Com_insert;
import model.Action_Com_select;
import model.Action_select;
import model.Action_update;
import model.Comment_Dto;
import model.Dto;


public class Com_insert implements Cominterface{
	
	static Com_insert in = new Com_insert();
	public static Com_insert instance() {
		return in;
	}


	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
        String b_number= request.getParameter("b_number");
		String comment_box = new String(request.getParameter("comment_box").getBytes("8859_1"),"UTF-8");
		String writer = request.getParameter("writer");

		
		Action_Com_insert in = Action_Com_insert.instance(); //싱글톤 객체
		Action_Com_select model = Action_Com_select.instance();
		ArrayList<Comment_Dto> list = (ArrayList<Comment_Dto>)model.com_list(b_number);
		
		in.cominsert(comment_box,writer);
		
		return "tip.do?command=select";
		
	}

}
