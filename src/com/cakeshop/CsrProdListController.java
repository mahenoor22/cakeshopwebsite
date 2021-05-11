package com.cakeshop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginController
 */
/**
 * Page Task	: CSR page - Show Cake' list 
 *				  select data -> set attribute for prods Arraylist -> forward to CrsProdList.jsp
 *
 * references db structure : 
 product
itemId int NOT NULL auto_increment primary key,
* itemName varchar(50) NOT NULL,
* category varchar(10) NOT NULL,
* product_image varchar(5) NOT NULL,
* quantity int NOT NULL,
* price	decimal(7,2) NOT NULL 
    
 *
 */
/**
 * Servlet implementation class CsrProdListController
 */
@WebServlet("/CsrProdListController")
public class CsrProdListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	public CsrProdListController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

		// variables

		String category = request.getParameter("category");

		// select prod list
		try {

			// create sql
			String sql = "select * from product where category = '" + category + "' order by itemId desc ";

			// DB connection
			con = DBConnector.getConnection();

			// resultSet
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();

			// ArrayList for Product

			ArrayList<Product> prodsList = new ArrayList<Product>();

			while (rs.next()) {

				Product prod = new Product();

				// store information
				prod.setItemId(rs.getInt(1));
				prod.setItemName(rs.getString(2));
				prod.setCategory(rs.getString(3));
                                prod.setPrice(rs.getDouble(4));
				prod.setPimage(rs.getString(5));
				prod.setContent(rs.getString(6));
				prod.setQuantity(rs.getInt(7));

				prodsList.add(prod);

			}

			// set attribute
			request.setAttribute("category", category);
			request.setAttribute("prodsList", prodsList);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pst != null)
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		// Dispatcher - forward to result page
		getServletContext().getRequestDispatcher("/CsrProdList.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
