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
		
		MemberVO vo = new MemberVO();
		
		vo.setUserid(req.getParameter("userid"));
		vo.setUserpwd(req.getParameter("userpwd")); //아이디랑 비번을 받아와서 db에서 이름을 검색해서 vo에 set해준다.

		MemberDAO dao = MemberDAO.getInstance();
		
		dao.loginCheck(vo);
		
		//로그인 성공시 session에 필요한 데이터 저장
		if(vo.getUsername()!=null && !vo.getUsername().equals("")) {
			HttpSession ses = req.getSession();
			ses.setAttribute("userid", vo.getUserid());
			ses.setAttribute("username", vo.getUsername());
		}
		
		req.setAttribute("vo", vo);
		return "/member/loginOk.jsp";
	}

}
