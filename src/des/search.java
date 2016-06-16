package des;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

public class search extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//设置响应头
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		//连接数据库
		SQLhelper ls = new SQLhelper();
		ls.link();
		//搜索字符串
		String search = request.getParameter("search");
		int num = 0;
		int result = 0;
		JSONObject jsonObject = new JSONObject();
		try {
			//获得数据条数，用于判断是否为空
			ls.rs1 = ls.st.executeQuery("select count(*) from bookinfo where (isbn like '%"+search+"%')" +
																	" or (bookname like '%"+search+"%')" +
																	" or (author like '%"+search+"%')");
			ls.rs1.next();
			result = ls.rs1.getInt(1);
			//获取数据
			ls.rs1 = ls.st.executeQuery("select * from bookinfo where (isbn like '%"+search+"%')" +
																	" or (bookname like '%"+search+"%')" +
																	" or (author like '%"+search+"%')");
			//获取数据表元元素
			ResultSetMetaData metaData = ls.rs1.getMetaData();
			int len = metaData.getColumnCount();
			//判断是否有数据
			if (result==0) {
				jsonObject.put("result", result);
			}else {
				jsonObject.put("result", result);
				JSONObject dataTemp = new JSONObject();
				while (ls.rs1.next()) {
					JSONObject temp = new JSONObject();	
					for (int i = 0; i < len; i++) {
						temp.put(metaData.getColumnName(i+1),ls.rs1.getString(i+1));
					}
					dataTemp.put(num, temp);
					num++;
				}
				jsonObject.put("data", dataTemp);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			//异常信息返回前台
			jsonObject.put("result", result);
			jsonObject.put("msg", e.getMessage());
		}
		out.print(jsonObject);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);

	}

}
