package com.cakeshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 Page Task	: Show Product' list 
				  select data (call ProductDAO obj)-> set attribute for prods Arraylist -> forward to ProdList.jsp

 references db structure : 
 	 -- Product --
	itemId int NOT NULL auto_increment primary key,
    itemName varchar(50) NOT NULL,
    category varchar(10) NOT NULL,
    product_image varchar(5) NOT NULL,
	quantity int NOT NULL,
    price	decimal(7,2) NOT NULL 
    
 *
 */ 
@WebServlet("/ProdListController")
public class ProdListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// category for menu 
		String category = request.getParameter("category");
				
		// Object for DB tasks
		ProductDAO prodsDao = new ProductDAO();
		
		// Arraylist for prods' list
		ArrayList<Product> prodsList = new ArrayList<Product>();
		
		try {
			
			// call method for list
			prodsList = prodsDao.listproducts(category);
			
			// set attribute
			request.setAttribute("category", category);
                        request.setAttribute("prodsList", prodsList);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		// Dispatcher - forward to result page
		getServletContext().getRequestDispatcher("/ProductList.jsp").forward(request, response);
					
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
