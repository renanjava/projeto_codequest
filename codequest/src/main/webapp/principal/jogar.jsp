<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html = lang="en">
<head>
<jsp:include page="style-file.jsp"></jsp:include>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="mb-3">
			<label for="validationCustom01" class="form-label"> Nome </label> <input
				class="form-control" name="campoUsuario" id="validationCustom01"
				type="text" required>
			<div class="invalid-feedback">Campo obrigatório</div>
			<div class="valid-feedback">Bom!</div>
		</div>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">
		
	</script>

	<script type="text/javascript">
(() => {
	  'use strict'

	  const forms = document.querySelectorAll('.needs-validation')

	  Array.from(forms).forEach(form => {
	    form.addEventListener('submit', event => {
	      if (!form.checkValidity()) {
	        event.preventDefault()
	        event.stopPropagation()
	      }

	      form.classList.add('was-validated')
	    }, false)
	  })
	})()
</script>
</body>
</html>