package com.bitcamp.home;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//프로그램당 컨트롤러는 1개
@WebServlet("/*.do") // 모든 접속이 여기로 들어온다, web.xml servlet mapping을 시켜야한다
public class ControllerAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//mapping 주소와 실행할 command객체를 보관할 맵
	HashMap<String, CommandService> map = new HashMap<String, CommandService>();
    public ControllerAction() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		//properties파일명을 web.xml에서 가져오기
		String propertiesFilename = config.getInitParameter("proConfig"); //String에 들어있는 값을 inputstream을 만들어서 객체로 만들어준다.
		
		Properties prop = new Properties();//key와 value로(둘다 String->나중에 객체로 변경해준다) 존재한다. -> prop.load(fis)때문에
		try {
			FileInputStream fis = new FileInputStream(propertiesFilename);
			//urlMapping.properties파일의 내용을 읽어와 properties객체로 대입한다.
			prop.load(fis);
			
		}catch(Exception e) {
			System.out.println("프로퍼티 객체 생성 에러 발생--->"+e.getMessage());
		}
		////////////////////////////////////////////////////////////////////
		try {
			//properties의 키 목록 구하기
			Enumeration keyList = prop.propertyNames(); //  /*.do & /index.do 등 모든 키를 담기위한 메소드, properties 클래스가 "="을 기준으로 key랑 value를 구별한다.
			
			while(keyList.hasMoreElements()) {
				//key에 대한 커맨드 클래스명을 가져온다. (아직은 String)
				String key = (String)keyList.nextElement();
				String commandName = prop.getProperty(key); // com.bitcamp.home.IndexCommand가 들어가있다.
				System.out.println(key+"=>"+commandName);
				
				//문자열을 객체로 생성하여 Map에 추가
				Class classObject = Class.forName(commandName); //문자열을 class로 변환
				CommandService serivce = (CommandService)classObject.getDeclaredConstructors()[0].newInstance(); // value
				map.put(key, serivce); //클래스로 바뀐 객체를 맵에 넣어준다.
			}
			
		}catch(Exception e) {
			System.out.println("프로퍼티의 내용을 Map객체로 변환 에러--->"+e.getMessage());
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//접속자의 url주소를 알아내야한다.
		String uri = request.getRequestURI(); //	/WebMVC/index.do
		String ctx = request.getContextPath(); //	/WebMVC
		System.out.println("uri=>"+uri);
		System.out.println("ctx=>"+ctx);
		
		String urlMapping = uri.substring(ctx.length()); //  /index.do = key
		
		CommandService command = map.get(urlMapping); //urlMapping이 key로 들어가서 value<CommandService>를 찾는다
		
		String viewFilename = command.processStart(request, response);
		
		//뷰파일로 이동하기
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewFilename); //파일명을 가지고 dispatch할 객체를 만들고
		dispatcher.forward(request, response); // 사용자에게 forward
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
