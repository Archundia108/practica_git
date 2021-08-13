<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.lang.*, java.util.*, comun.*, prestacion_servicio.academicos.dual.*" errorPage="../../error.jsp"%>
<%
try
{
	BD SMBD = new BD();
	revision_propuestos ebd=new revision_propuestos();
	ResultSet rs;
	int cve_alumno=0,cve_competencia=0,calif_exa_conoc=0;
	String consultas="",expediente="",nombre_alumno="",nombre_empresa="",nombre_puesto_aprendizaje="",fecha_exa_conoc="",obser_exa_conoc="";
	int cve_periodo=Integer.parseInt(request.getParameter("p_TCuatri"));
%>
<table width="100%" border="1" cellspacing="1" cellpadding="1" align="center" class="table-hover border border-info">
    <thead class="table-dark SoloTexto2">
        <tr class="bg-info border-info">
            <th class="align-middle text-center" colspan="9" scope="col">Seguimiento</th>
            <tr class="bg-secondary">
                        <th class="align-middle text-center">Expediente</th>
                        <th class="align-middle text-center">Nombre</th>
                        <th class="align-middle text-center">Calif. examen conocimientos</th>
                        <th class="align-middle text-center">Observaciones</th>
                        <th class="align-middle text-center">Fecha</th>
                        <th class="align-middle text-center">Guardar</th>
                        <th class="align-middle text-center">Evidencia de evaluación</th>
                        <th class="align-middle text-center">Ver Seguimiento</th>
                        <th class="align-middle text-center">Empresa</th>
            </tr>
        </tr>
    </thead>
    <tbody>
<%
consultas="SELECT ISNULL(direc_empresas.nombre,'Pendiente') AS Empresa, personas.nombre + ' ' + personas.apellido_pat + ' ' + personas.apellido_mat AS nombre, alumnos.expediente, dual_alumnos.cve_competencia, dual_alumnos.cve_alumno, dual_alumnos.cve_periodo, dual_puestos_aprendizaje.nombre_puesto_aprendizaje, "
        +"ISNULL(dual_alumnos.calif_exa_conoc,0)AS calificacion, "
        +"ISNULL(convert(varchar(10),dual_alumnos.fecha_exa_conoc,103),' ')AS fecha_de_examen, "
        +"ISNULL(dual_alumnos.obser_exa_conoc,'...')AS observaciones "
        +"FROM dual_alumnos INNER JOIN personas ON dual_alumnos.cve_alumno = personas.cve_persona "
        +"INNER JOIN direc_empresas ON dual_alumnos.cve_empresa = direc_empresas.cve_empresa  "
        +"INNER JOIN alumnos ON dual_alumnos.cve_alumno = alumnos.cve_alumno INNER JOIN dual_puestos_aprendizaje ON dual_alumnos.cve_competencia = dual_puestos_aprendizaje.cve_competencia "
        +"WHERE (dual_alumnos.cve_periodo = "+cve_periodo+") ORDER BY nombre";
    //out.println(consultas);
    rs=SMBD.SQLBD(consultas);
    while(rs.next())
    {
      nombre_empresa=rs.getString(1);
      nombre_alumno=rs.getString(2);
      expediente=rs.getString(3);
      cve_competencia=rs.getInt(4);
      cve_alumno=rs.getInt(5);
      cve_periodo=rs.getInt(6);
      nombre_puesto_aprendizaje=rs.getString(7);
      calif_exa_conoc=rs.getInt(8);
      fecha_exa_conoc=rs.getString(9);
      obser_exa_conoc=rs.getString(10);

      ebd.cve_alumno=cve_alumno;
      ebd.cve_competencia=cve_competencia;
      ebd.cve_periodo=cve_periodo;
    
%>
        <tr>
            <th scope="row" class="align-middle text-center"title="<%=cve_alumno%>"><%=expediente%></th>
            <td class="align-middle text-center"><%=nombre_alumno%></td>
            <td class="align-middle text-center">
                <select type="text" id="SCalifConoc_<%=cve_alumno%>" name="SCalifConoc_<%=cve_alumno%>" class="captura_obligada combo100">
                    <option value="<%=calif_exa_conoc%>"><%=calif_exa_conoc%></option>
                    <option value="-1">-1</option>
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select>
            </td>
            <td class="align-middle text-center">
                <textarea name="TObservaciones_<%=cve_alumno%>" type="textarea" class="captura combo150" id="TObservaciones_<%=cve_alumno%>" maxlength="200" autofocus style="margin-top: 1.32812; margin-bottom: 1.32812; height: 40px;" ><%=obser_exa_conoc%>
                </textarea>
                <input type="hidden" name="" id="" value="<%=obser_exa_conoc%>"></td>
            <td class="align-middle text-center"><%=fecha_exa_conoc%></td>
            <td class="align-middle text-center">
                <input type="button" value="Calificación" class="btn btn-info btn-sm" name="Guardar" title="Guardar" onClick="FGuardarCalif(<%=cve_alumno%>,<%=cve_periodo%>,<%=cve_competencia%>)">
            </td>
            </td>
            <td class="align-middle text-center">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <input type="button" value="Cargar PDF" class="btn btn-primary" name="GuardarPDF" title="Guardar" onclick="">
                    <input type="button" value="PDF" class="btn btn-primary" name="PDF" href="seguimiento_a_dual.jsp?cve_periodo=<%=cve_periodo%>" target="popup" onClick="window.open(this.href, this.target, 'width=700,height=400'); return false;">
                </div>
            </td>
            <td class="align-middle text-center">
                <button type="button" class="btn btn-outline-info btn-sm" target="popup" onClick="abrirVenSeguimiento();">Ver</button>
            </td>
            <td class="align-middle text-center"><%=nombre_empresa%></td>
        </tr>
        <%
        }
        SMBD.desconectarBD();
        %>
    </tbody>
</table>

<script type="text/javascript">
    function abrirVenSeguimiento() 
    {
    seguimientoVentana=window.open("http://localhost:8080/dual/jsp/prestacion_servicio/academicos/dual/seguimiento/seguimiento_a_dual.jsp?cve_periodo=<%=cve_periodo%>&cve_alumno=<%=cve_alumno%>&cve_competencia=<%=cve_competencia%>","seguimientoVentana","width=800,height=800");  
    }
    function cerrarVenSeguimiento(){
        seguimientoVentana.close();
    }
</script>
<%
}
catch(Exception e)
{
	out.print("error: "+e);
}
%>