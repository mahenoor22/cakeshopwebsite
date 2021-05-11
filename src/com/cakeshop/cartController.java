package com.cakeshop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
*
 * Page Task	: Add to Cart from customers
 *				   
 *
 *
 */ 
@WebServlet("/cartController")
public class cartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		 
		// param vars 
		String category = request.getParameter("category");
		String customerId = request.getParameter("customerId");
		int itemId = Integer.parseInt(request.getParameter("itemId"));
	 
		
		// search items
		ProductDAO prodsDao = new ProductDAO();
		Product prod = new Product();
		try {
			prod = prodsDao.searchProd(itemId);
			 
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		
		// add to cart
		CartDAO cartDao = new CartDAO();
		try {
			
			cartDao.addRow(itemId, prod.getItemName(), customerId, prod.getPimage(), 1, prod.getPrice());
			 
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		// set attribute
		request.setAttribute("category", category);
      
	 
		// Dispatcher - forward to result page
		getServletContext().getRequestDispatcher("/ProdListController?category="+category).forward(request, response);
								
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
