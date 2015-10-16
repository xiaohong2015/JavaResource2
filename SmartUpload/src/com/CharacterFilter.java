package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class CharacterFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		
		arg1.setCharacterEncoding("UTF-8");
		CharacterResponse cr = new CharacterResponse((HttpServletResponse)arg1);
		PrintWriter out = arg1.getWriter();
		System.out.println(out);
		
		arg2.doFilter(arg0, cr);
		
		String str = cr.toString();
		if(str.indexOf("is") > 0) {
			String buf = str.replace("is", "5");
			out.print(buf);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
