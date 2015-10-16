package com.jifeng.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LrcProcessor {

	
	
	public void process(InputStream input,List<Long> timeMils,List<String> messages){
		
		try{
			InputStreamReader inputReader = new InputStreamReader(input);
			BufferedReader bufferedReader = new BufferedReader(inputReader);
			String temp = null;
			int i = 0;
			Pattern p = Pattern.compile("\\[([^\\]]+)\\]");
			String result = null;
			boolean b = true;
			while((temp = bufferedReader.readLine())!=null){
				i++;
				Matcher m = p.matcher(temp);
				if(m.find()){
					if(result != null){
						messages.add(result);
					}
					String timestr = m.group();
					Long timeMill = time2Long(timestr.substring(1,timestr.length() - 1));
					if(b){
						timeMils.add(timeMill);
					}
					String msg = temp.substring(10);
					result = ""+msg + "\n";
				}else {
					result = result + temp +"\n";
				}
			}
			messages.add(result);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public Long time2Long(String timestr){
		String s[]=timestr.split(":");
		int min = Integer.parseInt(s[0]);
		String ss[]=s[1].split("\\.");
		int sec = Integer.parseInt(ss[0]);
		int mill = Integer.parseInt(ss[1]);
		return min * 60 * 1000 + sec * 1000 + mill * 10L;
	}
	
}
