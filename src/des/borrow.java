package des;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class borrow extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		linksql ls = new linksql();
		ls.link();
		String isbn = request.getParameter("isbn");
		String action = request.getParameter("action");
		try {
			if(action.equals("borrow")){
				ls.rs = ls.st.executeUpdate("update bookinfo set state='ря╫ХЁЖ' where isbn='"+isbn+"'");
			}
			ls.rs1 = ls.st.executeQuery("select count(*) from bookinfo where isbn = "+isbn+"");
			ls.rs1.next();
			int num = ls.rs1.getInt(1);
			ls.rs1 = ls.st.executeQuery("select isbn,bookname,author,publish,time,price,state from bookinfo where isbn = "+isbn+"");
			ls.rs1.next();
			String[][] info = new String[num][7];
			for(int i=0;i<num;i++){
				info[i][0] = ls.rs1.getString(1);
				info[i][1] = ls.rs1.getString(2);
				info[i][2] = ls.rs1.getString(3);
				info[i][3] = ls.rs1.getString(4);
				info[i][4] = ls.rs1.getString(5);
				info[i][5] = ls.rs1.getString(6);
				info[i][6] = ls.rs1.getString(7);
				ls.rs1.next();
			}
			request.setAttribute("info", info);
			request.setAttribute("num", num);
			request.getRequestDispatcher("borrow.jsp?id=second").forward(request, response);
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
