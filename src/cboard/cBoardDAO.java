package cboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardBean;

public class cBoardDAO {
	public Connection getConnection1() throws Exception{
		// 예외처리를 함수 호출하는 곳에서 처리하도록 설정
		Connection con=null;
		// JDBC 프로그램 설치
//		 // 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
//		 Class.forName("com.mysql.jdbc.Driver");
//		 // 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 디비서버 접속
//		 //        => 접속정보 저장
//		 String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
//		 String dbUser="jspid";
//		 String dbPass="jsppass";
//		 con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
		
		//커넥션 풀(Connection Pool)
		// 데이터베이스와 연결된 Connection객체를 미리 생성하여 Pool(풀,기억장소) 저장
		// 필요할때마다 풀에 접근하여 Connection객체 사용, 작업 끝나면 반환
		// 프로그램은 서버에 미리 설치
		// 1. WebContent META-INF context.xml 만들어 미리 자원준비
		// 2. DAO 자원이름을 불러서 사용
		// 장점 : 속도 증가 , 수정시 하나의 파일 context.xml수정 
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		con=ds.getConnection();
		return con;
	}
	
	public void reInsertCboard(cBoardBean bb) {
		try {
			// 1,2 단계 디비연결 메서드 호출
			 Connection con=getConnection1();
			//3단계 num구하기 기존글에서 최대 num 값을 구해서 +1 
			String sql2="select max(num) from cboard";
			PreparedStatement pstmt2=con.prepareStatement(sql2);
			//4단계 실행 => rs 저장
			ResultSet rs=pstmt2.executeQuery();
			//5단계 rs 첫행이동 max(num) 가져오기 +1
			int num=0;
			if(rs.next()){
				num=rs.getInt("max(num)")+1;
			}
			//  같은 그룹안에 내밑에 답글이 달려있으면 한칸더 아래로 내려가도록 순서값 1증가
			//  조건 re_ref=?(같은그룹)  re_seq >?(내글 아래  답글이있으면) 
			//  수정 re_seq=re_seq+1   순서값 1증가 (한칸아래로 내려감)
			String sql3="update cboard set re_seq=re_seq+1 where re_ref=? and re_seq>?";
			PreparedStatement pstmt3=con.prepareStatement(sql3);
			pstmt3.setInt(1, bb.getRe_ref());
			pstmt3.setInt(2, bb.getRe_seq());
			pstmt3.executeUpdate();
			
			

			// 3단계 - 접속정보를 이용해서 insert sql 구문 만들고 실행할수 있는 자바프로그램 생성
			String sql="insert into cboard(name,content,date,re_ref,re_lev,re_seq) values(?,?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bb.getName());
			pstmt.setString(2, bb.getContent());
			pstmt.setTimestamp(3, bb.getDate());
			pstmt.setInt(4, bb.getRe_ref());  //re_ref 그대로 넣기
			pstmt.setInt(5, bb.getRe_lev()+1);  //re_lev +1
			pstmt.setInt(6, bb.getRe_seq()+1);  //re_seq +1
			
			// 4단계 - sql실행  (insert, update, delete)
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
		}
	}//메서드
	private Connection getConnection() {
		// TODO Auto-generated method stub
		return null;
	}
	public List getcBoardList(int startRow, int pageSize) {
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt2=null;
		PreparedStatement pstmt=null;
		// 여러개 바구니는 저장할 기억장소만들기(배열형태로 자바에 만든 프로그램)
		List cboardList=new ArrayList(); 
		try {
			// 1,2 단계 디비연결 메서드 호출
			 con=getConnection1();
			// 3단계 - 접속정보를 이용해서 select sql 구문 만들고 실행할수 있는 자바프로그램 생성
//	        최근글이 맨위로 보이게 데이터 가져오기 (num기준 내림차순 정렬해서 가져오기)
//	String sql="select * from board order by num desc";
	String sql="select * from cboard order by num desc limit ?,?";
	pstmt=con.prepareStatement(sql);
	pstmt.setInt(1, startRow-1);
	pstmt.setInt(2, pageSize);
	// 4단계 - sql구문 실행(select) => 결과 저장
	rs=pstmt.executeQuery();
		//5단계  rs첫행으로 이동  num pass name 열 가져와서 하나의 바구니에 저장
	while(rs.next()) {
		//첫번째 행 게시판 글 하나  => 자바빈 바구니에 저장
		cBoardBean bb=new cBoardBean();
		bb.setNum(rs.getInt("num"));
		bb.setName(rs.getString("name"));
		bb.setContent(rs.getString("content"));
		bb.setDate(rs.getTimestamp("date"));
		//file추가
		// 배열에 첫번째 칸에 바구니 하나 저장
		cboardList.add(bb);
	}
	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리, 기억장소 해제
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(pstmt2!=null) try{pstmt2.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return cboardList;
	}
}
