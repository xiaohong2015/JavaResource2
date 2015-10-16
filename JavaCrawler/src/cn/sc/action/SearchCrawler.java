package cn.sc.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class SearchCrawler {
	
	public String getHtml(String url) throws Exception {
		String returnStr= "";
		
		URL u= new URL(url);
		HttpURLConnection hu= (HttpURLConnection) u.openConnection();
		if(hu.getResponseCode()== 200) {
			InputStream in= u.openStream();
			int ch= 0; 
			StringBuffer buf= new StringBuffer();
			while((ch= in.read())> -1) {
				buf.append((char)ch);
			}
			in.close();
			returnStr= new String(buf);
			returnStr= new String(returnStr.getBytes("ISO8859_1"), "UTF-8");
			
			hu.disconnect();
		}
		return returnStr;
	}

	public String getMp4(String html) {
		if(html== null) {
			return "";
		}
		int i= html.indexOf("<source src=");
		int j= html.indexOf(".mp4");
		if(i== -1|| j== -1) {
			return "";
		}
		String src= html.substring(i+13, j+4);
		return src;
	}
	
	public static void main(String[] args) throws Exception {
		File file= new File("E:\\1.txt");
		if(!file.exists()) {
			file.createNewFile();
		}
		
		FileOutputStream fos= new FileOutputStream(file, true);
		
		SearchCrawler sc= new SearchCrawler();
		String url= "http://www.jikexueyuan.com/course/";
		String result= "";
		for(int i= 456; i< 1000; i++) {
			//result= sc.getMp4(sc.getHtml(url+ i+ ".html"))+ "\n"; // 关闭
			if(result!= null&& !result.isEmpty()) {
				fos.write(result.getBytes());
				fos.flush();
				//System.out.println(result);
				System.out.println(i);
			}
		}
		fos.close();
	}

}
