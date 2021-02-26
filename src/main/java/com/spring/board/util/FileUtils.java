package com.spring.board.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.board.domain.LectureVO;

@Component("fileUtils")
public class FileUtils {
	
	private static final String filePath = "C:\\workspace\\SPRING_Project_InterClass\\src\\main\\webapp\\resources\\upload"; // 파일이 저장될 위치
	
	public List<Map<String, Object>> parseInsertFileInfo(LectureVO lectureVO, 
			MultipartHttpServletRequest mpRequest) throws Exception{
		
		/*
			Iterator은 데이터들의 집합체? 에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스 입니다.
			List나 배열은 순차적으로 데이터의 접근이 가능하지만, Map등의 클래스들은 순차적으로 접근할 수가 없습니다.
			Iterator을 이용하여 Map에 있는 데이터들을 while문을 이용하여 순차적으로 접근합니다.
		*/
		
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		
		String lectureImage = null; // 원래이름
		String lectureImageExtension = null;
		String lecsImage  = null;  // 나중이름
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int lectureNum = lectureVO.getLectureNum();
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				lectureImage = multipartFile.getOriginalFilename();
				lectureImageExtension = lectureImage.substring(lectureImage.lastIndexOf("."));
				lecsImage = getRandomString() + lectureImageExtension;
				
				file = new File(filePath + lectureImage);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("LECTUREIMAGE", lectureImage);
				listMap.put("LECSIMAGE", lecsImage);
				list.add(listMap);
			}
		}
		return list;
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
}