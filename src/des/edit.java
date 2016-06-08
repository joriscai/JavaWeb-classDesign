package des;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class edit extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		linksql ls = new linksql();
		ls.link();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		if(action.equals("edit")){
			String isbn = request.getParameter("isbn");
			String bookname = request.getParameter("bookname");
			String authorname = request.getParameter("authorname");
			String publish = request.getParameter("publish");
			String time = request.getParameter("time");
			String price = request.getParameter("price");
			try {
				ls.rs = ls.st.executeUpdate("insert into bookinfo (ISBN,bookname,author,publish,time,price,state) values('"+isbn+"','"+bookname+"','"+authorname+"','"+publish+"','"+time+"','"+price+"','ÔÚ¿â')");
				ls.rs = ls.st.executeUpdate("DELETE FROM bookinfo WHERE NOT id IN (SELECT * FROM (SELECT MAX(id) FROM bookinfo GROUP BY isbn HAVING COUNT(ISBN) >= 1) AS b)");
				response.sendRedirect("bookmanager.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(action.equals("delete")){
			String isbn = request.getParameter("isbn");
			try {
				ls.rs = ls.st.executeUpdate("delete from bookinfo where isbn="+isbn+"");
				response.sendRedirect("showbook");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);

	}

}
