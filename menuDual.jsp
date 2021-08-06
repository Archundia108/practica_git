<%@ page language="java" errorPage="../error.jsp"%> 
<%
if (session.getAttribute("usuario") != null)
{
    String usuario = String.valueOf(session.getAttribute("usuario"));
    int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("cve_usuario")));

%>


<html>
    <head>
        <meta http-equiv="Content-Type"content="text/html" charset="iso-8859-1"/>
        
        <title>Dual</title>

        <link rel="stylesheet" href="estilos/sic.css">
        <link rel="stylesheet" href="estilos/normalize.css">
        <link rel="stylesheet" href="estilos/estilos.css">
        <link rel="stylesheet" href="estilos/bootstrap.min.css">

        <!--<script type="text/javascript" language="JavaScript1.2" src="jsp/menu/stmenu.js"></script>-->
        <script type="text/javascript" language="JavaScript1.2" src="js/jquery-2.2.4.min.js"></script>
       <!--<script type="text/javascript" language="JavaScript1.2" src="js/popcalendar.js"></script>-->
        <!--<script type="text/javascript" language="JavaScript1.2" src="js/bootstrap.min.js"></script>-->
        </head>
        <body>
            <table width="80%" cellpadding="0" cellspacing="0" border="0" align="center">
                <tr align="center">
                    <td><img src="imagenes/banner.jpg" width="751" height="80"></td>
                </tr>
                <tr align="center">
                    <td class="titulo">PROYECTO DUAL</td>
                </tr>
                <tr align="center">
                    <td class="usuario"><%=usuario%></td>
                </tr>
                <tr align="center">
                    <td class="encabezado">Men&uacute;</td>
                </tr>
            </table>

            <br>

            <table style="margin:auto;" class="" width="80%" height="203" cellspacing="0" cellpadding="0" border="1">
                <tbody>
                    <tr class="SoloTexto">
                        <td colspan="2" align="center" >Menu</td>
                    </tr>
                    <tr>
                        <td class="SoloTexto" colspan="1" align="center" >Accesos</td>
                        <td colspan="1" class="SoloTexto">Actores</td>
                    </tr>
                    <tr>
                        <td style="background-color: #2EFE64;" colspan="1" align="center" ><a href="jsp/prestacion_servicio/academicos/dual/convocatoria/dual_puestos_aprendizaje.jsp" class="liga">Registro de puestos de aprendizaje</a></td>
                        <td colspan="1" class="SoloTexto2">Director</td>
                    </tr>
                    <tr>
                        <td style="background-color: #2EFE64;" colspan="1" align="center" ><a href="jsp/prestacion_servicio/academicos/dual/convocatoria/dual_convocatorias.jsp" class="liga">Registro de convocatorias</a></td>
                        <td colspan="1" class="SoloTexto2">Director</td>
                    </tr>
                    <tr>
                        <td style="background-color: #2EFE64;" colspan="1" align="center" ><a href="jsp/prestacion_servicio/academicos/dual/convocatoria/dual_alumnos_propuestos.jsp" class="liga">Registro de alumnos propuestos</a></td>
                        <td class="SoloTexto2" colspan="1" align="center">Tutor</td>
                    </tr>
                    <tr>
                        <td style="background-color: #2EFE64;" colspan="1" align="center" ><a href="" class="liga">Reporte 1</a></td>
                        <td class="SoloTexto2" colspan="1" align="center">--</td>
                    </tr>
                    <tr>
                        <td style="background-color: #2EFE64;" colspan="1" align="center" ><a href="" class="liga">Reporte 2</a></td>
                        <td class="SoloTexto2" colspan="1" align="center">--</td>
                    </tr>
                    <tr>
                        <td style="background-color: #0099FF;" colspan="1" align="center"><a href="jsp/prestacion_servicio/academicos/dual/seguimiento/revision_propuestos.jsp" class="liga">Revision de alumnos propuestos</a></td>
                        <td class="SoloTexto2">Coordinador del Modelo Dual</td>
                    </tr>
                    <tr>
                        <td style="background-color: #0099FF;" colspan="1" align="center"><a href="jsp/prestacion_servicio/academicos/dual/seguimiento/registro_pedagogico.jsp" class="liga">Registro de calificacion Psicopedagogico</a></td>
                        <td class="SoloTexto2">Psicologa</td>
                    </tr>
                    <tr>
                        <td style="background-color: #0099FF;" colspan="1" align="center" ><a href="jsp/prestacion_servicio/academicos/dual/seguimiento/seg_tabla.jsp" class="liga">Seguimiento del asesor dual</a></td>
                        <td class="SoloTexto2">Asesor dual</td>
                    </tr>
                    <tr>
                        <td style="background-color: #0099FF;" colspan="1" align="center" ><a href="" class="liga">Reporte 1 </a></td>
                        <td class="SoloTexto2">-</td>
                    </tr>
                    <tr>
                        <td style="background-color: #0099FF;" colspan="1" align="center" ><a href="" class="liga">Reporte 2</a></td>
                        <td class="SoloTexto2">-</td>
                    </tr>
                </tbody>
            </table>
        <div class="col-md-3">&nbsp;</div>

        <table width="56%" cellpadding="0" cellspacing="0" align="center">
            <tbody>
            <tr align="center">
                <td>
                    <img width="50" height="45" src="imagenes/ikonoz/inicio.png" class="iconsButtons" title="Salir">
                        <br>
                        <span class="Tabla">
                            Salir
                        </span>
                </td>
            </tr>
        </tbody>
        </table>
            <br>
            <div class="row SoloTexto2">    
                <div class="col-md-12">
                    Universidad Tecnol&oacute;gica de San Juan del R&iacute;o <br>
                    Departamento de Tecnolog&iacute;as de la Informaci&oacute;n <br>
                    <a href="mailto:ncruzs@utsjr.edu.mx" class="liga" title="Neftali Cruz Soriano">
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