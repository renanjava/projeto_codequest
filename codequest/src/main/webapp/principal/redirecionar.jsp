<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">

<script type="text/javascript">

	window.location.href = '<%= request.getContextPath() %>/salas/<%= request.getSession().getAttribute("endereco-destino") %>.jsp';

</script>
</head>
</html>