package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boarder.bean.BoardDto;
import model.Action_update;
import model.Dto;

public class Service_update implements Cominterface{
	
	static Service_update up = new Service_update();
	public static Service_update instance() {
		return up;
	}
	
	


	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String number = request.getParameter("number");
		String title = new String(request.getParameter("title").getBytes("8859_1"),"UTF-8");
		String contents = new String(request.getParameter("contents").getBytes("8859_1"),"UTF-8");
		int num=Integer.parseInt(request.getParameter("number"));
		System.out.println(title+contents+num);
		Action_update up = Action_update.instance(); //싱글톤 객체
		up.userupdate(title, contents,num);
		return "tip.do?command=select";
	}

}
