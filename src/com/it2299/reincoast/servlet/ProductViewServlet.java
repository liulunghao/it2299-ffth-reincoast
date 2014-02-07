package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Session;
import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.DefaultRevisionEntity;
import org.hibernate.envers.query.AuditEntity;
import org.hibernate.envers.query.AuditQuery;

import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.util.HibernateUtil;

/**
 * Servlet implementation class ProductEditServlet
 */
@WebServlet("/ProductViewServlet")
public class ProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductViewServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDao productDao = new ProductDao();
		Product product = null;
		try {
			int id = Integer.parseInt(request.getParameter("id"));

			product = (Product) productDao.get(id);

		} catch (Exception ex) {
			String code = request.getParameter("code");
			if (code != null && code != "") {
				product = (Product) productDao.getByBarcode(code);
			} else {
				System.out.println("Empty code.");
			}
		} finally {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DAY_OF_MONTH, -30);
			Date date = calendar.getTime();

			request.setAttribute("p_category", "\"" + StringUtils.join(productDao.getCategories(), "\",\"") + "\"");
			request.setAttribute("product", product);
			request.setAttribute("p_audits", productDao.getAuditsById(product.getId()));
			request.setAttribute("p_movement_graph_data", productDao.getMovementGraphData());
			request.setAttribute("p_audits_past_30_days", productDao.getAuditsById(product.getId(), date));
			
			System.out.println(productDao.getInboundDeliveryAuditsTotal(date));
			//request.setAttribute("now", new Date());
			//request.setAttribute("past", new Date(new Date().getTime() - 86400000));

			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product-view.jsp");
			requestDispatcher.forward(request, response);
		}

	}
}
