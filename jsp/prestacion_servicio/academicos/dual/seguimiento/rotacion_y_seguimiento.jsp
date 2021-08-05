<%@ page language="java"  import="java.sql.*, java.lang.*, java.util.*, comun.*" errorPage="../../error.jsp"%>
<%
if (session.getAttribute("usuario") != null)
{
    String usuario = String.valueOf(session.getAttribute("usuario"));
    int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("cve_usuario")));

    BD SMBD = new BD();
    ResultSet rs;
%> 

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
	
	<title>Plan de rotacion y seguimiento</title>

	<link rel="stylesheet" href="../../../../../estilos/sic.css">
    <link rel="stylesheet" href="../../../../../estilos/normalize.css">
    <link rel="stylesheet" href="../../../../../estilos/estilos.css">
    <link rel="stylesheet" href="../../../../../estilos/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../../estilos/bootstrap4.2.1.min.css">

    <script type="text/javascript" language="JavaScript1.2" src="../../../../../jsp/menu/stmenu.js"></script>
    <script type="text/javascript" language="JavaScript1.2" src="../../../../../js/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" language="JavaScript1.2" src="../../../../../js/popcalendar.js"></script>
    <script type="text/javascript" language="JavaScript1.2" src="../../../../../js/bootstrap.min.js"></script>
</head>
<body>
      <table width="80%" cellpadding="0" cellspacing="0" border="0" align="center">
            <tr>
                <td><img src="../../../../../imagenes/banner.jpg" width="100%" height="80"></td>
            </tr>
            <tr align="center">
                <td class="titulo">Proyecto Dual</td>
                    </tr>
                    <tr align="center">
                        <td class="usuario"><%=usuario%></td>
                    </tr>
                    <tr align="center">
                        <td class="encabezado">Plan de rotacion y seguimiento de puestos de aprendizaje(Coordinador dual)</td>
                    </tr>
        </table>
        <br>

<div class="col-md-3">&nbsp;</div>

<div class="row SoloTexto2">
        <div class="col-md-1">&nbsp;</div>
            <div class="col-md-2">
            	<div class="col-md-1"></div>
                Estudiante/Colaborador
                <br>
                <input type="text" id="" name="" class="captura_obligada combo200">
   
					<div class="col-md-2">&nbsp;</div>
					Cuatrimestre Dual
					<br>
					<input type="text" id="" name="" class="captura_obligada combo100">
					<div class="col-md-2">&nbsp;</div>
					Celular
					<br>
					<input type="text" id="" name="" class="captura_obligada combo100">
					<div class="col-md-2">&nbsp;</div>
					Correo
					<br>
					<input type="text" id="" name="" class="captura_obligada combo100">
			
            <div class="col-md-2">&nbsp;</div>
        </div>
			
  <div class="col-md-2">
                Programa educativo
                <br>
                <input type="text" id="TPaterno" name="TPaterno" class="captura_obligada combo200">
            </div>
            <div class="col-md-2">
                Nombre de la empresa
                <br>
                <input type="text" id="TMaterno" name="TMaterno" class="captura_obligada combo200"></div>
            <div class="col-md-2">
                Nombre del plan de rotacion
                <br>
                <input type="text" id="" name="" class="captura combo200" readonly>
            </div>
        <div class="col-md-1">&nbsp;</div>
</div>
<br>

<div class="row SoloTexto2">
<div class="col-md-1">&nbsp;</div>
    <div class="col-md-2">
    	<div class="col-md-3"></div>
             Asesor academico dual
             <br>
                <input type="text" id="" name="" class="captura_obligada combo200">
				<div class="col-md-2">&nbsp;</div>
				Celular
				<br>
              <input type="text" id="" name="" class="captura_obligada combo100">
				<div class="col-md-2">&nbsp;</div>
				Correo
				<br>
              <input type="text" id="" name="" class="captura_obligada combo100">
	<div class="col-md-3">&nbsp;</div>	
  </div>
  		<div class="col-md-2">
                Nombre del Inst. de la empresa
                <br>
                	<input maxlength="" onKeyUp="" type="text" id="" name="" class="captura_obligada combo200">
					<div class="col-md-3">&nbsp;</div>
					Celular
					<br>
					<input maxlength="" onKeyUp="" type="text" id="" name="" class="captura_obligada combo100">
					<div class="col-md-3">&nbsp;</div>
					Correo 
					<br>
			  <input maxlength="" onKeyUp="" type="text" id="" name="" class="captura_obligada combo100"> 
            </div>
        <div class="col-md-2">
        	Calificacion ex. de conocimientos
        	<br>
        	<input type="text" name="calificacion" class="captura_obligada combo100">
        </div>

  </div>

            <div class="col-md-3">&nbsp;</div>
