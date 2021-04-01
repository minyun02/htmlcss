package com.bitcamp.home;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.home.board.BoardDAO;
import com.bitcamp.home.board.PageVO;

public class IndexCommand implements CommandService {

	@Override
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		PageVO pVO = new PageVO();
		BoardDAO dao = new BoardDAO();
		//총 레코드 수 구하기
		pVO.setTotalRecord(dao.totalRecord(pVO));
		
		//레코드 불러오기
		req.setAttribute("list", dao.onePageRecordSelect(pVO));
		req.setAttribute("vo", pVO);
		
		return "index.jsp";
	}

}
