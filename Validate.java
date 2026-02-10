package login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Validate
 */
@WebServlet("/validate")
public class Validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		
		String url = "jdbc:mysql://localhost:3306/e_commerce_app";
		String username="root";
		String pass = "akash9851";
		
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, username, pass);
			
			String email = request.getParameter("email");
			String password = request.getParameter("pass");
			
			if(email == null || password == null) {
//				out.println("Email or Password cannot is empty");
				response.sendRedirect("login.jsp");
				return;
			}

			pst = conn.prepareStatement("select * from user where u_email = ? and u_pass = ?");
			pst.setString(1, email);
			pst.setString(2, password);
			
			rs = pst.executeQuery();
			
			if(rs.next()) {

			    int uid = rs.getInt("u_id");
			    String utype = rs.getString("u_type");
			    String uname= rs.getString("u_name");
			    

			    session.setAttribute("id", uid);
			    session.setAttribute("utype", utype);
			    session.setAttribute("uname", uname);
			    
			    
			    System.out.println("uid " + uid + " utype " + utype + " uname " + uname);

			    if("c".equals(utype.trim())) {
			        RequestDispatcher rd = request.getRequestDispatcher("userHome.jsp");
			        rd.forward(request, response);
			    } else if("a".equals(utype.trim())) {
			        RequestDispatcher rd = request.getRequestDispatcher("AdminWelcome.jsp");
			        rd.forward(request, response);
			    } else {
			    	System.out.println("Something else is executed");
			    }

			} else {
			    response.sendRedirect("login.jsp");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
