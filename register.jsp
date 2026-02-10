<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>

<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body
	class="min-h-screen bg-gradient-to-br from-gray-100 to-gray-200 flex items-center justify-center">

	<%
	String pass = request.getParameter("pass");
	String cpass = request.getParameter("cpass");

	if (pass != null && cpass != null) {
		if (!pass.equals(cpass)) {
	%>
	<script>
		alert("Password doesn't match");
	</script>
	<%
	} else {
	%>
	<script>
		alert("SignUp Successful! Please Login again to signin...");
		window.location.href = "login.jsp";
	</script>
	<%
	}
	}
	%>

	<div
		class="bg-white shadow-lg rounded-2xl p-10 w-full max-w-md border border-gray-200">

		<h2 class="text-2xl font-semibold text-center text-gray-800">Registration</h2>
		<p class="text-center text-gray-500 mt-1 mb-6">Sign Up to continue</p>

		<form action="register.jsp" method="post" class="space-y-4">

			<input type="email" name="email" placeholder="Email" required
				class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black">

			<input type="text" name="uname" placeholder="Username" required
				class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black">

			<input type="password" name="pass" placeholder="Password" required
				class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black">

			<input type="password" name="cpass" placeholder="Confirm Password"
				required
				class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black">

			<button type="submit"
				class="w-full bg-black text-white py-2.5 rounded-xl font-medium hover:bg-gray-700 transition">
				Sign Up</button>

		</form>

		<div class="my-6 border-t"></div>

		<p class="text-center text-gray-600 text-sm mb-3">Already have an
			account?</p>

		<form action="login.jsp">
			<button type="submit"
				class="w-full border border-black text-black py-2.5 rounded-xl font-medium hover:bg-black hover:text-white transition">
				Sign In</button>
		</form>

	</div>

</body>
</html>