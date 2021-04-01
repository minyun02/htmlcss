package com.bitcamp.home.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.home.CommandService;

public class LoginOkCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//db조회를 위해서 vo에 아이디 비번 담아주기
		MemberVO vo = new MemberVO();
		
		vo.setUserid(req.getParameter("userid")); //로그인폼에서 아이디 리퀘스트해오기
		vo.setUserpwd(req.getParameter("userpwd"));
		
		MemberDAO dao = new MemberDAO();
		
		dao.loginCheck(vo);
		
		//db에서 username 불러왔으면 session에 아이디랑 이름 저장.
		if(vo.getUsername()!=null && !vo.getUsername().equals("")) {
			HttpSession ses = req.getSession();
			ses.setAttribute("userid", vo.getUserid());
			ses.setAttribute("username", vo.getUsername());
		}
		
		req.setAttribute("vo", vo);
		return "/member/loginOk.jsp";
	}

}
