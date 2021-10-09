package red.inventory;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Inventory_Insert")
public class Inventory_Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String shop = request.getParameter("shop");
		String date = request.getParameter("date");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String user = request.getParameter("user");
		
		double total=0;
		
		boolean isTrue;
		
		
		isTrue = InventoryDBUtil.insertcustomer(name, shop, date,  quantity, user, total);
		
		isTrue = InventoryDBUtil.insertcustomer1(name, quantity, total);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("inventory_view.jsp");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("inventory_unsuccess.jsp");
			dis2.forward(request, response);
		}
		
	}

}
