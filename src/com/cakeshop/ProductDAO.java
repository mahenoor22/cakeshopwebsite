package com.cakeshop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cakeshop.DBConnector;

/**
 * ---------------------------------------------
 * 
         Page Task : ProductDAO all tasks related to access database 'Product'

         references db structure : Product itemId int NOT NULL auto_increment
         primary key, itemName varchar(50) NOT NULL, category varchar(10) NOT
         NULL, product_image varchar(5) NOT NULL, quantity int NOT NULL, price
         decimal(7,2) NOT NULL
 *
 * 
 */

public class ProductDAO {

	// connection
	Connection con = null;
	PreparedStatement pst;
	ResultSet rs = null;

	/*
	 * private int itemId; private String itemName; private String category;
	 * private String prodsize; private int quantity; private double price;
	 */

	// ---------------------------------------------------------
	// METHOD listAllShoes()
	// ---------------------------------------------------------

	public ArrayList<Product> listAllproducts() throws Exception {

		// make a query
		String selectQuery = "select itemId, itemName, category, product_image, quantity, price, content from product order by itemId desc";

		// result
		ArrayList<Product> prodsList = new ArrayList<Product>();

		// db connection
		try {

			con = DBConnector.getConnection();
			pst = con.prepareStatement(selectQuery);

			try {
				rs = pst.executeQuery();

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				System.out.println(pst.toString());
				e.printStackTrace();
			}

			// save all list to ArrayList
			try {

				while (rs.next()) {

					Product prod = new Product();

					// store information
					prod.setItemId(rs.getInt(1));
					prod.setItemName(rs.getString(2));
					prod.setCategory(rs.getString(3));
					prod.setPimage(rs.getString(4));
					prod.setQuantity(rs.getInt(5));
					prod.setPrice(rs.getDouble(6));
					prod.setContent(rs.getString(7));

					// add to arraylist
					prodsList.add(prod);

				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			DBConnector.closeConnectionAll(con, pst, rs);
		}

		// return
		return prodsList;
	}

	// ---------------------------------------------------------
	// METHOD listShoes()
	// ---------------------------------------------------------

	public ArrayList<Product> listproducts(String category) throws Exception {

		// make a query
		String selectQuery = "select itemId, itemName, category, price,product_image,content,quantity from product ";

		// condition
		if (!category.isEmpty())
			selectQuery = selectQuery + "where category ='" + category + "' ";
		selectQuery = selectQuery + "order by itemId desc";

		// result
		ArrayList<Product> prodsList = new ArrayList<Product>();

		// db connection
		try {

			con = DBConnector.getConnection();
			pst = con.prepareStatement(selectQuery);

			try {
				rs = pst.executeQuery();

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				System.out.println(pst.toString());
				e.printStackTrace();
			}

			// save all list to ArrayList
			try {

				while (rs.next()) {

					Product prod = new Product();

					// store information
					prod.setItemId(rs.getInt(1));
					prod.setItemName(rs.getString(2));
					prod.setCategory(rs.getString(3));
					prod.setPimage(rs.getString(5));
					prod.setQuantity(rs.getInt(7));
					prod.setPrice(rs.getDouble(4));
					prod.setContent(rs.getString(6));
					// add to arraylist
					prodsList.add(prod);

				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			DBConnector.closeConnectionAll(con, pst, rs);
		}

		// return
		return prodsList;
	}

	// ---------------------------------------------------------
	// METHOD searchShoes()
	// ---------------------------------------------------------

	public Product searchProd(int itemId) throws Exception {

		// make a query
		String selectQuery = "select itemId, itemName, product_image, quantity, price,category, content from product where itemId="
				+ itemId;

		// prod for return value
		Product prod = new Product();

		// db connection
		try {

			con = DBConnector.getConnection();
			pst = con.prepareStatement(selectQuery);

			try {
				rs = pst.executeQuery();

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				System.out.println(pst.toString());
				e.printStackTrace();
			}

			try {

				while (rs.next()) {

					// store information
					prod.setItemId(rs.getInt("itemId"));
					prod.setItemName(rs.getString("itemName"));
					prod.setPimage(rs.getString("product_image"));
					prod.setQuantity(rs.getInt("quantity"));
					prod.setPrice(rs.getDouble("price"));
                                        prod.setCategory(rs.getString("category"));
					prod.setContent(rs.getString("content"));

				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			DBConnector.closeConnectionAll(con, pst, rs);
		}

		// return
		return prod;
	}

	// ---------------------------------------------------------
	// METHOD searchShoes()
	// ---------------------------------------------------------

	public Product searchProd(String itemId) throws Exception {

		// make a query
		String selectQuery = "select itemId, itemName, product_image, price, content from product where itemId=" + itemId;

		// prod for return value
		Product prod = new Product();

		// db connection
		try {

			con = DBConnector.getConnection();
			pst = con.prepareStatement(selectQuery);

			try {
				rs = pst.executeQuery();

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				System.out.println(pst.toString());
				e.printStackTrace();
			}

			try {

				while (rs.next()) {

					// store information
					prod.setItemId(rs.getInt("itemId"));
					prod.setItemName(rs.getString("itemName"));
					prod.setPimage(rs.getString("product_image"));
					prod.setQuantity(rs.getInt("quantity"));
					prod.setPrice(rs.getDouble("price"));
					prod.setContent(rs.getString("content"));

				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			DBConnector.closeConnectionAll(con, pst, rs);
		}

		// return
		return prod;
	}

	// ---------------------------------------------------------
	// METHOD addRow()
	// ---------------------------------------------------------

	public void addRow(String itemName, String category, String pimage, int quantity, double price, String content)
			throws Exception {

		// make a query
		String insertQuery = "insert into product (itemName,category,price,product_image,content,quantity ) "
				+ "values (?,?,?,?,?,?)";

		// db connect
		try {

			// get connection
			con = DBConnector.getConnection();
			pst = con.prepareStatement(insertQuery);

			// set
			pst.setString(1, itemName);
			pst.setString(2, category);
                        pst.setDouble(3, price);
			pst.setString(4, pimage);
			pst.setString(5, content);                       
			pst.setInt(6, quantity);

			// execute
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.closeConnectionAll(con, pst, null);
		}
	}

	// ---------------------------------------------------------
	// METHOD updateRow()
	// ---------------------------------------------------------

	public void updateRow(int itemId, String itemName, String category, String pimage, int quantity, double price,
			String content) throws Exception {

		// make a query
		String insertQuery = "update product set itemName=?, category=?, product_image=?, quantity=?, price=?, content=? "
				+ " where itemId=?";

		// db connect
		try {

			// get connection
			con = DBConnector.getConnection();
			pst = con.prepareStatement(insertQuery);

			// set
			pst.setString(1, itemName);
			pst.setString(2, category);
			pst.setString(3, pimage);
			pst.setInt(4, quantity);
			pst.setDouble(5, price);
			pst.setString(6, content);
			pst.setInt(7, itemId);

			// execute
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.closeConnectionAll(con, pst, null);
		}
	}

	// ---------------------------------------------------------
	// METHOD delRow()
	// ---------------------------------------------------------

	public void delRow(int itemId) throws Exception {

		// make a query
		String insertQuery = "delete from product where itemId=?";

		// db connect
		try {

			// get connection
			con = DBConnector.getConnection();
			pst = con.prepareStatement(insertQuery);

			// set
			pst.setInt(1, itemId);

			// execute
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.closeConnectionAll(con, pst, null);
		}
	}
}
