package com.bjsxt.web.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String filePath =getServletContext().getRealPath("WEB-INF/ajax3.avi");
		FileInputStream in =new FileInputStream(filePath);
		//表示类型是不确定的
		response.setContentType("application/x-download");
//		response.setCharacterEncoding("UTF-8");
		String fileName ="视频";
		fileName =new String(fileName.getBytes("GB18030"),"ISO8859-1");
		response.setHeader("Content-Disposition", "filename="+fileName+".avi");
		
		ServletOutputStream os =response.getOutputStream();
		byte[] buf =new byte[100*1024];
		int len =0;
		while(  (len=in.read(buf)) !=-1 ){
			os.write(buf, 0, len);
		}
		os.flush();
		os.close();
	}

}
