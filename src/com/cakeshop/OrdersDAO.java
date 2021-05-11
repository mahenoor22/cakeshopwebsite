package com.cakeshop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * ---------------------------------------------
 *
 *         Page Task : OrdersDAO all tasks related to access database 'Orders'
 *
 *         references db : Orders
 *
 */
public class OrdersDAO {

	// connection
	Connection con = null;
	PreparedStatement pst;
	ResultSet rs = null;

	// ---------------------------------------------------------
	// METHOD oderAllItems()
	// ---------------------------------------------------------

	// move all items from cart to order
	public void orderAllItems(String customerId) throws Exception {

		// make a query
		String selectQuery = "select itemId,itemName, pimage, quantity, price from Cart where customerId ='" + customerId
				+ "' order by cartNo asc";

		// db connection
		try {

			con = DBConnector.getConnection();
			pst = con.prepareStatement(selectQuery);

			try {
				rs = pst.executeQuery();

			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}

			// save all list to ArrayList
			try {

				while (rs.next()) {

					// insert order
					String insertQuery = "Insert into orders(itemId,itemName,customerId,pimage,quantity,price,orderStatus,orderdate)"
                                                + "values (?,?,?,?,?,?,'Order Placed',date(now()))";

					// db connect
					try {

						// get connection
						con = DBConnector.getConnection();
						pst = con.prepareStatement(insertQuery);

						// set
						pst.setInt(1, rs.getInt("itemId"));  
						pst.setString(2, rs.getString("itemName"));                                                                
                                                pst.setString(3, customerId);
                                                pst.setString(4,rs.getString("pimage"));
						pst.setInt(5, rs.getInt("quantity"));
						pst.setDouble(6, rs.getDouble("price"));

						// execute
						pst.executeUpdate();

					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						DBConnector.closeConnectionAll(con, pst, null);
					}
					/////////////////////////////////////////////////////

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

	}

	// ---------------------------------------------------------
	// METHOD listAllOrders()
	// ---------------------------------------------------------

	// return Arraylist for all orders with item name
	public ArrayList<Orders> listAllOrders() throws Exception {

		// make a query
		String selectQuery = "select o.orderID, o.itemId, o.customerId, o.pimage, o.quantity, o.price, o.orderStatus, o.Orderdate, p.itemName ,p.category"
				+ " from Orders o, Product p where o.itemId = p.itemId " + " order by o.orderId asc";

		// result
		ArrayList<Orders> ordersList = new ArrayList<Orders>();

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

					Orders order = new Orders();

					// store information
					order.setOrderId(rs.getInt(1));
					order.setItemId(rs.getInt(2));
					order.setCustomerId(rs.getString(3));
					order.setPimage(rs.getString(4));
					order.setQuantity(rs.getInt(5));
					order.setPrice(rs.getDouble(6));
					order.setOrderStatus(rs.getString(7));
					order.setItemName(rs.getString(9));
                                        order.setCategory(rs.getString(10));

					// add to arraylist
					ordersList.add(order);

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
		return ordersList;
	}

	// ---------------------------------------------------------
	// METHOD listOrders()
	// ---------------------------------------------------------

	// return orders list for the specific customer id
	public ArrayList<Orders> listOrders(String customerId) throws Exception {

		// make a query
		String selectQuery = "select o.orderID, o.itemId, o.customerId, o.pimage, o.quantity, o.price, o.orderStatus, o.Orderdate, p.itemName "
				+ " from Orders o, Product p " + " where o.customerId ='" + customerId + "' and o.itemId = p.itemId "
				+ " order by o.orderId asc";

		// result
		ArrayList<Orders> ordersList = new ArrayList<Orders>();

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

					Orders order = new Orders();

					// store information
					order.setOrderId(rs.getInt(1));
					order.setItemId(rs.getInt(2));
					order.setCustomerId(rs.getString(3));
					order.setPimage(rs.getString(4));
					order.setQuantity(rs.getInt(5));
					order.setPrice(rs.getDouble(6));
					order.setOrderStatus(rs.getString(7));
					// order.setOrderDate();
					order.setItemName(rs.getString(9));

					// add to arraylist
					ordersList.add(order);

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
		return ordersList;
	}

	// ---------------------------------------------------------
	// METHOD listOrdersPlaced()
	// ---------------------------------------------------------

	// return orders placed list for the specific customer id
	public ArrayList<Orders> listOrdersPlaced(String customerId) throws Exception {

		// make a query
		String selectQuery = "select o.orderID, o.itemId, o.customerId, o.pimage, o.quantity, o.price, o.orderStatus, o.Orderdate,"
                                + " p.itemName from Orders o, Product p " + " where o.customerId ='" + customerId
				+ "' and o.orderStatus = 'Order Placed' and o.itemId = p.itemId " + " order by o.orderId asc";

		// result
		ArrayList<Orders> ordersList = new ArrayList<Orders>();

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

					Orders order = new Orders();

					// store information
					order.setOrderId(rs.getInt(1));
					order.setItemId(rs.getInt(2));
					order.setCustomerId(rs.getString(3));
					order.setPimage(rs.getString(4));
					order.setQuantity(rs.getInt(5));
					order.setPrice(rs.getDouble(6));
					order.setOrderStatus(rs.getString(7));
					//order.setOrderDate(rs.);
					order.setItemName(rs.getString(9));

					// add to arraylist
					ordersList.add(order);

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
		return ordersList;
	}

	// ---------------------------------------------------------
	// METHOD delRow()
	// ---------------------------------------------------------

	public void delRow(int orderId) throws Exception {

		// make a query
		String insertQuery = "delete from Orders where orderId=?";

		// db connect
		try {

			// get connection
			con = DBConnector.getConnection();
			pst = con.prepareStatement(insertQuery);

			// set
			pst.setInt(1, orderId);

			// execute
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.closeConnectionAll(con, pst, null);
		}
	}

	// ---------------------------------------------------------
	// METHOD addQty()
	// ---------------------------------------------------------

	public void addQty(int orderId, int quantity) throws Exception {

		// make a query
		String insertQuery = "update Orders set quantity=" + quantity + ", " + "price = (price / (" + (quantity - 1)
				+ ")) * " + quantity + " where orderId=?";

		// db connect
		try {

			// get connection
			con = DBConnector.getConnection();
			pst = con.prepareStatement(insertQuery);

			// set
			pst.setInt(1, orderId);

			// execute
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.closeConnectionAll(con, pst, null);
		}
	}

	// ---------------------------------------------------------
	// METHOD addQty()
	// ---------------------------------------------------------

	public void downQty(int orderId, int quantity) throws Exception {

		// make a query
		String insertQuery = "update Orders set quantity=" + quantity + ", " + "price = (price / (" + (quantity + 1)
				+ ")) * " + quantity + " where orderId=?";

		// db connect
		try {

			// get connection
			con = DBConnector.getConnection();
			pst = con.prepareStatement(insertQuery);

			// set
			pst.setInt(1, orderId);

			// execute
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.closeConnectionAll(con, pst, null);
		}
	}

	// ---------------------------------------------------------
	// METHOD updateStatus()
	// ---------------------------------------------------------

	public void updateStatus(int orderId, String orderStatus) throws Exception {

		// make a query
		String insertQuery = "update Orders set orderStatus = ?  where orderId=?";

		// db connect
		try {

			// get connection
			con = DBConnector.getConnection();
			pst = con.prepareStatement(insertQuery);

			// set
			pst.setString(1, orderStatus);
			pst.setInt(2, orderId);

			// execute
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.closeConnectionAll(con, pst, null);
		}
	}
}
