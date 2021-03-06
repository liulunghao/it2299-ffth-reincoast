package com.it2299.reincoast.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.it2299.ffth.reincoast.dao.MemberDao;
import com.it2299.ffth.reincoast.dto.Member;
import com.it2299.ffth.reincoast.dto.Volunteer;

/**
 * Servlet implementation class MemberDeactivateServlet
 */
@WebServlet("/MemberDeactivateServlet")
public class MemberDeactivateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberDeactivateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("before get session");
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("current_user");
		String Uname = (member.getUserName());
		System.out.println("before deactivate");
		try {

			MemberDao memberDao = new MemberDao();
			Member currentMem = memberDao.getByUsernameMember(Uname);
			System.out.println("USER" + Uname);
			currentMem.setStatus("INACTIVE");
			memberDao.saveOrUpdate(currentMem);
			System.out.println("DEACTIVATED DONE!");
			session.invalidate();
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp?msg=Your%20account%20has%20been%20successfully%20deactivated%20from%20the%20site.&isType=alert-success");
			
			rd.forward(request, response);
		

		} catch (Exception ex) {
			throw new ServletException(ex);

		}
	}


}
