<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.lang.*, java.util.*, comun.*, prestacion_servicio.academicos.dual.*" errorPage="/../../error.jsp"%>
<%
if (session.getAttribute("usuario") != null)
{
		String usuario = String.valueOf(session.getAttribute("usuario"));
        int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("clave_usuario")));

        BD SMBD = new BD();
        ResultSet rs, rs2;
        String consultas="",nombre_materia="",nombre_profesor="";
        int cve_materia=0,cve_maestro=0;
        int cve_alumno=Integer.parseInt(request.getParameter("cve_alumno"));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <title>Observaciones del alumno</title>

        <link rel="stylesheet" href="../../../../../../estilos/sic.css">
        <link rel="stylesheet" href="../../../../../../estilos/normalize.css">
        <link rel="stylesheet" href="../../../../../../estilos/estilos.css">
        <link rel="stylesheet" href=".././../../../../estilos/bootstrap.min.css">
        <link rel="stylesheet" href="../../../../../../estilos/bootstrap4.2.1.min.css">

        <script type="text/javascript" language="JavaScript1.2" src="../../../../../../jsp/menu/stmenu.js"></script>
        <script type="text/javascript" language="JavaScript1.2" src="../../../../../../js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" language="JavaScript1.2" src="../../../../../../js/popcalendar.js"></script>
        <script type="text/javascript" language="JavaScript1.2" src="../../../../../../js/bootstrap.min.js"></script>
        </head>
    <body>
        <table width="80%" cellpadding="0" cellspacing="0" border="0" align="center">
         <!--<tr>
                <td><img src="../../../../../../imagenes/banner.jpg" width="100%" height="80"></td>
            </tr>-->
            <tr align="center">
                <td class="titulo">Proyecto Dual</td>
            </tr>
            <tr align="center">
                <td class="usuario"><%=usuario%></td>
            </tr>
            <tr align="center">
                <td class="encabezado">Horario de alumno(Asesor dual)</td>
            </tr>
        </table>
        
        <div class="row SoloTexto2">
            <div class="col-md-4">&nbsp;</div>
            <div class="col-md-2">
                " Nombre: "
                <br>
                <label class="alert-success">Egan Alexis Dueñas Martínez</label>
            </div>
        <div class="col-md-1">
            " Expediente : "
            <br>
            <label class="alert-success">2019143023</label>
        </div>
        <div class="col-md-4">&nbsp;</div>
    </div>       
    <br>

    <div class="col-md-12">
        <table width="95%" class="table table-hover table-sm border border-info" border="1" cellpadding="0" cellspacing="0">
                <thead class="table-dark SoloTexto2">
                    <tr class="bg-info">
                        <th class="align-middle text-center" colspan="2">Horario</th>
                    </tr>
                    <tr class="bg-secondary">
                        <th class="align-middle text-center">Profesor</th>
                        <th class="align-middle text-center">Materia</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%
                            consultas="SELECT  horarios_clase.cve_materia, horarios_clase.cve_maestro, materias.nombre, (personas.nombre+'  '+personas.apellido_pat+'  '+personas.apellido_mat)AS nombre_prof "
                          +"FROM  horarios_clase INNER JOIN "
                          +"materias ON horarios_clase.cve_materia = materias.cve_materia INNER JOIN "
                          +"personas ON horarios_clase.cve_maestro = personas.cve_persona "
                          +"WHERE   (horarios_clase.cve_grupo = 3966) "
                          +"GROUP BY horarios_clase.cve_materia, horarios_clase.cve_maestro, " 
                          +"materias.nombre, personas.nombre, personas.apellido_pat, personas. "
                          +"apellido_mat";
                          rs=SMBD.SQLBD(consultas);
                          while(rs.next())
                          {
                            cve_materia=rs.getInt(1);
                            cve_maestro=rs.getInt(2);
                            nombre_materia=rs.getString(3);
                            nombre_profesor=rs.getString(4);

                          
                        %>
                        <th class="align-middle text-center"><%=nombre_profesor%></th>
                        <th class="align-middle text-center"><%=nombre_materia%></th>
                    </tr>
                    <%
                    }
                    SMBD.desconectarBD();
                    %>
                </tbody>
            </table>
    </div>

    <div class="col-md-3">&nbsp;</div>
       <div class="col-md-12" align="center">
                <img onClick="window.close();" src="../../../../../../imagenes/ikonoz/salir.png" class="iconsButtons" title="Cerrar">
                <br>Cerrar
            </div>

            <br>

    <div class="row SoloTexto2">    
            <div class="col-md-12">
                Universidad Tecnol&oacute;gica de San Juan del R&iacute;o <br>
                Departamento de Tecnolog&iacute;as de la Informaci&oacute;n <br>
                <a href="mailto:alexisdm.ti19@utsjr.edu.mx" class="liga" title="Egan Alexis Dueñas Martínez">
                Desarrollo-Estadias
                </a>
            </div>
    </div>
<%
}
else
{
    out.print("Inicia sesi&oacute;n");
}
%>
