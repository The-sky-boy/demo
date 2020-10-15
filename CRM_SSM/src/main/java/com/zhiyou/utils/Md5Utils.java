package com.zhiyou.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Md5Utils {
	public static String md5(String password) {
		byte[] secretByte = null;
		try {
			// 生成一个MD5加密计算摘要，然后digest()最后确定返回md5 hash值
			secretByte = MessageDigest.getInstance("md5").digest(
					password.getBytes());
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("没有md5算法");
		}
		//BigInteger函数则将字符串转换成16进制
		String md5Password = new BigInteger(1, secretByte).toString(16);
		// 如果生成数字未满32位，需要前面补0
		for(int i = 0;i <32 - md5Password.length();i++) {
			md5Password = "0" + md5Password;
		}
		return md5Password;
	}
}
