package des;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class edit extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//�������ݿ�
		SQLhelper ls = new SQLhelper();
		ls.link();
		//������Ӧͷ
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		//����������
		String action = request.getParameter("action");
		String isbn = request.getParameter("isbn");
		String bookname = request.getParameter("bookname");
		String authorname = request.getParameter("authorname");
		String publish = request.getParameter("publish");
		String time = request.getParameter("time");
		String price = request.getParameter("price");
		
		JSONObject jsonObject = new JSONObject();
		//���ͼ��
		if(action.equals("add")){
			try {
				ls.flag = ls.st.executeUpdate("insert into bookinfo (ISBN,bookname,author,publish,time,price,state) values('"+isbn+"','"+bookname+"','"+authorname+"','"+publish+"','"+time+"','"+price+"','�ڿ�')");
				jsonObject.put("result", ls.flag);
			} catch (SQLException e) {
				e.printStackTrace();
				jsonObject.put("result", ls.flag);
				jsonObject.put("msg", e.getMessage());
			}
		}
		//�༭ͼ��
		if(action.equals("edit")){
			try {
				ls.flag = ls.st.executeUpdate("update bookinfo set bookname='"+bookname
												+"', author='"+authorname
												+"', publish='"+publish
												+"', TIME='"+time
												+"', price='"+price
												+"' where isbn='"+isbn+"'");
				jsonObject.put("result", ls.flag);
			} catch (SQLException e) {
				e.printStackTrace();
				jsonObject.put("result", ls.flag);
				jsonObject.put("msg", e.getMessage());
			}
		}
		//ɾ��ͼ��
		if(action.equals("delete")){
			try {
				ls.flag = ls.st.executeUpdate("delete from bookinfo where isbn="+isbn+"");
				jsonObject.put("result", ls.flag);
			} catch (SQLException e) {
				e.printStackTrace();
				jsonObject.put("result", ls.flag);
				jsonObject.put("msg", e.getMessage());
			}
			
		}
		out.print(jsonObject);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);

	}

}
