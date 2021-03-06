<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  import="java.sql.*, prestacion_servicio.academicos.dual.*, java.lang.*, java.util.*, comun.*" errorPage=""%>
<%
if (session.getAttribute("usuario") != null)
{
    String usuario = String.valueOf(session.getAttribute("usuario"));
    int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("clave_usuario")));

    BD SMBD = new BD();
    ResultSet rs;
    String consultas="",nombre_periodo="";
    int cve_periodo=0,cve_asesor_dual=0;
%>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <title>Registro de calificación psicopedagógica</title>

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
                        <td class="encabezado">Registro de calificación psicopedagógica(Psicologa)</td>
                    </tr>
                </table>
                <br>
                <div class="col-md-2" id="gif_espera">&nbsp;</div>
        
        <div class="col-md-10" align="center">
            <br>Cuatrimestre
                <select type="text" onChange="FCargarCuatri();" id="TCuatri" name="TCuatri" class="captura_obligada combo100">
                    <option value="0">...Seleccionar...</option>
                    <%
                        consultas="SELECT cve_periodo "
                                 +"FROM periodos " 
                                 +"WHERE (cve_periodo>=68)";
                                 rs=SMBD.SQLBD(consultas);
                                 while(rs.next()){
                                    cve_periodo=rs.getInt(1);
                                    nombre_periodo=SMBD.nombre_Periodo(cve_periodo);
                                 %><option value="<%=cve_periodo%>"><%=nombre_periodo%></option>
                                 <%
                                 }
                                 SMBD.desconectarBD();
                                %>
                </select>
        </div>
        <br>
    <div id="ListadoAlumnos" >
        <table width="80%"  cellspacing="1" cellpadding="1" align="center" class="table-hover border border-info">
                        <thead class="table-dark SoloTexto2">
                            <tr class="bg-info">
                                <th class="align-middle text-center" colspan="9" scope="col">Alumnos</th>
                                <tr class="bg-secondary">
                                    <th class="align-middle text-center" scope="col">Expediente</th>
                                    <th class="align-middle text-center" scope="col">Nombre</th>
                                    <th class="align-middle text-center" scope="col">Empresa</th>
                                    <th class="align-middle text-center" scope="col">Nom. Plan de rotación</th>
                                    <th class="align-middle text-center" scope="col">Fecha del examen</th>
                                    <th class="align-middle text-center" scope="col">Calificacion psicológica</th>
                                    <th class="align-middle text-center" scope="col">Observaciones</th>
                                    <th class="align-middle text-center" scope="col">Fecha</th>
                                    <th class="align-middle text-center" scope="col">Guardar</th>
                                </tr>
                            </tr>
                        </thead>
                    <%

                    %>
                        <tbody>
                            
                        </tbody>
                    </table>
                </div>
                <br>

                <div class="col-md-12" align="center">
                <img src="../../../../../imagenes/ikonoz/inicio.png" class="iconsButtons" title="Salir" onclick="FSalir();">
                <br>Salir
            </div>
        <div class="row SoloTexto2">    
        <div class="col-md-12">
            Universidad Tecnol&oacute;gica de San Juan del R&iacute;o <br>
            Departamento de Tecnolog&iacute;as de la Informaci&oacute;n <br>
            <a href="mailto:alexisdm.ti19@utsjr.edu.mx" class="liga" title="Egan Alexis Dueñas Martínez">
            Desarrollo-Estadias
            </a>
        </div>
    </div>
        <br>
</body>
<script type="text/javascript">
    function FTerminaCarga()
        {
            $('#gif_espera').html('&nbsp;');
        }

    function FCargando()
        {
          $('#gif_espera').html('<img src="../../../../../imagenes/ajax-loader.gif" width="50">');  
        }

    function FSalir()
        {
            location.href="./../../../../../menuDual.jsp";
        }

    function FCargarCuatri()
     {
        //alert($('#TCuatri').val());
        if($('#TCuatri').val()!=0)
        {
            FCargando();
            var par=
            {
                "p_TCuatri" : $('#TCuatri').val()
            };
            //alert("seguimiento/registro_pedagogico.jsp?p_TCuatri="+par.p_TCuatri);
            $.post(
                "registro_pedagogico/pedagogico_alumnos_cuatri.jsp",par,function(htmlExterno)
                {
                    $('#ListadoAlumnos').html(htmlExterno);
                    console.log(htmlExterno);
                    FTerminaCarga();
                }
            );
        }
     }

     function FGuardarCalif(cve_alumno,cve_periodo,cve_competencia)
     {
        //alert(cve_competencia);
        var valida=0;
        if($('#SCalificacion_'+cve_alumno).val()>0)
        {
            valida++;
        }
        else
        {
            alert('Asigne calificacion primero.');
            $('#SCalificacion_'+cve_alumno).focus();
        }
        //alert($('#SCalificacion_'+cve_alumno).val()+" "+valida);
        if(valida>0)
        {
            FCargando();
            var par=
            {
                "p_SCalificacion":$('#SCalificacion_'+cve_alumno).val(),
                "p_TObservaciones":$('#TObservaciones_'+cve_alumno).val(),
                "p_cve_alumno":cve_alumno,
                "p_cve_periodo":cve_periodo,
                "p_cve_competencia":cve_competencia
            };
            //alert("registro_pedagogico/guardar_calif_pedagogica.jsp?p_SCalificacion_="+par.p_SCalificacion+"&p_TObservaciones="+par.p_TObservaciones+"&p_cve_alumno="+par.p_cve_alumno+"&p_cve_periodo="+par.p_cve_periodo+"&p_cve_competencia="+par.p_cve_competencia);
            $.ajax({
                data:par,
                url:"registro_pedagogico/guardar_calif_pedagogica.jsp",
                type:"POST",
                dataType:"JSON",
                success:function(res)
                {
                    //data = JSON.parse(res);
                    alert(res.error);
                    FTerminaCarga();
                }
            });
        }
     }
</script>
</html>
<%
}
else
{
    out.print("Inicia sesi&oacute;n");
}
%>