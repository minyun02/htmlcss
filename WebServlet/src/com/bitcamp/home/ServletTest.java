package com.bitcamp.home;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@가 붙은건 annotation이고 기능이 이미 만들어져있는것
@WebServlet("/test.do")
public class ServletTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletTest() {
        super();
    }
    // doGet(), doPost()메소드가 호출되기전에 실행되는 메소드
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init()메소드 실행됨");
	}
	
	//접속을 get방식으로 했을때 호출되는 메소드, (request는 server에서 가져오는 input , response는 아웃풋)
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("doGet()메소드 실행됨");
		System.out.println("num="+ req.getParameter("num"));
		//세션의 아이디와 이름을 얻어오기
		HttpSession ses = req.getSession();
		String userid = (String)ses.getAttribute("logId");
		String username = (String)ses.getAttribute("logName");
		
		// 접속자에게 정보 보내기(
		res.setContentType("text/html; charset=UTF-8");
		
		PrintWriter pw = res.getWriter();
		
		pw.println("<html>");
		pw.println("<head><title>서블릿을 이용한 홈페이지</title>");
		
		pw.println("<script>");
		pw.println("document.write('자바스크립트에서 출력')");
		pw.println("</script>");
		pw.println("</head>");
		
		pw.println("<body>");
		pw.println("<h1>서블릿 홈페이지 테스트("+userid+", "+username+")</h1>");
		pw.println("</body>");
		pw.println("</html>");
	}
	//접속을 post방식으로 했을때 호출되는 메소드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()메소드 실행됨");
	}

}
