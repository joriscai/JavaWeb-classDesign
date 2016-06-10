package des;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class search extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		linksql ls = new linksql();
		ls.link();
		String search = request.getParameter("search");
		String id = request.getParameter("id");
		char first = search.charAt(0);
		int num = 0;
		//System.out.println(first);
			try {
					if(id.equals("bookname")){
						ls.rs1 = ls.st.executeQuery("select count(*) from bookinfo where bookname like '"+search+"%'");
						ls.rs1.next();
						num = ls.rs1.getInt(1);
						if(num!=0){
							ls.rs1 = ls.st.executeQuery("select * from bookinfo where bookname like '"+search+"%'");
							ls.rs1.next();
						}else{
							ls.rs1 = ls.st.executeQuery("select count(*) from bookinfo where bookname like '%"+search+"%'");
							ls.rs1.next();
							num = ls.rs1.getInt(1);
							ls.rs1 = ls.st.executeQuery("select * from bookinfo where bookname like '%"+search+"%'");
							ls.rs1.next();
						}
					}else if(id.equals("author")){
						ls.rs1 = ls.st.executeQuery("select count(*) from bookinfo where author like '"+search+"%'");
						ls.rs1.next();
						num = ls.rs1.getInt(1);
						if(num!=0){
							ls.rs1 = ls.st.executeQuery("select * from bookinfo where author like '"+search+"%'");
							ls.rs1.next();
						}else{
							ls.rs1 = ls.st.executeQuery("select count(*) from bookinfo where author like '%"+search+"%'");
							ls.rs1.next();
							num = ls.rs1.getInt(1);
							ls.rs1 = ls.st.executeQuery("select * from bookinfo where author like '%"+search+"%'");
							ls.rs1.next();
						}
					}else if(id.equals("isbn")){
						ls.rs1 = ls.st.executeQuery("select count(*) from bookinfo where isbn like '"+search+"%'");
						ls.rs1.next();
						num = ls.rs1.getInt(1);
						if(num!=0){
							ls.rs1 = ls.st.executeQuery("select * from bookinfo where isbn like '"+search+"%'");
							ls.rs1.next();
						}else{
							ls.rs1 = ls.st.executeQuery("select count(*) from bookinfo where isbn like '%"+search+"%'");
							ls.rs1.next();
							num = ls.rs1.getInt(1);
							ls.rs1 = ls.st.executeQuery("select * from bookinfo where isbn like '%"+search+"%'");
							ls.rs1.next();
						}
					}
					String[][] info = new String[num][7];
					for(int i=0;i<num;i++){
						info[i][0] = ls.rs1.getString(1);
						info[i][1] = ls.rs1.getString(2);
						info[i][2] = ls.rs1.getString(3);
						info[i][3] = ls.rs1.getString(4);
						info[i][4] = ls.rs1.getString(5);
						info[i][5] = ls.rs1.getString(6);
						info[i][6] = ls.rs1.getString(7);
						ls.rs1.next();
					}
					request.setAttribute("info", info);
					request.setAttribute("num", num);
					if(num!=0){
						request.getRequestDispatcher("search.jsp").forward(request, response);
					}else{
						request.getRequestDispatcher("search.jsp?id=null").forward(request, response);
					}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);

	}

}
