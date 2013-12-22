package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dto.Product;
import com.sun.org.apache.regexp.internal.recompile;

/**
 * Servlet implementation class InboundController
 */
@WebServlet("/GetItemServlet")
public class GetItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetItemServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return
	 * @return
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		

		int id = Integer.parseInt(request.getParameter("ItemCode"));

		ProductDao productID = new ProductDao();

		Product product = productID.get(id);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", product.getName());
		map.put("code", product.getCode());
		map.put("id", Integer.toString(product.getId()));
		map.put("price", Double.toString(product.getPrice()));
		
		Gson gson = new GsonBuilder().create();
		PrintWriter out = response.getWriter();
		String itemGson = gson.toJson(map);

		out.println(itemGson);
	}

}
