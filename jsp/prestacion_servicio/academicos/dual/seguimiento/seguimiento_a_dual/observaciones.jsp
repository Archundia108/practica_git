<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.lang.*, java.util.*, comun.*" errorPage="../../../../../../error.jsp"%>
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
                <td class="encabezado">Observaciones del alumno(Asesor dual)</td>
            </tr>
         </table>
         <br>

   <div class="row SoloTexto2">
            <div class="col-md-2">&nbsp;</div>   
        <div class="col-md-1">
            Fecha
            <br>
            <input class="captura combo100" type="text" name="FechaObser" readonly id="FechaObser"> 
        </div>
        <div class="col-md-3">
           " Observaciones del Asesor Dual "
           <br>
           <textarea name="ObserAssesor" id="ObserAssesor" type="textarea" class="captura combo200"  maxlength="200" autofocus style="margin-top: 1.32812; margin-bottom: 1.32812; height: 101px;" rows="5"></textarea>
           <input type="hidden" name="" id="" value="43">
       </div>
       <div class="col-md-3">
           " Observaciones del Inst. de Empresa "
           <br>
           <textarea name="ObserInst" id="ObserInst" type="textarea" class="captura combo200"  maxlength="200" autofocus style="margin-top: 1.32812; margin-bottom: 1.32812; height: 101px;" rows="5"></textarea>
           <input type="hidden" name="" id="" value="43">
       </div>
       <div class="col-md-2">
          <img type="" src="../../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guargar" onClick="">
                <br>Guardar 
       </div>
       <div class="col-md-1">&nbsp;</div>
</div>
<br>

<div class="col-md-12 Solotexto2">
    <table class="table table-hover table-sm border border-info">
        <thead class="table-dark SoloTexto2">
              <tr class="bg-info">
                <th class="align-middle text-center" colspan="4" scope="col">
                    Evaluaciones 
                </th>
                <tr>
                    <th class="align-middle text-center" scope="col">fecha</th>
                    <th class="align-middle text-center" scope="col">Tutor</th>
                    <th class="align-middle text-center" scope="col">Instructor</th>
                    <th class="align-middle text-center" scope="col">---</th>
                </tr>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th scope="row" class="align-middle text-center">-</th>
                <td class="align-middle text-center">obsercaciones del tutor</td>
                <td class="align-middle text-center">observaciones del instructor</td>
                <td class="align-middle text-center">-</td>
            </tr>
        </tbody>
    </table>
</div>

<div class="col-md-3">&nbsp;</div>
       <div class="col-md-12" align="center">
                <img onClick="window.close();" src="../../../../../../imagenes/ikonoz/inicio.png" class="iconsButtons" title="Cerrar">
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
