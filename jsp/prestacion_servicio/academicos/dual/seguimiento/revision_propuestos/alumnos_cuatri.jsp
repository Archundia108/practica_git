<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.lang.*, java.util.*, comun.*, prestacion_servicio.academicos.dual.*" errorPage=""%>
<%
try
{
	BD SMBD = new BD();
	revision_propuestos ebd=new revision_propuestos();
	ResultSet rs;
	String consultas="";
	int cve_periodo=Integer.parseInt(request.getParameter("p_TCuatri"));
	//int cve_periodo = 70;
	String expediente="",nombre_alumno="",nombre_periodo="", nombre_asesor_dual_utsjr="",nombre_grupo="",nombre_tutor="",nom_plan_rotacion="",convocatoria="";
	int cve_grupo=0,cve_asesor_dual=0,cve_tutor=0,cve_alumno=0,grado_alumno=0,cve_competencia=0;
	
%>
	<table width="95%" border="1" cellspacing="1" cellpadding="1" align="center" class="table-hover border border-info">
		<thead class="table-dark SoloTexto2">
			<tr class="bg-info">
				<th class="align-middle text-center" colspan="10" scope="col">Listado Personas</th>
			</tr>
		   <tr class="bg-secondary align-middle text-center">
				<th scope="col">Expediente</th>
				<th scope="col">Nombre</th>
				<th scope="col">Grado</th>
				<th scope="col">Tutor</th>
				<th scope="col">Grupo</th>
				<th scope="col">Convocatoria</th>
				<th scope="col">Nom. Plan de rotación</th>
				<th scope="col">Asesor Dual</th>
				<th scope="col">Guardar asesor</th>
				<th scope="col">Notificar</th>            
		   </tr>
		</thead>
	<tbody>
	<%
	consultas="SELECT alumnos.expediente, personas.nombre + ' ' + personas.apellido_pat + ' ' + personas.apellido_mat AS nombre, "
	+"alumnos.cve_grupo, grupos.nombre AS grupo, alumnos.cve_alumno, alumnos.grado_actual, "
        +"personas_1.nombre + ' ' + personas_1.apellido_pat + ' ' + personas_1.apellido_mat AS tutor, "
	+"dual_alumnos.cve_asesor_dual_utsjr, dual_alumnos.cve_competencia, "
	+"ISNULL(dual_alumnos.nom_plan_rotacion, 'Pendiente') AS Expr1, dual_convocatorias.descripcion "
+"FROM   grupos INNER JOIN personas INNER JOIN alumnos INNER JOIN dual_alumnos ON "
	+"alumnos.cve_alumno = dual_alumnos.cve_alumno ON personas.cve_persona = dual_alumnos.cve_alumno "
	+"ON grupos.cve_grupo = alumnos.cve_grupo INNER JOIN personas AS personas_1 ON "
	+"dual_alumnos.cve_tutor = personas_1.cve_persona INNER JOIN dual_convocatorias ON "
	+"dual_alumnos.cve_convocatoria = dual_convocatorias.cve_convocatoria "
+"WHERE  (dual_alumnos.cve_periodo = "+cve_periodo+") ORDER BY nombre";
			   
    //out.println(consultas);
    rs=SMBD.SQLBD(consultas);
    while(rs.next())
    {
    	expediente=rs.getString(1);
    	nombre_alumno=rs.getString(2);
    	nombre_grupo=rs.getString(4);
    	cve_alumno=rs.getInt(5);
    	grado_alumno=rs.getInt(6);
    	nombre_tutor=rs.getString(7);
    	cve_competencia=rs.getInt(9);
    	nom_plan_rotacion=rs.getString(10);
    	convocatoria=rs.getString(11);

    	ebd.cve_periodo=cve_periodo;
    	ebd.cve_alumno=cve_alumno;
    	ebd.cve_competencia=cve_competencia;

    	ebd.FBuscar_asesor_dual_utsjr();
    	
    	//out.println("&-"+ebd.nombre_asesor_dual_utsjr);
    %>
	<tr>
		<th scope="row" class="align-middle text-center" title="<%=cve_alumno%>"><%=expediente%></th>
		<td class="align-middle text-center"><%=nombre_alumno%></td>
		<td class="align-middle text-center"><%=grado_alumno%></td>
		<td class="align-middle text-center"><%=nombre_tutor%></td>
		<td class="align-middle text-center"><%=nombre_grupo%></td>
		<td class="align-middle text-center"><%=convocatoria%></td>
		<td class="align-middle text-center"><%=nom_plan_rotacion%></td>
		<td class="align-middle text-center">
			<select type="text" id="SAsesor_<%=cve_alumno%>" name="SAsesor_<%=cve_alumno%>" onLoad="" class="captura_obligada combo100" >
				<option value="<%=ebd.cve_asesor_dual_utsjr%>"><%=ebd.nombre_asesor_dual_utsjr%></option>
				  <%
                consultas="SELECT personas.nombre + ' ' +personas.apellido_pat + ' '+personas.apellido_mat AS nombre,personal.cve_persona "
								 +"FROM personas INNER JOIN "
					          +"personal ON personas.cve_persona = personal.cve_persona "
					          +"WHERE(personal.activo = 1) AND (personas.cve_universidad = 1)order by(nombre)asc";
                         ResultSet rs2=SMBD.SQLBD(consultas);
                         while(rs2.next())
                         {
                         	nombre_asesor_dual_utsjr=rs2.getString(1);
                         	cve_asesor_dual=rs2.getInt(2) ;    
              %>
            <option value="<%=cve_asesor_dual%>"><%=nombre_asesor_dual_utsjr%></option>
              <%
                         }
                SMBD.desconectarBD();       
               %>
			</select></td>
<td class="align-middle text-center">
	<input type="button" value="Guardar asesor" name="guardar" href="" class="btn btn-info btn-sm" onClick="FGuardarAsesor(<%=cve_alumno%>,<%=cve_periodo%>,<%=cve_competencia%>);">
</td>
<td class="align-middle text-center">
	<input type="button" value="Notificar" name="Notificar" href="" class="btn btn-info btn-sm" onClick="FNotificacion(<%=cve_alumno%>,<%=cve_periodo%>,<%=cve_competencia%>);">
</td>
</tr>
    <%
    }
    SMBD.desconectarBD();
%>
</tbody>
</table>

<script type="text/javascript">
</script>
<%
}
catch(Exception e)
{
	out.print("error: "+e);
}
%>