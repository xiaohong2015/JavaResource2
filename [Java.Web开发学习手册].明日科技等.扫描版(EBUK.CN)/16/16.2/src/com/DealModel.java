package com;

public class DealModel {
	public String check(String username,String pwd){
		String result="";
		System.out.println(username);
		if(username.equals("mr")){
			if(pwd.equals("mrsoft")){
				result="��¼�ɹ���<br>��ǰ��¼��Ա��<br>"+username;
			}else{
				result="err";
			}
		}else{
			result="err";
		}
		return result;
	}

}
