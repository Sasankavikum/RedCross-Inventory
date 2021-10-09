package red.inventory;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Inventory_UpdateServlet")
public class Inventory_UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		int quantity = Integer.parseInt(request.getParameter("quantity"));

		
		boolean isTrue;
		
		isTrue = InventoryDBUtil.updatecustomer(id, name, quantity);
		
		if(isTrue == true) {
			
			
			RequestDispatcher dis = request.getRequestDispatcher("inventory_stock.jsp");
			dis.forward(request, response);
		}
		else {
			
			
			RequestDispatcher dis = request.getRequestDispatcher("inventory_unsuccess.jsp");
			dis.forward(request, response);
		}
		
	}

}
