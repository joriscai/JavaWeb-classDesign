package filter;

import java.io.IOException;

import javax.faces.validator.LengthValidator;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class viewFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String uri = req.getRequestURI();//�õ������ַ
		String file[] = uri.split("/");//ͨ���ָ�������������һ��ֵ������ҳ��
		//��Ƚ���file[file.lenght-1].equals("login.jsp")�Ϳ����ˡ�
//		if(file[file.length-1].equals("login.jsp")){}
//		System.out.println(!file[file.length-1].contains(".jsp"));
		if(file[file.length-1].contains(".jsp")
				&&req.getSession(true).getAttribute("username")==null
				&&!file[file.length-1].equals("index.jsp")){
		    res.sendRedirect("index.jsp");
		    return;
		} else {
		    chain.doFilter(request, response);
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
