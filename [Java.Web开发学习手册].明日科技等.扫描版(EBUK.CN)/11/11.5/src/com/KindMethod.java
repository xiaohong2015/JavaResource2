package com;

public class KindMethod {
	// 反向输出
	public static String reverse(String text) {
		return new StringBuffer(text).reverse().toString();
	}

	// 转换成大写字母
	public static String cape(String text) {
		return text.toUpperCase();
	}
}
