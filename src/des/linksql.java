package des;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

public class linksql {
	java.sql.Statement st = null;
	java.sql.Connection ct = null;
	int rs ;
	ResultSet rs1 ;
	java.sql.PreparedStatement ps = null;
	public void link(){
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			st = ct.createStatement(); 
			System.out.println("数据库连接成功！！！");//jdbc:mysql://localhost:3306/test?user=root&password=frank
			//rs = st.execute("insert into info values('"+title+"')");
			//System.out.println("数据插入成功！！！");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
			public void close(){
				if(st!= null){
					try{
						st.close();
					}catch(Exception e){
						e.printStackTrace();
					}
					st=null;
				}
				if(ct !=null){
					try{
						ct.close();
					}catch(Exception e){
						e.printStackTrace();
					}
					ct=null;
				}
			
				/*if(rs != null){
					try{
						ct.close();
					}catch(Exception e){
						e.printStackTrace();
					}
					ct=null;
				}*/
		}
}
	

