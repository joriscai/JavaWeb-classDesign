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
		//���ݿ��½����Ӳ���
		linksql ls = new linksql();
		ls.link();
		//���÷���
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//��ȡsession
		HttpSession session = request.getSession();
		//����û�����
		try {
			ls.rs1 = ls.st.executeQuery("select * from login where username='"
					+user+"'");
			if (ls.rs1.next()) {				
				pwd = ls.rs1.getString("password");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//�ж��û������Ƿ�һ��
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
