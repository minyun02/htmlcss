package com.bitcamp.home.data;

import java.util.ArrayList;
import java.util.List;

import com.bitcamp.home.DBCPConn;

public class DataDAO extends DBCPConn implements DataDAOImpl {

	@Override
	public int dataInsert(DataVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void dataSelect(DataVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public int dataUpdate(DataVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int dataDelete(DataVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<DataVO> dataSelectAll() {
		List<DataVO> lst = new ArrayList<DataVO>();
		try {
			getConn();
			
			sql = "select no, title, userid, filename1, filename2, hit, downCount, to_char(writedate, 'MM-DD HH:MI') writedate "
					+ " from data order by no desc";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DataVO vo = new DataVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setUserid(rs.getString(3));
				vo.setFilename1(rs.getString(4));
				vo.setFilename2(rs.getString(5));
				vo.setHit(rs.getInt(6));
				vo.setDownCount(rs.getInt(7));
				vo.setWritedate(rs.getString(8));
				lst.add(vo);
			}
		}catch(Exception e) {
			System.out.println("글 목록 불러오기 에러 발생----->"+e.getMessage());
			e.printStackTrace();
		}finally {
			getClose();
		}
		return lst;
	}

	@Override
	public void hitCount(int no) {
		// TODO Auto-generated method stub

	}

	@Override
	public void downloadCount(int no) {
		// TODO Auto-generated method stub

	}

}
