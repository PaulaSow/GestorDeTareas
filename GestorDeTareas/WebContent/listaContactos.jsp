<%@page import = "modelo.ListaContactos" %>
<%@page import = "modelo.Contacto" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset='UTF-8' >
	<meta name='viewport' content='width=device-width, initial-scale=1.0'>
	<meta charset="utf-8">
	<title>Gestor de tareas</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
</head>
<body>

	<%@include file = "includes/header.jsp" %>
	<%@include file = "includes/nav.jsp" %>
	<h3 class="p-3">Mis contactos</h3>
	<a class="p-3" href="altaContacto.jsp">Añadir nuevo contacto</a><br><br>
	
	<table class="table">
	
		<%
		ListaContactos lc = new ListaContactos();
		lc.obtenerContactos();
		String guardarContacto = lc.imprimirListas();
		%>
		
	<%=guardarContacto%>
	</table>
	
	<%@include file = "includes/footer.jsp" %>
	
	
</body>
</html>