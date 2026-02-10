<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-white min-h-screen flex items-center justify-center">

<div class="w-full max-w-md px-6">

  <!-- Card -->
  <div class="bg-white border border-gray-200 rounded-2xl shadow-sm p-8">

    <h2 class="text-2xl font-semibold text-center mb-6">Sign In</h2>

    <form action="validate" method="post" class="space-y-5">

      <!-- Email -->
      <div>
        <label class="block text-sm font-medium mb-1">Register Email</label>
        <input type="email" name="email" required
          class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black">
      </div>

      <!-- Password -->
      <div>
        <label class="block text-sm font-medium mb-1">Password</label>
        <input type="password" name="pass" required
          class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black">
      </div>

      <!-- Forgot Password -->
      <div class="text-right">
        <a href="forgotPassword" class="text-sm text-gray-600 hover:text-black transition">
          Forgot Password?
        </a>
      </div>

      <!-- Submit Button -->
      <button type="submit"
        class="w-full bg-black text-white py-2.5 rounded-lg font-medium hover:bg-gray-800 transition">
        Sign In
      </button>

    </form>
  </div>

  <!-- Footer text -->
  <p class="text-center text-sm text-gray-500 mt-6">
   OK
  </p>

</div>

</body>
</html>
