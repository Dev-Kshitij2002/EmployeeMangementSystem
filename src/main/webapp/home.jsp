<!doctype html>
<%@page import="com.ty.empapp.entity.Employee"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home | Employee Portal</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<!-- Custom CSS -->
<link rel="stylesheet" href="home.css">
</head>
<body>
	<div class="container mt-4">
		<h1 class="text-center mb-4">Employee Management</h1>

		<!-- Display message -->
		<% if (request.getAttribute("msg") != null && !request.getAttribute("msg").toString().trim().isEmpty()) { %>
		<div id="alertMessage" class="alert alert-info text-center">
			<%= request.getAttribute("msg") %>
		</div>
		<% } %>

		<%
        List<Employee> employees = (List<Employee>) request.getAttribute("emps");
        Integer currentPageObj = (Integer) request.getAttribute("currentPage");
        Integer totalPagesObj = (Integer) request.getAttribute("totalPages");

        int currentPage = (currentPageObj != null) ? currentPageObj : 0;
        int totalPages = (totalPagesObj != null) ? totalPagesObj : 5;
        %>

		<!-- Employee Table -->
		<div class="table-responsive">
			<table
				class="table table-hover table-bordered text-center align-middle">
				<thead class="table-dark">
					<tr>
						<th scope="col">EID</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">Phone</th>
						<th scope="col">Update</th>
						<th scope="col">Delete</th>
						<th scope="col">Send Email</th>
					</tr>
				</thead>
				<tbody>
					<%
                    if (employees != null && !employees.isEmpty()) {
                        for (Employee employee : employees) {
                    %>
					<tr>
						<th scope="row"><%=employee.getEid() %></th>
						<td><%=employee.getName() %></td>
						<td><%=employee.getEmail() %></td>
						<td><%=employee.getPhone() %></td>
						<td><a href="#"
							onclick="verifyPassword('<%=employee.getEid()%>', 'edit')"
							class="btn btn-warning btn-sm">Update</a></td>
						<td><a href="#"
							onclick="verifyPassword('<%=employee.getEid()%>', 'delete')"
							class="btn btn-danger btn-sm">Delete</a></td>
						<td><a
							href="<%=request.getContextPath() %>/email?eid=<%=employee.getEid() %>"
							class="btn btn-primary btn-sm">Email</a></td>
					</tr>
					<%
                        }
                    } else {
                    %>
					<tr>
						<td colspan="7" class="text-center text-muted">No employees
							found.</td>
					</tr>
					<%
                    }
                    %>
				</tbody>
			</table>
		</div>

		<!-- Add Employee Button -->
		<div class="text-center mt-4">
			<a href="add" class="btn btn-success">Add Employee</a>
		</div>
	</div>

	<!-- Pagination Controls -->
	<div class="d-flex justify-content-center mt-4">
		<ul class="pagination">
			<% if (currentPage > 0) { %>
			<li class="page-item"><a class="page-link"
				href="home?page=<%=currentPage - 1%>&size=5">Previous</a></li>
			<% } %>

			<% for (int i = 0; i < totalPages; i++) { %>
			<li class="page-item <%= (i == currentPage) ? "active" : "" %>">
				<a class="page-link" href="home?page=<%=i%>&size=5"><%=i + 1%></a>
			</li>
			<% } %>

			<% if (currentPage < totalPages - 1) { %>
			<li class="page-item"><a class="page-link"
				href="home?page=<%=currentPage + 1%>&size=5">Next</a></li>
			<% } %>
		</ul>
	</div>
	</div>

	<script>
    function verifyPassword(eid, action) {
        let password = prompt("Enter your password to continue:");

        if (!password) {
            alert("Password is required!");
            return;
        }

        if (action === "delete") {
            if (!confirm("Are you sure you want to delete this employee? This action cannot be undone.")) {
                return;
            }
        }
        
        let encodedPassword = encodeURIComponent(password);

        // Redirect to backend with password verification
        window.location.href = action + "?eid=" + eid + "&password=" + encodedPassword;
    }
    
    // Hide the alert message after 3 seconds (3000 milliseconds)
        document.addEventListener("DOMContentLoaded", function() {
        let alertBox = document.getElementById("alertMessage");
        if (alertBox) { 
            setTimeout(function () {
                alertBox.style.display = "none"; // Hide the alert only if it exists
            }, 3000);
        }
    });
</script>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
