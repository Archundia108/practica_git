<%@ page language="java"  import="java.sql.*, java.lang.*, java.util.*, comun.*, prestacion_servicio.academicos.dual.*" errorPage=""%>
<%
try
{
	BD SMBD = new BD();
	registro_pedagogico ebd=new registro_pedagogico();
	ResultSet rs,rs2;
	String consultas="",nombre_alumno="",nombre_empresa="",obser_exa_psico="",nombre_plan_rotacion="",fecha_exa_psico="";
	int cve_periodo=Integer.parseInt(request.getParameter("p_TCuatri"));
  int cve_alumno=0,cve_competencia=0,calif_exa_psico=0,expediente=0,cve_empresa=0;
%>
<table width="95%" border="1" cellspacing="1" cellpadding="1" align="center" class="table-hover border border-info" id="TblAlumnosPedagogico">
      	<thead class="table-dark SoloTexto2">
	      <tr class="bg-info">
            	<th class="align-middle text-center" colspan="8" scope="col">Alumnos</th>
          <tr class="bg-secondary">
            	<th class="align-middle text-center" scope="col">Expediente</th>
            	<th class="align-middle text-center" scope="col">Nombre</th>
            	<th class="align-middle text-center" scope="col">Empresa</th>
            	<th class="align-middle text-center" scope="col">Nom. Plan de rotacion</th>
              <th class="align-middle text-center" scope="col">Fecha del examen</th>
            	<th class="align-middle text-center" scope="col">Calificacion psicologica</th>
            	<th class="align-middle text-center" scope="col">Observaciones</th>
            	<th class="align-middle text-center" scope="col">Guardar</th>
          </tr>
         </tr>
     	</thead>
    <tbody>
  <%
    consultas="SELECT ISNULL(direc_empresas.nombre, 'Pendiente') AS Empresa, personas.nombre+' '+personas.apellido_pat+' '+ "
             +"personas.apellido_mat AS nombre, ISNULL(dual_alumnos.calif_exa_psico,0)AS calificacion, "
             +"ISNULL(dual_alumnos.obser_exa_psico,'...')AS observaciones, alumnos.expediente, ISNULL(dual_alumnos.nom_plan_rotacion,'Pendiente') "
             +"AS Nom_plan_rotacion, dual_alumnos.cve_alumno, "
             +"dual_alumnos.cve_competencia, dual_alumnos.cve_empresa, dual_alumnos.cve_periodo, "
             +"ISNULL(convert(varchar(10),dual_alumnos.fecha_exa_psico,103),'_/_/_')AS fecha_de_examen "
             +"FROM dual_alumnos INNER JOIN alumnos ON dual_alumnos.cve_alumno = alumnos.cve_alumno "
             +"INNER JOIN personas ON dual_alumnos.cve_alumno = personas.cve_persona "
             +"LEFT OUTER JOIN direc_empresas ON dual_alumnos.cve_empresa = direc_empresas.cve_empresa "
             +"WHERE (dual_alumnos.cve_periodo = "+cve_periodo+") order by personas.nombre asc";
             
    //out.println(consultas);
    rs=SMBD.SQLBD(consultas);
    while(rs.next())
    {
      nombre_empresa=rs.getString(1);
      nombre_alumno=rs.getString(2);
      calif_exa_psico=rs.getInt(3);
      obser_exa_psico=rs.getString(4);
      expediente=rs.getInt(5);
      nombre_plan_rotacion=rs.getString(6);
      cve_alumno=rs.getInt(7);
      cve_competencia=rs.getInt(8);
      cve_empresa=rs.getInt(9);
      cve_periodo=rs.getInt(10);
      fecha_exa_psico=rs.getString(11);

      ebd.cve_alumno=cve_alumno;
      ebd.cve_competencia=cve_competencia;
      ebd.cve_periodo=cve_periodo;
      ebd.bucarCalif();

      //out.print(cve_competencia);
  %>
          <tr>
              <th scope="row" class="align-middle text-center" title="<%=cve_alumno%>"><%=expediente%></th>
              <td class="align-middle text-center"><%=nombre_alumno%></td>
              <td class="align-middle text-center"><%=nombre_empresa%></td>
              <td class="align-middle text-center"><%=nombre_plan_rotacion%></td>
              <td class="align-middle text-center"><%=fecha_exa_psico%></td>
              <td class="align-middle text-center">
                <select type="int" id="SCalificacion_<%=cve_alumno%>" name="SCalificacion_<%=cve_alumno%>" class="captura_obligada combo100">
                        <option value="<%=calif_exa_psico%>"><%=calif_exa_psico%></option>
                                <option value="<%=ebd.calif_exa_psico%>"><%=ebd.calif_exa_psico%></option>
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
                  <textarea id="TObservaciones_<%=cve_alumno%>" onkeypress="return FCaracteres(event);" name="TObservaciones<%=cve_alumno%>" type="textarea" class="captura combo150" id="" maxlength="200" autofocus style="margin-top: 1.32812; margin-bottom: 1.32812; height: 50px;" ><%=obser_exa_psico%></textarea>
                  <input type="hidden" name="" id="" value="<%=obser_exa_psico%>"></td>
              <td class="align-middle text-center">
                  <button type="" class="btn btn-info btn-sm" title="Guardar" onClick="FGuardarCalif(<%=cve_alumno%>,<%=cve_periodo%>,<%=cve_competencia%>)">Guardar</button>
                  
            </td>
        </tr>
        <%
    }
    SMBD.desconectarBD();
%>
    </tbody>
</table>
<script>
  function FCaracteres(event) 
    {
        var key = (event.keyCode || event.which);                
        var tecla = String.fromCharCode(key).toString();
        var letras = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyzáéíóú1234567890 ,@.:";

        if (letras.indexOf(tecla) == 13) 
        {
            if (letras.indexOf(tecla) == -1) 
            {
                return false;   
            }
        }
    }
</script>
<%
}
catch(Exception e)
{
	out.print("error: "+e);
}
%>