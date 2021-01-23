package community.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import challenge.model.dao.ChallDao;
import challenge.model.vo.Challenge;
import common.model.vo.PageInfo;
import community.model.dao.CommuDao;

public class CommuService {

	
	public int getRankListCount() {
		Connection conn = getConnection();
		
		int listCount = new CommuDao().getRankListCount(conn);
		
		close(conn);
		//System.out.println("서비스 - 인기챌린지 갯수 : " + listCount);
		
		return listCount;
		
	}

	public ArrayList<Challenge> selectRankList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Challenge> list = new CommuDao().selecRanktList(conn, pi);
		//System.out.println("서비스 - 인기챌린지 리스트 : " + list);
		close(conn);

		return list;

	}

}
