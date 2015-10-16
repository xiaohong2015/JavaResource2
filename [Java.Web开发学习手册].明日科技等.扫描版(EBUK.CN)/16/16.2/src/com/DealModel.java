package com;

public class DealModel {
	public String check(String username,String pwd){
		String result="";
		System.out.println(username);
		if(username.equals("mr")){
			if(pwd.equals("mrsoft")){
				result="登录成功！<br>当前登录会员：<br>"+username;
			}else{
				result="err";
			}
		}else{
			result="err";
		}
		return result;
	}

}
