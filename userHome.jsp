<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String uname = (String) session.getAttribute("uname");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page for User</title>

<script src="https://cdn.tailwindcss.com"></script>
</head>



<body class="min-h-screen bg-gradient-to-br from-gray-100 to-gray-200 flex items-center justify-center">

  <div class="bg-white shadow-lg rounded-2xl p-10 text-center max-w-md w-full border border-gray-200">

    <h2 class="text-2xl font-semibold text-gray-800 mb-6">Welcome <%= uname %> 👋</h2>

    <form action="AdminDashboard.jsp" method="get">
      <button
        class="w-full bg-black text-white py-3 rounded-xl font-medium hover:bg-gray-800 transition">
        Go to Admin Dashboard
      </button>
    </form>

  </div>

</body>
</html>