</div>	
<br>
	
	<table width="80%" cellpadding="0" cellspacing="0" border="0" align="center">
                <tr align="center">
                        <td class="encabezado">PLANEACION DE LA ROTACION EN LOS PUESTOS DE APRENDIZAJE (horarios,alumnos empresa)</td>
                    </tr>
            </table>
		
		<div class="col-md-1">&nbsp;</div>
        <div class="col-md-12">
        	<div class="col-md-12">
        		<table style="margin: auto;" align="" class="table table-hover table-sm border border-info " cellpadding="0" cellspacing="0">
			<thead class="table-dark SoloTexto2">
				<tr class="bg-info">
					<th class="align-middle text-center" colspan="6" scope="col"><P>Dias</P></th>
            	</tr>
				<tr class="bg-secondary">
					<th class="align-middle text-center" scope="col">L</th>
					<th class="align-middle text-center" scope="col">M</th>
					<th class="align-middle text-center" scope="col">Mi</th>
					<th class="align-middle text-center" scope="col">J</th>
					<th class="align-middle text-center" scope="col">V</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="align-middle text-center"><input id="dia_l" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="dia_m" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="dia_mi" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="dia_j" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="dia_v" type="checkbox"></td>
				</tr>
			</tbody>
		</table>
        	</div>
        	
		<br>
		<div class="col-md-12">
			<table style="margin: auto;" align="" class="table table-hover table-sm border border-info" cellpadding="0" cellspacing="0">
			<thead class="table-dark SoloTexto2">
				<tr class="bg-info">
					<th class="align-middle text-center" colspan="17" scope="col"><P>Semanas en UTSJR</P></th>
            	</tr>
				<tr class="bg-secondary">
					<th class="align-middle text-center" scope="col">Institucion</th>
					<th class="align-middle text-center" scope="col">1</th>
					<th class="align-middle text-center" scope="col">2</th>
					<th class="align-middle text-center" scope="col">3</th>
					<th class="align-middle text-center" scope="col">4</th>
					<th class="align-middle text-center" scope="col">5</th>
					<th class="align-middle text-center" scope="col">6</th>
					<th class="align-middle text-center" scope="col">7</th>
					<th class="align-middle text-center" scope="col">8</th>
					<th class="align-middle text-center" scope="col">9</th>
					<th class="align-middle text-center" scope="col">10</th>
					<th class="align-middle text-center" scope="col">11</th>
					<th class="align-middle text-center" scope="col">12</th>
					<th class="align-middle text-center" scope="col">13</th>
					<th class="align-middle text-center" scope="col">14</th>
					<th class="align-middle text-center" scope="col">15</th>
					<th class="align-middle text-center" scope="col">16</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th class="align-middle text-center" scope="col">UTSJR</th>
					<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<th class="align-middle text-center" scope="col">Empresa</th>
					<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="" type="checkbox"></td>
				</tr>
			</tbody>
		</table>
		</div>
		
        </div>
        <div class="col-md-1">&nbsp;</div>

		
		<div class="col-md-12">
			<div class="col-md-1">&nbsp;</div>
		<table  class="table table-hover table-sm border border-info" cellpadding="0" cellspacing="0">
			<thead class="table-dark SoloTexto2">
				<tr class="bg-info">
					<th class="align-middle text-center" colspan="12" scope="col"><P>Meses</P></th>
            	</tr>
				<tr class="bg-secondary">
					<th class="align-middle text-center" scope="col">Ene</th>
					<th class="align-middle text-center" scope="col">Feb</th>
					<th class="align-middle text-center" scope="col">Mar</th>
					<th class="align-middle text-center" scope="col">Abr</th>
					<th class="align-middle text-center" scope="col">May</th>
					<th class="align-middle text-center" scope="col">Jun</th>
					<th class="align-middle text-center" scope="col">Jul</th>
					<th class="align-middle text-center" scope="col">Ago</th>
					<th class="align-middle text-center" scope="col">Sep</th>
					<th class="align-middle text-center" scope="col">Oct</th>
					<th class="align-middle text-center" scope="col">Nov</th>
					<th class="align-middle text-center" scope="col">Dic</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="align-middle text-center"><input id="mes_ene" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="mes_feb" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="mes_mar" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="mes_abr" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="mes_may" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="mes_Jun" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="mes_Jul" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="mes_Ago" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="mes_Sep" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="mes_Oct" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="mes_Nov" type="checkbox"></td>
                	<td class="align-middle text-center"><input id="mes_Dic" type="checkbox"></td>
				</tr>
			</tbody>
		</table>
		
		</div>
	

