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

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		linksql ls = new linksql();
		ls.link();
		String isbn = request.getParameter("isbn");
		String action = request.getParameter("action");
		
		if(action.equals("repay")){
			try {
				ls.rs = ls.st.executeUpdate("update bookinfo set state='ÔÚ¿â' where isbn='"+isbn+"'");
				out.print(ls.rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (action.equals("search")) {
			try {
				ls.rs1 = ls.st.executeQuery("select * from bookinfo where isbn = "+isbn+"");
				if (!ls.rs1.next()) {
					out.print("error");
					return;
				}
				JSONObject jsonObject = new JSONObject();
				for(int i=0;i<8;i++){
					jsonObject.put(i, ls.rs1.getString(i+1));

				}
				out.print(jsonObject);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);

	}

}