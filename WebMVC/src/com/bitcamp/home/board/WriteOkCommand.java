package com.bitcamp.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class WriteOkCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//1.필요한 데이터 받기
		BoardVO vo = new BoardVO();
		HttpSession ses = req.getSession();
		String sesUserid = (String)ses.getAttribute("userid");
		String viewFilename = "";
		if(sesUserid!=null && !sesUserid.equals("")) {//로그인일때
			//제목
			vo.setSubject(req.getParameter("subject"));
			//글내용
			vo.setContent(req.getParameter("content"));
			//아이피
			vo.setIp(req.getRemoteAddr());
			//작성자
			//vo.setUserid((String)ses.getAttribute("userid"));
			vo.setUserid(sesUserid);
			
			//2. DB에 넣기
			BoardDAO dao = new BoardDAO();
			int result = dao.oneRecordInsert(vo);
			req.setAttribute("result", result);
			
			viewFilename = "/board/writeok.jsp";
		}else {//로그인 아닐때
			viewFilename = "/member/login.jsp";
		}
//		if(result>0) {//글 등록 성공
//			System.out.println("글 등록 성공!!!!!!!!!!!!!!!!!!!!!!");
//		}else {
//			System.out.println("글 등록 실패ㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜㅜ");
//		}
		return viewFilename;
	}

}