package des;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

public class linksql {
	public java.sql.Statement st = null;
	public java.sql.Connection ct = null;
	int rs;
	public ResultSet rs1 ;
	java.sql.PreparedStatement ps = null;
	//�������ݿ�
	public void link(){
		if (st==null) {
			try{	
				Class.forName("com.mysql.jdbc.Driver");
				ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?characterEncoding=utf8","root","");
				st = ct.createStatement(); 
				System.out.println("���ݿ����ӳɹ�������");			
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	//�ر����ݿ�����
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
	}
}
		

