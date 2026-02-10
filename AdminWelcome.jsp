<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.sql.*" %>

<%

 	String utype = (String) session.getAttribute("utype");

	if(!"a".equals(utype.trim())){
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}
 		
 	

	String url = "jdbc:mysql://localhost:3306/e_commerce_app";
	String username="root";
	String password = "akash9851";
	
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, username, password);
	
	Integer id = (Integer) session	.getAttribute("id");
	if(id == null) {
	    response.sendRedirect("login.jsp");
	    return;
	}

	
	pst = conn.prepareStatement("select * from user where u_id = ?");
	pst.setInt(1, id);
	
	rs = pst.executeQuery();
	rs.next();
	
	String adminUsername = rs.getString("u_name");
	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page for Admin</title>

<script src="https://cdn.tailwindcss.com"></script>
</head>


<body
	class="min-h-screen bg-gradient-to-br from-gray-100 to-gray-200 flex items-center justify-center">

	<div
		class="bg-white shadow-lg rounded-2xl p-10 text-center max-w-md w-full border border-gray-200">

		<h2 class="text-2xl font-semibold text-gray-800 mb-6">
			Welcome
			<%=adminUsername%>
			👋
		</h2>

		<form action="AdminDashboard.jsp" method="get">
			<button
				class="w-full bg-black text-white py-3 rounded-xl font-medium hover:bg-gray-800 transition">
				Go to Admin Dashboard</button>
		</form>

	</div>

</body>
</html>