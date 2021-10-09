package red.inventory;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/InventoryUnitUpdate")
public class InventoryUnitUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		double unit = Double.parseDouble(request.getParameter("unit"));

		
		boolean isTrue;
		
		isTrue = InventoryDBUtil.updatecustomer1(id, name, unit);
		
		if(isTrue == true) {
			
			
			RequestDispatcher dis = request.getRequestDispatcher("inventoryunit_view.jsp");
			dis.forward(request, response);
		}
		else {
			
			
			RequestDispatcher dis = request.getRequestDispatcher("inventory_unsuccess.jsp");
			dis.forward(request, response);
		}
	}

}
