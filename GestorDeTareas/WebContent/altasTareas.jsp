<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "modelo.Tarea" %>
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
	
	<% 
		boolean ISSETGet = false;
		Tarea t = new Tarea();
		
		if(request.getParameter("id") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			t.buscarID(id);
			ISSETGet = true;
		}
		System.out.println(t.getId());
	%>
	
		<form class="p-4" method="post" action="AltaTarea">
			<input type="hidden" name="id" value="<%=t.getId()%>">
			<h3>Nueva tarea</h3>
			<div class="form-group">
		    	<label for="titulo">Título</label>
		    	<input name="titulo" type="text" class="form-control" id="titulo" value="<%=t.getTitulo() %>" aria-describedby="tituloTarea" placeholder="Introduce el título de la tarea" required>
		  	</div>
		  	<div class="form-group">
			    <label for="description">Descripción</label>
			    <input name="descripcion" type="text" class="form-control" id="descripcion" value="<%=t.getDescripcion() %>" aria-describedby="descripcionTarea" placeholder="Introduce la descripción de la tarea" required>
			</div>
		  	<div class="form-group">
		    	<label for="category">Categoría</label>
		    	<select name="categoria" class="form-control" id="categoryTask" required>
				      <option value="0" <%if(t.getCategoria()==0) out.println("selected");%>>...</option>
				      <option value="1" <%if(t.getCategoria()==1) out.println("selected");%>>Proyectos IMF</option>
				      <option value="2" <%if(t.getCategoria()==2) out.println("selected");%>>Prácticas</option>
				      <option value="3" <%if(t.getCategoria()==3) out.println("selected");%>>Personal</option>
		    	</select>
		  	</div>
		  	<div class="form-group">
		    	<label for="important">Importancia</label>
		    	<select name="importancia" class="form-control" id="importantTask" required>
				      <option value="0" <%if(t.getImportante()==0) out.println("selected");%>>...</option>
				      <option value="1" <%if(t.getImportante()==1) out.println("selected");%>>Baja</option>
				      <option value="2" <%if(t.getImportante()==2) out.println("selected");%>>Media</option>
				      <option value="3" <%if(t.getImportante()==3) out.println("selected");%>>Alta</option>
		    	</select>
		  	</div>
			<div class="form-group">
				<label class="form-check-label" for="fechaInicio">Fecha de inicio</label>
				<input class="form-control" type="date" name="fecha_inicio" value="<%=t.getFecha_inicio() %>" id="fecha_inicio" required>
			</div>
			<div class="form-group">
				<label class="form-check-label" for="fechaFin">Fecha fin</label>
				<input class="form-control" type="date" name="fecha_fin"value="<%=t.getFecha_fin() %>" id="fecha_fin" required>
			</div>
			<div class="form-group">
		    	<label for="category">Depende de...</label>
		    	<select name="dependencia" class="form-control" id="dependeTarea">
				      <option selected value="0">...</option>
		    	</select>
		  	</div>
			
		  	<hr><button type="submit" class="btn btn-primary">Enviar</button>
		</form>
	<%@include file = "includes/footer.jsp" %>
	
</body>
</html>