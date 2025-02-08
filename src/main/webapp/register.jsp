<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Register | Employee Portal</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="register.css">
</head>
<body>
    <div class="container">
        <h1 class="text-center">Register</h1>

        <form action="save" method="post" class="needs-validation" novalidate>
            <!-- Name Input -->
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" name="name" id="name" class="form-control" placeholder="Enter your name" required>
                <div class="invalid-feedback">Please enter a valid name (3-10 characters).</div>
            </div>

            <!-- Email Input -->
            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" name="email" id="email" class="form-control" placeholder="example@mail.com" required>
                <div class="invalid-feedback">Please enter a valid email.</div>
            </div>

            <!-- Phone Input -->
            <div class="mb-3">
                <label for="phone" class="form-label">Phone Number</label>
                <input type="number" name="phone" id="phone" class="form-control" placeholder="99******12" required>
                <div class="invalid-feedback">Please enter a valid 10-digit phone number.</div>
            </div>

            <!-- Password Input -->
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="Enter password" required>
                <div class="invalid-feedback">Password must be at least 6 characters long.</div>
            </div>

            <!-- Register Button -->
            <button type="submit" class="btn btn-primary w-100">Register</button>
        </form>

        <!-- Login Link -->
        <div class="text-center mt-3">
            <span>Already have an account? </span><a href="login">Login here</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
            crossorigin="anonymous"></script>

    <!-- Custom JavaScript for Form Validation -->
    <script>
        // Bootstrap form validation
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
