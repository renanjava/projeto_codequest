<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

	if(<%= request.getSession().getAttribute("endereco-destino") == request.getSession().getAttribute("endereco-1")%>){
		document.getElementById("anterior").disabled = true;
		document.getElementById("anterior").style.pointerEvents = 'none';
		document.getElementById("anterior").style.background = 'gray';
	}
	
	if(<%= request.getSession().getAttribute("endereco-destino") == request.getSession().getAttribute("endereco-4")%>){
		document.getElementById("proximo").disabled = true;
		document.getElementById("proximo").style.pointerEvents = 'none';
		document.getElementById("proximo").style.background = 'gray';
	}
		

</script>