package com.spring.biz.common;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class ImageUploadUtil {
	
	private static final String PROFILE_PATH= "ModooPlus/src/main/webapp/assets/img/avatar/";
	private static final String BOARD_PATH="ModooPlus/src/main/webapp/assets/img/board/";
	
	public static String getImgFileName(HttpServletRequest request, MultipartFile uploadFile, String type) {
		String path = request.getSession().getServletContext().getRealPath("/");
		path = path.substring(0, path.indexOf(".metadata"));
		
		String fileName = uuidFileName(uploadFile.getOriginalFilename());
		System.out.println("파일 이름: " + fileName);
		
		try {
			if(type.equals("profile")) {
				uploadFile.transferTo(new File(path+PROFILE_PATH+fileName));
			} else {
				uploadFile.transferTo(new File(path+BOARD_PATH+fileName));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		return fileName;
	}
	
	private static String uuidFileName(String originalFileName) {
	    UUID uuid = UUID.randomUUID();
	    return uuid.toString() + '_' + originalFileName;
	}
}
