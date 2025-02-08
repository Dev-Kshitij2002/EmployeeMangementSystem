<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login | Employee Portal</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<!-- Custom CSS -->
<link rel="stylesheet" href="login.css">
</head>
<body>
	<div class="container">
		<div class="login-container">
			<h1 class="text-center">Login</h1>

			<!-- Display message (error/success) -->
			<% if (request.getAttribute("msg") != null && !request.getAttribute("msg").toString().trim().isEmpty()) { %>
			<div id="alertMessage" class="alert alert-info text-center">
				<%= request.getAttribute("msg") %>
			</div>
			<% } %>

			<form action="login" method="post" class="needs-validation"
				novalidate>
				<!-- Email Input -->
				<div class="mb-3">
					<label for="email" class="form-label">Email Address</label> <input
						type="email" name="email" id="email" class="form-control"
						placeholder="name@example.com" required>
					<div class="invalid-feedback">Please enter a valid email.</div>
				</div>

				<!-- Password Input -->
				<div class="mb-3">
					<label for="password" class="form-label">Password</label> <input
						type="password" name="password" id="password" class="form-control"
						placeholder="Enter password" required>
					<div class="invalid-feedback">Password cannot be empty.</div>
				</div>

				<!-- Login Button -->
				<button type="submit" class="btn btn-primary w-100">Login</button>
			</form>

			<!-- Register Link -->
			<div class="text-center mt-3">
				<span>Don't have an account? </span><a href="/">Register here</a>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<!-- Custom JavaScript for Form Validation -->
	<script>
        (function () {
            'use strict';
            let forms = document.querySelectorAll('.needs-validation');
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
        
     // Hide the alert message after 3 seconds (3000 milliseconds)
        setTimeout(function () {
            let alertBox = document.getElementById("alertMessage");
            if (alertBox) {
                alertBox.style.display = "none"; // Hide the alert
            }
        }, 3000);
    </script>
</body>
</html>
