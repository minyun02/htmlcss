package com.bitcamp.home.data;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class DataFormOkCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//파일업로드 위치의 절대경로 구하기
		String path = req.getServletContext().getRealPath("/upload");
		System.out.println("path--->"+path);
		
		//1. request 객체
		//2. 서버에 파일 업로그가 될 위치(절대경로)
		//3. 업로드 가능 최대 크기(byte단위)
		//4. Encoding
		//5. 파일명 rename
		int maxSize = 1024*1024*1024;
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		//form의 데이터와 파일업로드 완료
		MultipartRequest mr = new MultipartRequest(req, path, maxSize, "UTF-8", policy); //여기서 서버에 업로드가 됨
		
		DataVO vo = new DataVO();
		vo.setTitle(mr.getParameter("title"));
		vo.setContent(mr.getParameter("content"));
		
		HttpSession ses = req.getSession();
		vo.setUserid((String)ses.getAttribute("userid"));
		
		vo.setIp(req.getRemoteAddr());
		
		//form의 type속성이 file인 태그의 name 속성이 구해진다.
		Enumeration fileList = mr.getFileNames();
		while(fileList.hasMoreElements()) {
			//System.out.println(fileList.nextElement());
			String nameAttr = (String)fileList.nextElement(); //필드명
			String newFilename = mr.getFilesystemName(nameAttr);	//파일명 얻어오기(새로운 파일명)
			//mr.getOriginalFileName(nameAttr); //파일명 얻어오기(원래 파일명)
			System.out.println(newFilename+"-------------------------------------------------------------------");
			////////////////////////////////////////////////////////////////////3.31
		}
		return "";
	}

}
