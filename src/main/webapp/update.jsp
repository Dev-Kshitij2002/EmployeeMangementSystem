<%@page import="com.ty.empapp.entity.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Employee Form | Employee Portal</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="update.css">
</head>
<body>
    <div class="container mt-4">
        <div class="form-container">
            <h1 class="text-center">Employee Form</h1>

            <!-- Display Flash Messages -->
            <c:if test="${not empty msg}">
                <div class="alert">${msg}</div>
            </c:if>

            <%
            Employee employee = (Employee) request.getAttribute("employee");
            %>

            <form action="add" method="post" class="needs-validation" novalidate>
                <!-- Hidden Employee ID Field -->
                <input type="hidden" name="eid" value="<%= employee != null ? employee.getEid() : "" %>">

                <!-- Name Input -->
                <div class="mb-3">
                    <label for="name" class="form-label">Full Name</label>
                    <input name="name" type="text" id="name" class="form-control" 
                           placeholder="Enter your name" 
                           value="<%= employee != null ? employee.getName() : "" %>" required>
                    <div class="invalid-feedback">Please enter a valid name.</div>
                </div>

                <!-- Email Input -->
                <div class="mb-3">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" name="email" id="email" class="form-control" 
                           placeholder="example@mail.com" 
                           value="<%= employee != null ? employee.getEmail() : "" %>" required>
                    <div class="invalid-feedback">Please enter a valid email.</div>
                </div>

                <!-- Phone Input -->
                <div class="mb-3">
                    <label for="phone" class="form-label">Phone Number</label>
                    <input type="number" name="phone" id="phone" class="form-control" 
                           placeholder="99******12" 
                           value="<%= employee != null ? employee.getPhone() : "" %>" required>
                    <div class="invalid-feedback">Please enter a valid 10-digit phone number.</div>
                </div>

                <!-- Hidden Password Field (Required for update) -->
                <input type="hidden" name="password" value="<%= employee != null ? employee.getPassword() : "" %>">

                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary w-100">Submit</button>
            </form>

            <!-- Home Link -->
            <div class="text-center mt-3">
                <a href="home" class="btn btn-outline-secondary">Back to Home</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
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
    </script>
</body>
</html>
