package kr.or.ddit.utils;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpSession;

public class CryptoGenerator {
	// 비대칭키 암호화 알고리즘 패턴 적용
	// * 페어로 생성하고, 1회 사용 후 폐기
	// 개인키(서버[session] : private key - 복호화),
	// 공개키(클라이언트 : public key - 암호화)
	public static Map<String, String> getGeneratePairKey(HttpSession session){
		// 개인키, 공개키 생성
		KeyPairGenerator keyGenerator = null;
		
		// 생성된 개인키, 공개키 포함
		KeyPair keyPair = null;
		PublicKey publicKey = null;
		PrivateKey privateKey = null;
		
		// 클라이언트에 제공되는 공개키(가수부, 지수부 구분)
		KeyFactory keyFactory = null;
		Map<String, String> publicKeyMap = new HashMap<String, String>();
		
		//RSA(MIT 공대 3인의 공학자가 1964년 최초 개발한 암호화 알고리즘)
		// 한국인터넷진흥원 : RSA암호화 알고리즘 + SHA2 병행 사용 권장.
		
		try {
			keyGenerator = KeyPairGenerator.getInstance("RSA");
			// 공개키, 개인키 생성 시 사이즈 설정 : byte 단위
			// 								짝수 설정
			keyGenerator.initialize(2048);
			
			// 공개키, 개인키 생성
			keyPair = keyGenerator.generateKeyPair();
			
			// 공개키 취득
			publicKey = keyPair.getPublic();
			
			// 개인키 취득
			privateKey = keyPair.getPrivate();
			session.setAttribute("privateKey", privateKey);
			
			// 공개키(Double Type)를 가수부, 지수부 구분하여 클라이언트에 제공
			// -1483.74837483247382
			// float type(32bit 단정도 소수) : 부호비트 1bit(양수0|음수1) + 지수(소수점자리수 : 8bit) + 가수 23bit(실수)
			// double type(64bit 배정도 소수) : 부호비트 1bit(양수0|음수1) + 지수 11bit + 가수 52bit
			keyFactory = KeyFactory.getInstance("RSA");
			RSAPublicKeySpec publicKeySpec = (RSAPublicKeySpec)keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			
			// 공개키 가수부
			String publicModulus = publicKeySpec.getModulus().toString(16);
			// 공개키 지수부
			String publicExponent = publicKeySpec.getPublicExponent().toString(16);
			
			publicKeyMap.put("publicModulus", publicModulus);
			publicKeyMap.put("publicExponent", publicExponent);
			
			
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}
		
		return publicKeyMap;
	}
	
	// 암호문을 대상으로 평문으로 복호화(개인키[session] : private key)
	public static String decryptRSA(HttpSession session, String secureValue){
		//비밀키 취득
		PrivateKey privateKey = (PrivateKey)session.getAttribute("privateKey");
		
		String returnValue = "";
		
		try {
			Cipher cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			
			byte[] targetByte = hexToByteArray(secureValue);
			
			byte[] beforeString = cipher.doFinal(targetByte);
			
			returnValue = new String(beforeString, "UTF-8");
		} catch (NoSuchAlgorithmException | NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return returnValue;
	}
	
	// 16진수 암호문을 byte값으로 치환 제공
	private static byte[] hexToByteArray(String secureValue) {
		if(secureValue == null || secureValue.length()%2 != 0){
			return new byte[]{};
		}
		byte[] bytes = new byte[secureValue.length()/2];
		for(int i=0; i<secureValue.length(); i+=2){
			byte value = (byte)Integer.parseInt(secureValue.substring(i,i+2), 16);
			bytes[(int)Math.floor(i/2)] = value;
		}
		return bytes;
	}
}
