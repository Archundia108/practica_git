<%@ page language="java"  import="java.sql.*, java.lang.*, java.util.*, comun.*" errorPage="../../../../../../error.jsp"%>
<%
if (session.getAttribute("usuario") != null)
{
    String usuario = String.valueOf(session.getAttribute("usuario"));
    int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("cve_usuario")));

    BD SMBD = new BD();
    ResultSet rs;
    String consultas="",nombre_periodo="";
    int cve_periodo=0;
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>

    <title>Seguimiento</title>

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
                        <td class="encabezado">Seguimiento(Asesor dual)</td>
                    </tr>
                </table>
                <br>
                <div class="col-md-12" align="center">
                <br>Cuatrimestre
                <select type="text" onChange="FCargarCuatri();"class="captura_obligada combo100" id="TCuatri" name="TCuatri">
                    <option value="0">...Seleccionar...</option>
                    <%
                        consultas="SELECT cve_periodo "
                                 +"FROM periodos " 
                                 +"WHERE cve_periodo>=68";
                        rs=SMBD.SQLBD(consultas);
                        while(rs.next())
                        {
                            cve_periodo=rs.getInt(1);
                            nombre_periodo=SMBD.nombre_Periodo(cve_periodo);        
                    %>
                    <option value="<%=cve_periodo%>"><%=nombre_periodo%></option>
                    <%
                    }
                    SMBD.desconectarBD();
                    %>
                </select>
            </div>
        <br>
    <div id="ListadoAlumnos" class="col-md-12">
        <div class="col-md-2">&nbsp;</div>
        <table tyle="margin: auto;" class="table table-hover table-sm border border-info" cellpadding="0" cellspacing="0" id="">
            <thead class="table-dark SoloTexto2">
                <tr class="bg-info">
                    <th class="align-middle text-center" colspan="10" scope="col">Seguimiento</th>
                    <tr class="bg-secondary">
                        <th class="align-middle text-center" scope="col">Expediente</th>
                        <th class="align-middle text-center" scope="col">Nombre</th>
                        <th class="align-middle text-center" scope="col">Empresa</th>
                        <th class="align-middle text-center" scope="col">Plan de rotacion</th>
                        <th class="align-middle text-center" scope="col">Calif. examen conocimientos</th>
                        <th class="align-middle text-center" scope="col">Observaciones</th>
                        <th class="align-middle text-center">Fecha</th>
                        <th class="align-middle text-center">Guardar</th>
                        <th class="align-middle text-center">Evidencia de evaluacion</th>
                        <th class="align-middle text-center">Ver PDF</th>
                    </tr>
                </tr>
            </thead>
            <%

            %>
            <tbody>
                
            </tbody>
        </table>
                    <div class="col-md-2">&nbsp;</div>
                </div>
                <br>
        <div class="col-md-12" align="center">
                <img src="../../../../../imagenes/ikonoz/inicio.png" class="iconsButtons" title="Salir" onclick="FSalir();">
                <br>Salir
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
        alert($('#TCuatri').val());
        if($('#TCuatri').val()!=0)
        {
            FCargando();
            var par={"p_TCuatri" : $('#TCuatri').val()};
            alert("seg_tabla/seg_alumnos_cuatri.jsp?p_TCuatri="+par.p_TCuatri);
            $.post("seg_tabla/seg_alumnos_cuatri.jsp",par,function(htmlExterno){
                $('#ListadoAlumnos').html(htmlExterno);
                console.log(htmlExterno);
                FTerminaCarga();
            });
        }
     }

     

     function FGuardarCalif(cve_alumno,cve_periodo,cve_puesto_aprendizaje)
     {
        var valida=0;
        if($('#SCalifConoc_'+cve_alumno).val()>=0)
        {
            valida++;
        }
        else
        {
            alert('Asigne calificacion primero.');
            $('#SCalifConoc_'+cve_alumno).focus();
        }
        alert($('#SCalifConoc_'+cve_alumno).val()+" "+valida);
        if(valida>0)
        {
            FCargando();
            var par=
            {
                "p_SCalifConoc":$('#SCalifConoc_'+cve_alumno).val(),
                "p_TObservaciones":$('#TObservaciones_'+cve_alumno).val(),
                "p_cve_alumno":cve_alumno,
                "p_cve_periodo":cve_periodo,
                "p_cve_puesto_aprendizaje":cve_puesto_aprendizaje
            };
            alert("registro_pedagogico/guardar_calif_pedagogica.jsp?p_SCalifConoc_="+par.p_SCalifConoc+"&p_TObservaciones="+par.p_TObservaciones+"&p_cve_alumno="+par.p_cve_alumno+"&p_cve_periodo="+par.p_cve_periodo+"&p_cve_puesto_aprendizaje="+par.p_cve_puesto_aprendizaje);
            $.ajax({
                data:par,
                url:"seg_tabla/guardar_seg_alumnos.jsp",
                type:"POST",
                success:function(res)
                {
                    data = JSON.parse(res);
                    alert(data.error);
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