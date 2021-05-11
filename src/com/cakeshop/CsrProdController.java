package com.cakeshop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CsrProdController
 */
@WebServlet("/CsrProdController")
public class CsrProdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsrProdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		
		// Object for DB tasks
		ProductDAO prodsDao = new ProductDAO();
  
		try {
			
			// mode param for tasks 
			String mode = request.getParameter("mode");
			System.out.println(mode + "/from cont");
			
			// params
			int itemId = 0;
			String itemName = "";
			String category = "";
			String pimage = "";
			String content = "";
			int quantity = 0;
			Double price = 0.0;
		
			// new prods information
			if(mode.equals("new")) {
				
				 itemName = request.getParameter("itemName");
				 category = request.getParameter("category");
				 pimage = request.getParameter("pimage");
				 content = request.getParameter("content");
				 quantity = Integer.parseInt(request.getParameter("quantity"));
				 price = Double.parseDouble(request.getParameter("price"));
			
				
				// call method to insert data
				prodsDao.addRow( itemName, category, pimage, quantity, price, content);
				
				// redirect page to form page
				response.sendRedirect("CsrProdForm.jsp");
			
			// delete data
			}else if(mode.equals("del")) {
				
				itemId = Integer.parseInt(request.getParameter("itemId"));
				category = request.getParameter("category");
				
				// call method to delete data
				prodsDao.delRow(itemId);
				
				// forward page to prods list
				request.setAttribute(category, "category");
				getServletContext().getRequestDispatcher("/CsrProdListController").forward(request, response);
			
			// update data
			}else if(mode.equals("edit")) {
				
				 itemId = Integer.parseInt(request.getParameter("itemId"));
				 itemName = request.getParameter("itemName");
				 category = request.getParameter("category");
				 pimage = request.getParameter("pimage");
				 content = request.getParameter("content");
				 quantity = Integer.parseInt(request.getParameter("quantity"));
				 price = Double.parseDouble(request.getParameter("price"));
				 
				// call method to update data
				prodsDao.updateRow( itemId, itemName, category, pimage, quantity, price, content);
				
				// forward page to prods list
				request.setAttribute(category, "category");
				getServletContext().getRequestDispatcher("/CsrProdListController").forward(request, response);
			
			// to search data for edit-page 
			}else if(mode.equals("search")) {
				
				itemId = Integer.parseInt(request.getParameter("itemId"));
				
				// call method to update data
				Product prod = prodsDao.searchProd(itemId);
				
				// forward page to prods list 
				request.setAttribute("mode", "edit");   //  should be changed to edit mode
				request.setAttribute("prods", prod);
				getServletContext().getRequestDispatcher("/CsrProdForm.jsp").forward(request, response);
				
			}	 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
