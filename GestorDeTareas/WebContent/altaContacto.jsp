<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "modelo.Contacto" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Gestor de tareas</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
</head>
<body>

	<%@include file = "includes/header.jsp" %>
	<%@include file = "includes/nav.jsp" %>
	
	<% 
		boolean ISSETGet = false;
		Contacto c = new Contacto();
		
		if(request.getParameter("id") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			c.buscarID(id);
			ISSETGet = true;
		}
		System.out.println(c.getId());
	%>
	
		<form class="p-4" method="post" action="AltaContacto">
			<input type="hidden" name="id" value="<%=c.getId()%>">
			<h3>Nuevo contacto</h3><br>
			<div class="form-group">
		    	<label for="nombre">Nombre</label>
		    	<input name="nombre" type="text" class="form-control" id="nombre" value="<%=c.getNombre() %>" aria-describedby="nombreContacto" placeholder="Introduce el nombre del contacto" required>
		  	</div>
			<div class="form-group">
		    	<label for="apellidos">Apellidos</label>
		    	<input name="apellidos" type="text" class="form-control" id="apellidos" value="<%=c.getApellidos() %>" aria-describedby="apellidosContacto" placeholder="Introduce los apellidos del contacto" required>
		  	</div>
		  	<div class="form-group">
			    <label for="email">Correo electrónico</label>
			    <input name="email" type="email" class="form-control" id="email" value="<%=c.getEmail() %>" placeholder="Por ejemplo: jorgesanchez@ejemplo.com" required>
		  	</div>
		  	<div class="form-group">
			    <label for="tel">Teléfono</label>
			    <input name="tel" type="tel" class="form-control" id="tel" <%=c.getTel()%> placeholder="Por ejemplo: 910056788" required>
		  	</div>
		  	<br><button type="submit" class="btn btn-primary">Enviar</button>
		</form>
	<%@include file = "includes/footer.jsp" %>

</body>
</html>