<br>
	
	<div class="col-md-1">&nbsp;</div>
		<div class="col-md-12">
			<table class="table table-hover table-sm border border-info" cellpadding="0" cellspacing="0">
			<thead class="table-dark SoloTexto2">
				<tr class="bg-info">
					<th class="align-middle text-center" colspan="6" scope="col"><P>PUESTOS DE 	APRENDIZAJE</P></th>
            	</tr>
				<tr class="bg-secondary">
					<th class="align-middle text-center" scope="col">PUESTO DE APRENDIZAJE (ANOTAR ESECUENCIA)</th>
					<th class="align-middle text-center" scope="col">OBJETIVOS DE APRENDIZAJE</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="align-middle text-center">Programador</td>
                	<td class="align-middle text-center">Desarrollar competencias</td>
				</tr>
			</tbody>
		</table>
		</div>
	
	<div class="col-md-1">&nbsp;</div>
<br>

	<div class="col-md-1">&nbsp;</div>
	<div class="col-md-12">
		<table class="table table-hover table-sm border border-info" cellpadding="0" cellspacing="0">
			<thead class="table-dark SoloTexto2">
				<tr class="bg-info">
					<th class="align-middle text-center" colspan="6" scope="col"><P>SEGUIMIENTO AL ESTUDIANTE COLABORADOR</P></th>
            	</tr>
				<tr class="bg-secondary">
					<td class="align-middle text-center" scope="col">OBSERVACIONES DEL INSTRUCTOR EMPRESARIAL</td>
					<td class="align-middle text-center" scope="col">OBSERVACIONES DEL ASESOR DE LA UTSJR</td>
					<td class="align-middle text-center" scope="col">EVALUACION DEL ASESOR DE LA UT
						<div align align="center">
							<div class="col-md-10">
								<table class="">
							<tbody>
							<tr>
								<td>Saber</td>
								<td>Ser</td>
								<td>Saber hacer</td>
							</tr>
							<tr>
								<td>SA</td>
								<td>DE</td>
								<td>AU</td>
							</tr>
							</tbody>
							</table>
							</div>
						</div>
													
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="align-middle text-center">Eficiente</td>
                	<td class="align-middle text-center">Excelente</td>
				</tr>
			</tbody>
		</table>
	</div>
		

	<br>
	
	 <div class="row SoloTexto2 ">
		 
		 	<div class="col-md-2" id="gif_espera">   
            &nbsp;
            </div>
            <div class="col-md-2">
                <img onClick="" src="../../../../../imagenes/ikonoz/nuevo.png" class="iconsButtons" title="Limpiar">
                <br>Limpiar/Nuevo
            </div>
		 	<div class="col-md-2">
                <img type="" src="../../../../../imagenes/ikonoz/impresion-01.png" class="iconsButtons" title="Guargar" onClick="">
                <br>Imprimir
            </div>
            <div class="col-md-2">
                <img type="" src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guargar" onClick="">
                <br>Guardar
            </div>
            <div class="col-md-2">
                <img onClick="window.close();" src="../../../../../imagenes/ikonoz/inicio.png" class="iconsButtons" title="Salir">
                <br>Cerrar
            </div>
		 <div class="col-md-2">&nbsp;</div>
        </div>
	<br>
	<div class="row SoloTexto2">    
            <div class="col-md-12">
                Universidad Tecnol&oacute;gica de San Juan del R&iacute;o <br>
                Departamento de Tecnolog&iacute;as de la Informaci&oacute;n <br>
                <a href="mailto:alexisdm.ti19@utsjr.edu.mx" class="liga" title="Egan Alexis Dueñas Martínez">
                    Coordinador de sistemas
                </a>
            </div>
        </div>
</body>
</html>
<%
}
else
{
    out.print("Inicia sesi&oacute;n");
}
%>
