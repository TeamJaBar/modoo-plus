package com.spring.biz.common;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

public class ImageUploadUtil {
	
	private static final String PROJECT_NAME="ModooPlus";
	private static final String PROFILE_PATH="/src/main/webapp/assets/img/avatar";
	private static final String BOARD_PATH="/src/main/webapp/assets/img/board";
	private static final String TOMCAT_PROFILE_PATH = "assets/img/avatar";
	private static final String TOMCAT_BOARD_PATH = "assets/img/board";
	
	public static String getImgFileName(HttpServletRequest request, MultipartFile uploadFile, String type) {
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		String path = rootPath.substring(0, rootPath.indexOf(".metadata"));
		
		System.out.println(rootPath);
		
		String fileName = uuidFileName(uploadFile.getOriginalFilename());
		System.out.println("파일 이름: " + fileName);
		
		try {
			if(type.equals("profile")) {
				makeFolder(path+PROJECT_NAME+PROFILE_PATH);
				uploadFile.transferTo(new File(path+PROJECT_NAME+PROFILE_PATH+"/"+fileName));
				makeFolder(rootPath+TOMCAT_PROFILE_PATH);
				fileUtilsCopy(path+PROJECT_NAME+PROFILE_PATH+"/"+fileName, rootPath+TOMCAT_PROFILE_PATH+"/"+fileName);
				
			} else {
				makeFolder(path+PROJECT_NAME+BOARD_PATH);
				uploadFile.transferTo(new File(path+PROJECT_NAME+BOARD_PATH+"/"+fileName));
				makeFolder(rootPath+TOMCAT_BOARD_PATH);
				fileUtilsCopy(path+PROJECT_NAME+BOARD_PATH+"/"+fileName, rootPath+TOMCAT_BOARD_PATH+"/"+fileName);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}	
		
		return fileName;
	}
	
	private static boolean fileUtilsCopy(String inPath, String outPath) {
		File orgFile = new File(inPath);
		File outFile = new File(outPath);
		
		try {
			FileUtils.copyFile(orgFile, outFile);
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
		
	}
	
	private static void makeFolder(String path) {
		File folder = new File(path);

		// 해당 디렉토리가 없다면 디렉토리를 생성.
		if (!folder.exists()) {
			try {
			    folder.mkdir(); //폴더 생성
			    System.out.println("\t[이미지 업로드 로그] : 폴더 생성완료");
			}
		    catch(Exception e){
			    e.getStackTrace();
			    return;
			}        
	    } else {
			System.out.println("\t[이미지 업로드 로그] : 폴더가 이미 존재합니다");
		}
	}
	
	private static String uuidFileName(String originFileName) {
	    UUID uuid = UUID.randomUUID();
	    return uuid.toString() + '_' + originFileName;
	}
}
