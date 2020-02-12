package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action_contents_select;
import model.Action_select;
import model.Dto;

public class Service_contents_select implements Cominterface{

	static Service_contents_select ser = new Service_contents_select();
	public static Service_contents_select instance() {
		return ser;
	}
	
	
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Action_contents_select model = Action_contents_select.instance(); //싱글톤 객체
		int number=Integer.parseInt(request.getParameter("number"));
		ArrayList<Dto> list = (ArrayList<Dto>)model.boaderlist(number);
		System.out.println(list);
		request.setAttribute("data", list);
		return "tip_boardview.jsp";

}
}
