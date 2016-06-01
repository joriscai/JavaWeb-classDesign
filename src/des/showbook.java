package des;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class showbook extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		linksql ls = new linksql();
		ls.link();
		try {
			ls.rs1 = ls.st.executeQuery("select count(*) from bookinfo");
			ls.rs1.next();
			int rownum=ls.rs1.getInt(1);
			ls.rs1 = ls.st.executeQuery("select isbn,bookname,author,publish,time,price,state from bookinfo");
			ls.rs1.next();
			String[][] bookinfo = new String[rownum][7];
			for(int i=0;i<rownum;i++){
				bookinfo[i][0]=ls.rs1.getString(1);
				bookinfo[i][1]=ls.rs1.getString(2);
				bookinfo[i][2]=ls.rs1.getString(3);
				bookinfo[i][3]=ls.rs1.getString(4);
				bookinfo[i][4]=ls.rs1.getString(5);
				bookinfo[i][5]=ls.rs1.getString(6);
				bookinfo[i][6]=ls.rs1.getString(7);
				ls.rs1.next();
			}
			request.setAttribute("bookinfo", bookinfo);
			request.setAttribute("rownum", rownum);
			request.getRequestDispatcher("showbook.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);

	}

}
