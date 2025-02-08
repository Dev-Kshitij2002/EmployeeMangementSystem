<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Email | Employee Portal</title>

    <!-- Bootstrap CSS -->
    <link 
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="email.css">
</head>
<body>
    <div class="container">
        <div class="email-container">
            <h2 class="text-center mb-4">Send Email</h2>

            <!-- Email Form -->
            <form action="send" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
                
                <!-- Recipient Email -->
                <div class="mb-3">
                    <label for="toEmail" class="form-label">To</label>
                    <input type="email" name="to" id="toEmail" class="form-control" 
                           placeholder="Recipient's Email" value="${toEmail}" required>
                    <div class="invalid-feedback">Please enter a valid email address.</div>
                </div>

                <!-- Subject -->
                <div class="mb-3">
                    <label for="emailSubject" class="form-label">Subject</label>
                    <input type="text" name="subject" id="emailSubject" class="form-control" 
                           placeholder="Email Subject" required>
                    <div class="invalid-feedback">Please enter a subject.</div>
                </div>

                <!-- Body -->
                <div class="mb-3">
                    <label for="emailBody" class="form-label">Body</label>
                    <textarea name="body" id="emailBody" class="form-control" rows="5" 
                              placeholder="Email Body" required></textarea>
                    <div class="invalid-feedback">Email body cannot be empty.</div>
                </div>

                <!-- Attachment -->
                <div class="mb-3">
                    <label for="emailAttachment" class="form-label">Attachment</label>
                    <input type="file" name="attachment" id="emailAttachment" class="form-control">
                </div>

                <!-- Buttons -->
                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-primary">Send</button>
                    <a href="home" class="btn btn-secondary">Home</a>
                </div>
            </form>
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
    </script>
</body>
</html>
