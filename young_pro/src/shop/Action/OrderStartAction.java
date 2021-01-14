package shop.Action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Action.Action;

import com.shop.bean.*;
import com.shop.dao.PrdDAO;
import com.user.bean.UserBean;

import vo.ActionForward;

public class OrderStartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		
		UserBean bean = new UserBean();
		session.setAttribute("user_id", bean.getUser_id());
		
		PrdDAO dao = PrdDAO.getInstance();
		ArrayList<Order> orderList = dao.getOrderList();
		String[] orderCheck = request.getParameterValues("remove");
		
		Cart cart = new Cart();
		session.setAttribute("name", cart.getId());
		int cartList = dao.selectPrd();
		
		request.setAttribute("cartList", cartList);
		request.setAttribute("orderList", orderList);
		request.setAttribute("orderCheck", orderCheck);
		
			
		forward.setPath("OrderList.jsp");
		
		return forward;
		
		
		
	}
}
