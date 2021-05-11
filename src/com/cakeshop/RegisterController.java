package com.cakeshop;

/**
  reference page : Customer.java (bean)
 * Task	: Register for customer  
 *
 * reference db structure:
 * Customers  
	customerNo	int NOT NULL auto_increment primary key,
	customerId	varchar(50) NOT NULL,
    username varchar(30) NOT NULL,
    userpwd	int NOT NULL,
    firstname varchar(30) NOT NULL,
    lastname varchar(30) NOT NULL,
    address varchar(100) NULL,
    city varchar(30) NULL,
    postalCode varchar(10) NULL
 
 *
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	public RegisterController() {
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

		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

		// forward page
		String nextPage = "";

		// variables

		// get params
		String category = request.getParameter("category");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");

		try {

			// 1. validate email address

			// DB connection
			con = DBConnector.getConnection();

			String sql = "";

			if (category.equals("Customers")) {
				sql = "select * from Customers where customerId=?";
			} else {
				sql = "select * from CSR where employeeId=? ";
			}

			// resultSet
			pst = con.prepareStatement(sql);
			pst.setString(1, email);
			rs = pst.executeQuery();

			// move to last row to count rows
			rs.last();
                        
                        if(pwd.length()<8) {
                                System.out.println(pwd.length());
				request.setAttribute("Msg", "pass");
				nextPage = "/Register.jsp";

                        }   
				
			// 2. register
                        else if (rs.getRow() == 0) {
                                if (category.equals("Customers")) {
					// extra info
					String address = request.getParameter("address");
					String city = request.getParameter("city");
					String postalCode = request.getParameter("postalCode");

					// insert query
					String insertQuery = "insert into customers "
							+ " (customerId, username, userpwd, firstname, lastname, address, city, postalCode) values (?,?,?,?,?,?,?,?)";

					pst = con.prepareStatement(insertQuery);

					// set
					pst.setString(1, email);
					pst.setString(2, firstName + " " + lastName);
					pst.setString(3, pwd);
					pst.setString(4, firstName);
					pst.setString(5, lastName);
					pst.setString(6, address);
					pst.setString(7, city);
					pst.setString(8, postalCode);

					int chk = pst.executeUpdate();

					// print result
					if (chk == 0) {

						request.setAttribute("Msg", "fail");
						nextPage = "/Register.jsp";

					} else {

						// customer
						Customer customer = new Customer();

						// get information
						customer.setCustomerId(email);
						customer.setFirstName(firstName);
						customer.setLastName(lastName);
						customer.setUserName(firstName + " " + lastName);
						customer.setAddress(address);
						customer.setCity(city);
						customer.setPostalCode(postalCode);

						// session
						HttpSession session = request.getSession();
						session.setAttribute("userType", "customer");
						session.setAttribute("customer", customer);

						// forward page
						nextPage = "/RegisterRst.jsp";
					}

					// CSR
				} 
                                else {

					// insert query
					String insertQuery = "insert into CSR "
							+ " (employeeId, username, userpwd, firstname, lastname) values (?,?,?,?,?)";

					pst = con.prepareStatement(insertQuery);

					// set
					pst.setString(1, email);
					pst.setString(2, firstName + " " + lastName);
					pst.setString(3, pwd);
					pst.setString(4, firstName);
					pst.setString(5, lastName);

					int chk = pst.executeUpdate();

					// print result
					if (chk == 0) {

						request.setAttribute("Msg", "fail");
						nextPage = "/Register.jsp";

					} else {

						// CSR obj
						CSR csr = new CSR();

						// get information
						csr.setEmployeeId(email);
						csr.setFirstName(firstName);
						csr.setLastName(lastName);
						csr.setUserName(firstName + " " + lastName);

						// set session
						HttpSession session = request.getSession();
						session.setAttribute("userType", "csr");
						session.setAttribute("csr", csr);
						session.setMaxInactiveInterval(600 * 60); // for
																	// customer
																	// give 600
																	// minutes

						nextPage = "/Login.jsp";
					}

				}

				// 2.2 fail to register
			} else {

				request.setAttribute("Msg", "email");
				nextPage = "/Register.jsp";

			}

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

		// forward to result page
		RequestDispatcher view = request.getRequestDispatcher(nextPage);
		view.forward(request, response);

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
