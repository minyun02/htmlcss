package com.bitcamp.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class WriteCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//글쓰기 폼
		String viewFilename = "";
		
		HttpSession ses = req.getSession();
		String sesUserid = (String)ses.getAttribute("userid"); 
		
		if(sesUserid!=null && !sesUserid.equals("")){//로그인 글쓰기 폼
			viewFilename = "/board/boardForm.jsp"; 
		}else {//로그인X 로그인 폼
			viewFilename = "/member/login.jsp";
		}
		return viewFilename;
	}

}
