package com;

public class KindMethod {
	// �������
	public static String reverse(String text) {
		return new StringBuffer(text).reverse().toString();
	}

	// ת���ɴ�д��ĸ
	public static String cape(String text) {
		return text.toUpperCase();
	}
}
