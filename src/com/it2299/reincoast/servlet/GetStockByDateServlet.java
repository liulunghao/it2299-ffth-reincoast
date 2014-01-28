package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.it2299.ffth.reincoast.dao.InboundDeliveryDao;
import com.it2299.ffth.reincoast.dao.OutboundDeliveryDao;
import com.it2299.ffth.reincoast.dao.ProductDao;
import com.it2299.ffth.reincoast.dto.Audit;
import com.it2299.ffth.reincoast.dto.InboundDelivery;
import com.it2299.ffth.reincoast.dto.OutboundDelivery;
import com.it2299.ffth.reincoast.dto.Product;

/**
 * Servlet implementation class GetStockByDateServlet
 */
@WebServlet("/GetStockByDateServlet")
public class GetStockByDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetStockByDateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	@SuppressWarnings({ "unused", "deprecation" })
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		Gson gson = new GsonBuilder().create();
		ProductDao productDao = new ProductDao();
		
		List<Product> productList = productDao.getAll();
		
		
		
		
		
		int totalQuan =0;
		
		for(int i=0; i< productList.size(); i++){
		totalQuan = totalQuan + productList.get(i).getQuantity();
		}
		
		
		
		List<Audit> pAudit = productDao.getAudits();
		
		InboundDeliveryDao inboundDao = new InboundDeliveryDao();
		List<Audit> inboundAudit = inboundDao.getAudits();
		Date current_date = new Date();
		
		
		int inboundSize = inboundDao.getByDate().size();
		System.out.println(inboundSize);
		
		
		
		
		String date;
		int total =0;
		
	
		OutboundDeliveryDao outboundDao = new OutboundDeliveryDao();
		List<Audit> outboundAudit = outboundDao.getAudits();
		int outboundSize = outboundDao.getByDate().size();
		
		request.setAttribute("inboundSize", inboundSize);
		request.setAttribute("outboundSize", outboundSize);
		request.setAttribute("totalQuan", totalQuan);
		request.setAttribute("stockList", productList);
		
		int size = inboundSize + outboundSize;
		
		
		String chart = "Morris.Line({element: 'graph',";
	    	 chart = chart + "data:[";
	    	
	    	  chart = chart + generatedChart(size,  inboundDao.getByDate(), outboundDao.getByDate());
	    	 
	    	   chart = chart + "],";
	    			   chart = chart + "xkey: 'hour',";
	    			   chart = chart + "ykeys: ['InboundDelivery', 'OutboundDelivery'],";
	    			   chart = chart + " labels: ['InboundDelivery', 'OutboundDelivery'],";
	    			   chart= chart + "smooth: false";
	    			   chart = chart + "});";
		request.setAttribute("mychart", chart);
		
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/stock.jsp");
		requestDispatcher.forward(request, response);
	}
	
	private String generatedChart(int n, List<InboundDelivery> inboundlist, List<OutboundDelivery> outboundlist){
		String chart = "";
		
		int inboundCounter =0;
		int outboundCounter =0;
			for(int i=0; i<n ; i++){
				if(inboundCounter < inboundlist.size() && outboundCounter < outboundlist.size()){
					if(inboundlist.get(inboundCounter).getDateDelivered().compareTo(outboundlist.get(outboundCounter).getDateDelivered()) ==0){
						int inboundTotal = 0;
						int outboundTotal =0;
						for(int a=0; a<inboundlist.get(inboundCounter).getItems().size(); a++){
							 inboundTotal = inboundTotal + inboundlist.get(inboundCounter).getItems().get(a).getQuantity();
						}
						for(int b=0; b<outboundlist.get(outboundCounter).getItems().size(); b++){
							outboundTotal = outboundTotal + outboundlist.get(outboundCounter).getItems().get(b).getQuantity();
						}
						long millisecond = inboundlist.get(i).getDateDelivered().getTime();
						 chart = chart + "{ hour: "+ millisecond + ", InboundDelivery:" + inboundTotal + ", OutboundDelivery:" + outboundTotal+ "},";
						 outboundCounter++;
						 inboundCounter++;
					}else if(inboundlist.get(inboundCounter).getDateDelivered().compareTo(outboundlist.get(outboundCounter).getDateDelivered()) >0){
						int inboundTotal = 0;
						for(int a=0; a<inboundlist.get(inboundCounter).getItems().size(); a++){
							 inboundTotal = inboundTotal + inboundlist.get(inboundCounter).getItems().get(a).getQuantity();
						}
						long millisecond = inboundlist.get(inboundCounter).getDateDelivered().getTime();
						chart = chart + "{ hour: "+ millisecond + ", InboundDelivery:" + inboundTotal + ", OutboundDelivery:" + null+ "},";
						inboundCounter++;
					}else{
						int outboundTotal =0;
						for(int b=0; b<outboundlist.get(outboundCounter).getItems().size(); b++){
							outboundTotal = outboundTotal + outboundlist.get(outboundCounter).getItems().get(b).getQuantity();
						}
						long millisecond = outboundlist.get(outboundCounter).getDateDelivered().getTime();
						 chart = chart + "{ hour: "+ millisecond + ", InboundDelivery:" + null + ", OutboundDelivery:" + outboundTotal+ "},";
						 outboundCounter++;
					}
				}else if (inboundCounter < inboundlist.size()){
					int inboundTotal = 0;
					for(int a=0; a<inboundlist.get(inboundCounter).getItems().size(); a++){
						 inboundTotal = inboundTotal + inboundlist.get(inboundCounter).getItems().get(a).getQuantity();
					}
					long millisecond = inboundlist.get(inboundCounter).getDateDelivered().getTime();
					chart = chart + "{ hour: "+ millisecond + ", InboundDelivery:" + inboundTotal + ", OutboundDelivery:" + null+ "},";
					inboundCounter++;
				}else{
					int outboundTotal =0;
					for(int b=0; b<outboundlist.get(outboundCounter).getItems().size(); b++){
						outboundTotal = outboundTotal + outboundlist.get(outboundCounter).getItems().get(b).getQuantity();
					}
					long millisecond = outboundlist.get(outboundCounter).getDateDelivered().getTime();
					 chart = chart + "{ hour: "+ millisecond + ", InboundDelivery:" + null + ", OutboundDelivery:" + outboundTotal+ "},";
					 outboundCounter++;
				}
				
				 
			}
		return chart;
	}

}
