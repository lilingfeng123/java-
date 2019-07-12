package dao;

import impl.oneimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.jdbcutil;
import entity.Adm;
import entity.Car;
import entity.Shop;

public class onedao implements oneimpl{

	@Override
	public boolean login(Adm adm) {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql;
		boolean bl=false;
		try {
			conn=jdbcutil.getConnection();
			sql="select * from tb_admin where AdminID=? and Password=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, adm.getAdminID());
			ps.setString(2, adm.getPassword());
			rs=ps.executeQuery();
			bl=(rs.next())?true:false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return bl;
	}

	@Override
	public ArrayList<Shop> selectshop() {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql;
		boolean bl=false;
		ArrayList<Shop> al=new ArrayList<Shop>();
		try {
			conn=jdbcutil.getConnection();
			sql="select * from tb_shop";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				Shop shop=new Shop();
				shop.setS_id(rs.getInt("s_id"));
				shop.setS_name(rs.getString("s_name"));
				shop.setS_price(rs.getDouble("s_price"));
				shop.setS_num(rs.getInt("s_num"));
				shop.setS_weight(rs.getDouble("s_weight"));
				shop.setS_type(rs.getString("s_type"));
				al.add(shop);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return al;
	}

	@Override
	public Shop selectshopbyid(int id) {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql;
		boolean bl=false;
		Shop shop=new Shop();
		try {
			conn=jdbcutil.getConnection();
			sql="select * from tb_shop where s_id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next()){
				shop.setS_id(rs.getInt("s_id"));
				shop.setS_name(rs.getString("s_name"));
				shop.setS_price(rs.getDouble("s_price"));
				shop.setS_num(rs.getInt("s_num"));
				shop.setS_weight(rs.getDouble("s_weight"));
				shop.setS_type(rs.getString("s_type"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return shop;
	}

	
}
