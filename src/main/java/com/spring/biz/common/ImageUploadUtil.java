package com.spring.biz.common;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class ImageUploadUtil {
	
	private static final String PROFILE_PATH= "ModooPlus/src/main/webapp/assets/img/avatar";
	private static final String BOARD_PATH="ModooPlus/src/main/webapp/assets/img/board";
	
	public static String getImgFileName(HttpServletRequest request, MultipartFile uploadFile, String type) {
		String path = request.getSession().getServletContext().getRealPath("/");
		path = path.substring(0, path.indexOf(".metadata"));
		
		String fileName = uuidFileName(uploadFile.getOriginalFilename());
		System.out.println("파일 이름: " + fileName);
		
		try {
			if(type.equals("profile")) {
				makeFolder(type);
				uploadFile.transferTo(new File(path+PROFILE_PATH+"/"+fileName));
			} else {
				makeFolder(type);
				uploadFile.transferTo(new File(path+BOARD_PATH+"/"+fileName));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}	
		
		return fileName;
	}
	
	private static void makeFolder(String type) {
		File folder;
		if(type.equals("profile")) {
			folder = new File(PROFILE_PATH);
		} else {
			 folder = new File(BOARD_PATH);
		}

		// 해당 디렉토리가 없다면 디렉토리를 생성.
		if (!folder.exists()) {
			try{
			    folder.mkdir(); //폴더 생성
			    System.out.println("폴더가 생성완료.");
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}        
	         }else {
			System.out.println("폴더가 이미 존재합니다..");
		}
	}
	
	private static String uuidFileName(String originalFileName) {
	    UUID uuid = UUID.randomUUID();
	    return uuid.toString() + '_' + originalFileName;
	}
}
