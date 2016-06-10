package des;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login extends HttpServlet {
	Object pwd;
	String user = null;
	String password = null;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		user = request.getParameter("username");
		//数据库新建连接操作
		linksql ls = new linksql();
		ls.link();
		//设置返回
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//获取session
		HttpSession session = request.getSession();
		//获得用户密码
		try {
			ls.rs1 = ls.st.executeQuery("select * from login where username='"
					+user+"'");
			if (ls.rs1.next()) {				
				pwd = ls.rs1.getString("password");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//判断用户密码是否一致
		if (request.getParameter("password").equals(pwd)) {
			session.setAttribute("username", request.getParameter("username"));
			out.print("success");
		}else{
			out.print("error");
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);

	}

}
