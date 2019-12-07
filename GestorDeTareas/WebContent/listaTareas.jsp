<%@page import = "modelo.ListaTareas" %>
<%@page import = "modelo.Tarea" %>

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
	<h3 class="p-3">Mis tareas</h3>
	<a class="p-3" href="altasTareas.jsp">Añadir nueva tarea</a><br><br>
	
	<table class="table">
	
		<%
		ListaTareas lt = new ListaTareas();
		lt.obtenerTareas();
		String guardarTarea = lt.imprimirListas();
		%>
		
	<%=guardarTarea%>
	</table>
	
	<%@include file = "includes/footer.jsp" %>
	
	
</body>
</html>