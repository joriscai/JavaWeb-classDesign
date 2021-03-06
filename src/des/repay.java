package des;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class repay extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//设置响应头
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//连接数据库
		SQLhelper ls = new SQLhelper();
		ls.link();
		//获得请求参数
		String isbn = request.getParameter("isbn");
		String action = request.getParameter("action");
		//归还数据操作
		if(action.equals("repay")){
			try {
				ls.flag = ls.st.executeUpdate("update bookinfo set state='在库' where isbn='"+isbn+"'");
				out.print(ls.flag);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//搜索数据操作
		}else if (action.equals("search")) {
			try {
				ls.rs = ls.st.executeQuery("select * from bookinfo where isbn = "+isbn+"");
				if (!ls.rs.next()) {
					out.print("error");
					return;
				}
				JSONObject jsonObject = new JSONObject();
				for(int i=0;i<8;i++){
					jsonObject.put(i, ls.rs.getString(i+1));
				}
				out.print(jsonObject);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}