package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action_contents_select;
import model.Action_delete;
import model.Dto;

public class Com_delete implements Cominterface{
	
	static Com_delete del = new Com_delete();
	public static Com_delete instance() {
		return del;
	}
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int number=Integer.parseInt(request.getParameter("number"));
		Action_delete model = Action_delete.instance(); //싱글톤 객체
		model.userdelete(number);

		return "tip.do?command=select";

		
	
	}
}
