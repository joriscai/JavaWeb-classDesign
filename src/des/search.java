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
		//������Ӧͷ
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		//�������ݿ�
		SQLhelper ls = new SQLhelper();
		ls.link();
		//�����ַ���
		String search = request.getParameter("search");
		int num = 0;
		int result = 0;
		JSONObject jsonObject = new JSONObject();
		try {
			//������������������ж��Ƿ�Ϊ��
			ls.rs1 = ls.st.executeQuery("select count(*) from bookinfo where (isbn like '%"+search+"%')" +
																	" or (bookname like '%"+search+"%')" +
																	" or (author like '%"+search+"%')");
			ls.rs1.next();
			result = ls.rs1.getInt(1);
			//��ȡ����
			ls.rs1 = ls.st.executeQuery("select * from bookinfo where (isbn like '%"+search+"%')" +
																	" or (bookname like '%"+search+"%')" +
																	" or (author like '%"+search+"%')");
			//��ȡ���ݱ�ԪԪ��
			ResultSetMetaData metaData = ls.rs1.getMetaData();
			int len = metaData.getColumnCount();
			//�ж��Ƿ�������
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
			//�쳣��Ϣ����ǰ̨
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
