package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Action_Com_insert;
import model.Action_Com_select;
import model.Comment_Dto;




public class Com_select implements Cominterface{

	static Com_select ser = new Com_select();
	public static Com_select instance() {
		return ser;
	}
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String b_number=request.getParameter("b_number");
		
		Action_Com_select model = Action_Com_select.instance(); //싱글톤 객체
		
		ArrayList<Comment_Dto> com_list = (ArrayList<Comment_Dto>)model.com_list(b_number);
		
		request.setAttribute("data", com_list);
		
		return "tip_boardview.jsp";

}
}
