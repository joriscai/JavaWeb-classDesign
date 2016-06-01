package des;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if(request.getParameter("username").endsWith("frank")&&request.getParameter("password").endsWith("frank")){
			session.setAttribute("username", request.getParameter("username"));
			response.sendRedirect("bookmanager.jsp");
			//request.getRequestDispatcher("bookmanager.jsp").forward(request, response);
		}else{
			response.sendRedirect("index.jsp");
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);

	}

}
