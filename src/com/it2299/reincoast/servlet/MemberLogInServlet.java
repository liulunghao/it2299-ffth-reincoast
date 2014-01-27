package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.it2299.ffth.reincoast.dao.MemberDao;
import com.it2299.ffth.reincoast.dto.Member;

/**
 * Servlet implementation class LogInServlet
 */
@WebServlet("/MemberLogInServlet")
public class MemberLogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLogInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd= null;
		
		
		String userName = request.getParameter("username").toLowerCase();
		String password = request.getParameter("password");
		//String role = request.getParameter("role");
		
//
		
		MemberDao memberdao = new MemberDao();
		boolean result = memberdao.authenticateMember(userName, password);
		Member member = memberdao.getByUsernameMember(userName);
		
		if(result ==true){
			HttpSession session = request.getSession();
			
			session.setAttribute("current-user", member);
			

			rd = request.getRequestDispatcher("member-name.jsp");
			rd.forward(request, response); 
		}
		else {
			rd = getServletContext().getRequestDispatcher("/login.jsp");
			   rd.forward(request, response); 
			   //validatejs
		}
		
	
		
				
				
	}

}