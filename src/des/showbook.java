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
		//设置响应头
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//连接数据库
		SQLhelper ls = new SQLhelper();
		ls.link();
		try {
			//获得数据条数
			ls.rs = ls.st.executeQuery("select count(*) from bookinfo");
			ls.rs.next();
			int rownum=ls.rs.getInt(1);
			//获得数据
			ls.rs = ls.st.executeQuery("select * from bookinfo");
			ls.rs.next();
			String[][] bookinfo = new String[rownum][8];
			for(int i=0;i<rownum;i++){
				bookinfo[i][0]=ls.rs.getString(1);
				bookinfo[i][1]=ls.rs.getString(2);
				bookinfo[i][2]=ls.rs.getString(3);
				bookinfo[i][3]=ls.rs.getString(4);
				bookinfo[i][4]=ls.rs.getString(5);
				bookinfo[i][5]=ls.rs.getString(6);
				bookinfo[i][6]=ls.rs.getString(7);
				bookinfo[i][7]=ls.rs.getString(8);
				ls.rs.next();
			}
			//返回前台
			request.setAttribute("bookinfo", bookinfo);
			request.setAttribute("rownum", rownum);
			request.getRequestDispatcher("showbook.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);

	}

}
