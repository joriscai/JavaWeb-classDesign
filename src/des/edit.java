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
		//连接数据库
		SQLhelper ls = new SQLhelper();
		ls.link();
		//设置响应头
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		//获得请求参数
		String action = request.getParameter("action");
		String isbn = request.getParameter("isbn");
		String bookname = request.getParameter("bookname");
		String authorname = request.getParameter("authorname");
		String publish = request.getParameter("publish");
		String time = request.getParameter("time");
		String price = request.getParameter("price");
		
		JSONObject jsonObject = new JSONObject();
		//添加图书
		if(action.equals("add")){
			try {
				ls.flag = ls.st.executeUpdate("insert into bookinfo (ISBN,bookname,author,publish,time,price,state) values('"+isbn+"','"+bookname+"','"+authorname+"','"+publish+"','"+time+"','"+price+"','在库')");
				jsonObject.put("result", ls.flag);
			} catch (SQLException e) {
				e.printStackTrace();
				jsonObject.put("result", ls.flag);
				jsonObject.put("msg", e.getMessage());
			}
		}
		//编辑图书
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
		//删除图书
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
