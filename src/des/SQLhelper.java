package des;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

public class SQLhelper {
	public java.sql.Statement st = null;
	public java.sql.Connection ct = null;
	int flag;
	public ResultSet rs ;
	java.sql.PreparedStatement ps = null;
	//连接数据库
	public void link(){
		if (st==null) {
			try{	
				Class.forName("com.mysql.jdbc.Driver");
				ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?characterEncoding=utf8","root","");
				st = ct.createStatement(); 
				System.out.println("数据库连接成功！！！");			
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	//关闭数据库连接
}
		

