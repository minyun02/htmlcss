package com.bitcamp.home.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.CommandService;

public class EditOkCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		BoardVO vo = new BoardVO();
		PageSearchVO pVO = new PageSearchVO();
		BoardDAO dao = new BoardDAO();
		
		vo.setUserid((String)req.getSession().getAttribute("userid"));
		
		vo.setNo(Integer.parseInt(req.getParameter("no")));
		//글쓴이 알아내기
		String dbUserid = dao.getUserid(vo.getNo());
		
		//로그인 여부 확인
		String viewFile = "";
		if(vo.getUserid()==null || vo.getUserid().equals("")) {
			//로그인 안함
			viewFile = "/member/login.jsp"; //가져갈게 없으니까 do보다는 그냥 바로 jsp로
		}else if(!dbUserid.equals(vo.getUserid())){
			//글쓴이가 아니다.
			req.setAttribute("result", 100); 
			viewFile = "/board/editOk.jsp";
		}else {
			//로그인 한 경우	result = 0 or 1
			vo.setSubject(req.getParameter("subject"));
			vo.setContent(req.getParameter("content"));
			
			pVO.setPageNum(Integer.parseInt(req.getParameter("pageNum")));
			pVO.setSearchKey(req.getParameter("searchKey"));
			pVO.setSearchWord(req.getParameter("searchWord"));
			
			int result = dao.boardUpdate(vo);
			
			req.setAttribute("result", result);
			req.setAttribute("addrParam", createParameter(pVO, vo.getNo()));
			
			viewFile = "/board/editOk.jsp";
			System.out.println("result"+result);
		}
		
		return viewFile;
	}
	public String createParameter(PageSearchVO pVO, int no) {
		String addrParam = "no="+no+"&pageNum="+pVO.getPageNum();
		if(pVO.getSearchWord()!=null && !pVO.getSearchWord().equals("")) {
			addrParam += "&searchKey="+pVO.getSearchKey()+"&searchWord="+pVO.getSearchWord();
		}
		return addrParam;
	}
}
