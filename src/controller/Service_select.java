package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action_insert;
import model.Action_select;
import model.Dto;

public class Service_select implements Cominterface{

	static Service_select ser = new Service_select();
	public static Service_select instance() {
		return ser;
	}
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Action_select model = Action_select.instance(); //싱글톤 객체
		ArrayList<Dto> list = (ArrayList<Dto>)model.userlist();
		Action_insert in = Action_insert.instance(); //싱글톤 객체
		
		Action_select model2 = Action_select.instance();
		ArrayList<Dto> list2 = (ArrayList<Dto>)model.userlist();
		
		
		int number = list.size()-1;
		
		request.setAttribute("data", list);
		return "tip_view.jsp";

}
}
