package des;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class borrow extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//������Ӧͷ
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//�������ݿ�
		SQLhelper ls = new SQLhelper();
		ls.link();
		//����������
		String isbn = request.getParameter("isbn");
		String action = request.getParameter("action");
		//���Ĳ���
		if(action.equals("borrow")){
			try {
				ls.flag = ls.st.executeUpdate("update bookinfo set state='�ѽ��' where isbn='"+isbn+"'");
				out.print(ls.flag);
			} catch (Exception e) {
				e.printStackTrace();
			}
			//��������
		}else if (action.equals("search")) {
			try {
				ls.rs = ls.st.executeQuery("select * from bookinfo where isbn = "+isbn+"");
				if (!ls.rs.next()) {
					out.print("error");
					return;
				}
				//����תΪjson
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
