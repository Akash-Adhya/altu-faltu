<%@ page import="java.util.*"%>
<%@ page import="model.Product"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>





<%
	String utype = (String) session.getAttribute("utype");
	
	if (!"a".equals(utype.trim())) {
		response.sendRedirect("login.jsp");
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-white text-gray-900 min-h-screen">

	<%
	List<Product> products = new ArrayList<>();
	products.add(new Product(1, "Laptop", 75000.00, 10, "Electronics", "High performance laptop"));
	products.add(new Product(2, "Mobile", 35000.00, 50, "Electronics", "High Quality Camera"));
	products.add(new Product(3, "Goodday ChocoChips", 750.00, 100, "Food", "Choco chips biscuits"));
	products.add(new Product(4, "Pants", 900.00, 40, "Garments", "High quality pants"));

	// --- ADD PRODUCT TEMPORARILY TO LIST ---
	String name = request.getParameter("productName");
	String category = request.getParameter("productCategory");
	String description = request.getParameter("productDescription");
	String qtyStr = request.getParameter("productQuantity");
	String priceStr = request.getParameter("productPrice");

	if (name != null && category != null && description != null && qtyStr != null && priceStr != null) {
		try {
			int qty = Integer.parseInt(qtyStr);
			double price = Double.parseDouble(priceStr);
			int newId = products.size() + 1;
			products.add(new Product(newId, name, price, qty, category, description));
		} catch (Exception e) {
			// ignore parsing errors for now
		}
	}

	String adminUsername = request.getParameter("adminUsername");
	if (adminUsername == null) {
		adminUsername = "admin";
	}
	%>

	<!-- Navbar -->
	<nav class="bg-white border-b border-gray-200">
		<div
			class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
			<h1 class="text-lg font-semibold">
				Welcome,
				<%=adminUsername%></h1>

			<!-- Sign Out Button -->
			<a href="signout.jsp"
				class="bg-black text-white px-4 py-2 rounded-lg hover:bg-gray-800 transition">
				Sign Out </a>
		</div>
	</nav>

	<div class="max-w-7xl mx-auto px-6 py-8 space-y-6">

		<!-- Search Bar -->
		<div
			class="bg-white border border-gray-200 rounded-2xl p-5 shadow-sm space-y-4">
			<form class="flex gap-3" method="get">
				<input type="search" name="q" placeholder="Search products..."
					class="flex-1 bg-white border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black">
				<button
					class="bg-black text-white px-5 py-2 rounded-lg font-medium hover:bg-gray-800 transition">
					Search</button>
			</form>
		</div>

		<div class="flex justify-end">
			<button onclick="openModal('addProduct')"
				class="bg-black text-white px-4 py-2 rounded-lg hover:bg-gray-800 transition">
				+ Add Product</button>

		</div>

		<!-- Products Table -->
		<div class="bg-white border border-gray-200 rounded-2xl p-6 shadow-sm">

			<table class="w-full text-sm">
				<thead>
					<tr class="border-b border-gray-200 text-gray-500 text-left">
						<th class="py-3">ID</th>
						<th>Name</th>
						<th>Category</th>
						<th>Description</th>
						<th>Qty</th>
						<th>Price</th>
						<th>Actions</th>
					</tr>
				</thead>

				<tbody class="divide-y divide-gray-200">
					<%
					for (Product p : products) {
					%>
					<tr class="hover:bg-gray-50 transition">
						<td class="py-3"><%=p.getProductId()%></td>
						<td class="font-medium"><%=p.getProductName()%></td>
						<td><%=p.getProductCategry()%></td>
						<td class="text-gray-500"><%=p.getProductDescription()%></td>
						<td><%=p.getProductQuantity()%></td>
						<td>₹ <%=p.getProductPrice()%></td>
						<td class="space-x-2">
							<button onclick="openModal('edit<%=p.getProductId()%>')"
								class="px-3 py-1.5 text-xs bg-black text-white rounded-lg hover:bg-gray-800 transition">
								Edit</button>

							<button onclick="openModal('delete<%=p.getProductId()%>')"
								class="px-3 py-1.5 text-xs border border-red-500 text-red-500 rounded-lg hover:bg-red-500 hover:text-white transition">
								Delete</button>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>

		</div>
	</div>

	<!-- Add Product Modal -->
	<div id="addProduct"
		class="hidden fixed inset-0 bg-black/40 flex items-center justify-center">
		<div
			class="bg-white rounded-2xl shadow-lg border border-gray-200 w-full max-w-lg p-6">

			<h2 class="text-lg font-semibold mb-4">Add New Product</h2>

			<form action="AddProduct" method="post" class="space-y-4">

				<input type="text" name="productName" placeholder="Product Name"
					required
					class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black">

				<input type="text" name="productCategory" placeholder="Category"
					required
					class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black">

				<textarea name="productDescription" placeholder="Description"
					required
					class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black"></textarea>

				<input type="number" name="productQuantity" placeholder="Quantity"
					required
					class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black">

				<input type="number" step="0.01" name="productPrice"
					placeholder="Price" required
					class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black">

				<div class="flex justify-end gap-3">
					<button type="button" onclick="closeModal('addProduct')"
						class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-100">Cancel</button>

					<button type="submit"
						class="px-4 py-2 bg-black text-white rounded-lg hover:bg-gray-800">Add
						Product</button>
				</div>

			</form>

		</div>
	</div>

	<!-- Edit & Delete Modals -->
	<%
	for (Product p : products) {
	%>

	<div id="delete<%=p.getProductId()%>"
		class="hidden fixed inset-0 bg-black/40 flex items-center justify-center">
		<div
			class="bg-white border border-gray-200 rounded-2xl w-full max-w-md p-6 space-y-4 shadow-lg">
			<h3 class="text-lg font-semibold">Delete Product</h3>
			<p class="text-gray-600">
				Are you sure you want to delete <strong><%=p.getProductName()%></strong>?
			</p>
			<div class="flex justify-end gap-3">
				<button onclick="closeModal('delete<%=p.getProductId()%>')"
					class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-100">Cancel</button>
				<a href="DeleteProduct?id=<%=p.getProductId()%>"
					class="px-4 py-2 bg-red-500 text-white rounded-lg hover:bg-red-600">Delete</a>
			</div>
		</div>
	</div>

	<div id="edit<%=p.getProductId()%>"
		class="hidden fixed inset-0 bg-black/40 flex items-center justify-center">
		<div
			class="bg-white border border-gray-200 rounded-2xl w-full max-w-lg p-6 shadow-lg">
			<h3 class="text-lg font-semibold mb-4">Edit Product</h3>

			<form action="Edit.jsp" method="post" class="space-y-4">
				<input type="hidden" name="productId" value="<%=p.getProductId()%>">

				<input type="text" name="productName"
					value="<%=p.getProductName()%>"
					class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black">

				<input type="text" name="productCategory"
					value="<%=p.getProductCategry()%>"
					class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black">

				<textarea name="productDescription"
					class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black"><%=p.getProductDescription()%></textarea>

				<input type="number" name="productQuantity"
					value="<%=p.getProductQuantity()%>"
					class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black">

				<input type="number" step="0.01" name="productPrice"
					value="<%=p.getProductPrice()%>"
					class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:outline-none focus:border-black">

				<div class="flex justify-end gap-3">
					<button type="button"
						onclick="closeModal('edit<%=p.getProductId()%>')"
						class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-100">Cancel</button>
					<button type="submit"
						class="px-4 py-2 bg-black text-white rounded-lg hover:bg-gray-800">Save</button>
				</div>
			</form>
		</div>
	</div>

	<%
	}
	%>

	<script>
		function openModal(id) {
			document.getElementById(id).classList.remove('hidden');
		}
		function closeModal(id) {
			document.getElementById(id).classList.add('hidden');
		}
	</script>

</body>
</html>
