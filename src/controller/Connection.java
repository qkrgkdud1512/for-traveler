package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Connection extends HttpServlet{

	@Override

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		request.setCharacterEncoding("utf-8");
	
		Cominterface inter = null; 
		
		String viewName = "";

		
		try {
			if(command.equals("select")){	
				inter = Service_select.instance();
				viewName = inter.showData(request, response);
				viewName = viewName;
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			else if(command.equals("select_contents")){	
				
				inter = Service_contents_select.instance();
				viewName = inter.showData(request, response);
				viewName = viewName;
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			else if(command.equals("insert")){	
		
				String a = new String(request.getParameter("title").getBytes("8859_1"),"UTF-8");
				inter = Service_insert.instance();							
				viewName = inter.showData(request, response);	
				viewName = viewName;
				request.getRequestDispatcher(viewName).forward(request, response);				
			}
			
			else if(command.equals("update")){
				String a = new String(request.getParameter("title").getBytes("8859_1"),"UTF-8");
				inter = Service_update.instance();
				viewName = inter.showData(request, response);
				viewName = viewName;
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			else if(command.equals("delete")){
				inter = Service_delete.instance();
				viewName = inter.showData(request, response);
				viewName = viewName;
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			else if(command.equals("com_select")){	
				inter = Com_select.instance();
				viewName = inter.showData(request, response);
				viewName = viewName;
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			
			else if(command.equals("com_insert")){	
		
				String a = new String(request.getParameter("title").getBytes("8859_1"),"UTF-8");
				inter = Com_insert.instance();							
				viewName = inter.showData(request, response);	
				viewName = viewName;
				request.getRequestDispatcher(viewName).forward(request, response);				
			}
			
			else if(command.equals("com_update")){
				String a = new String(request.getParameter("title").getBytes("8859_1"),"UTF-8");
				inter = Com_update.instance();
				viewName = inter.showData(request, response);
				viewName = viewName;
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
			else if(command.equals("com_delete")){
				inter = Com_delete.instance();
				viewName = inter.showData(request, response);
				viewName = viewName;
				request.getRequestDispatcher(viewName).forward(request, response);
			}
			
				
				else {
				viewName = "error.html";
				response.sendRedirect(viewName);
			}
		} catch (Exception e) {
			System.out.println("service err : " + e);
		}
	}
}


