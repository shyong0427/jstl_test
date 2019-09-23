package pack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionBean {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public ConnectionBean() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch(Exception e) {
			System.out.println("ConnectionBean err : " + e);
		}
	}	
	
	public ArrayList<ProductBean> getDataAll() {
		ArrayList<ProductBean> list = new ArrayList<ProductBean>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select code, sang, su, dan from sangdata ";
//			String sql = "select * from sangdata"; // 권장사항은 아니다. 속도가 느리다.
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setCode(rs.getString(1));
				bean.setSang(rs.getString(2));
				bean.setSu(rs.getString(3));
				bean.setDan(rs.getString(4));
				
				list.add(bean);
			}
		} catch(Exception e) {
			System.out.println("getDataAll err : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e2) {
			}
		}
		
		return list;
	}
}