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
   <title>Observaciones del alumno</title>

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
                <td class="encabezado">Observaciones del alumno(Asesor dual)</td>
            </tr>
         </table>
         <br>

   <div class="row SoloTexto2">
            <div class="col-md-2">&nbsp;</div>
            
        <div class="col-md-2">
           " Observaciones del Asesor Dual "
           <br>
           <textarea name="" type="textarea" class="captura combo200" id="" maxlength="200" autofocus style="margin-top: 1.32812; margin-bottom: 1.32812; height: 101px;" rows="5"></textarea>
           <input type="hidden" name="" id="" value="43">
       </div>
       <div class="col-md-2">
           " Observaciones del Inst. de Empresa "
           <br>
           <textarea name="" type="textarea" class="captura combo200" id="" maxlength="200" autofocus style="margin-top: 1.32812; margin-bottom: 1.32812; height: 101px;" ></textarea>
           <input type="hidden" name="" id="" value="43">
       </div>
       <div class="col-md-1">
          <img type="" src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guargar" onClick="">
                <br>Guardar 
       </div>
       <div class="col-md-2">&nbsp;</div>

       <br>
</div>
<br>

<div class="col-md-3">&nbsp;</div>
       <div class="col-md-12" align="center">
                <img onClick="window.close();" src="../../../../../imagenes/ikonoz/inicio.png" class="iconsButtons" title="Cerrar">
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
</body>
</html>
<%
}
else
{
    out.print("Inicia sesi&oacute;n");
}
%>
