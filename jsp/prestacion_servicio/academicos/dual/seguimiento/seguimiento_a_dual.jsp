<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.lang.*, java.util.*, comun.*, prestacion_servicio.academicos.dual.*" errorPage=""%>
<%
if (session.getAttribute("usuario") != null)
    {
        String usuario = String.valueOf(session.getAttribute("usuario"));
        int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("clave_usuario")));

        BD SMBD = new BD();
        ResultSet rs, rs2,rs3;
        String consultas="",nombre_periodo="",mes1="",mes2="",mes3="",mes4="",nombre_empresa="";
        int meses=0,numero_periodo=0,cve_empresa=0,cve_institucion=0,num_sem=0;     
        int cve_periodo=Integer.parseInt(request.getParameter("cve_periodo"));
        int cve_competencia=Integer.parseInt(request.getParameter("cve_competencia"));
        int cve_alumno=Integer.parseInt(request.getParameter("cve_alumno"));

        
    %>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <title>Seguimiento del asesor dual</title>

        <link rel="stylesheet" href="../../../../../estilos/sic.css">
        <link rel="stylesheet" href="../../../../../estilos/normalize.css">
        <link rel="stylesheet" href="../../../../../estilos/estilos.css">
        <link rel="stylesheet" href="../../../../../estilos/bootstrap.min.css">
        <link rel="stylesheet" href="../../../../../estilos/bootstrap4.2.1.min.css">
      

        <script type="text/javascript" language="JavaScript1.2" src="../../../../../jsp/menu/stmenu.js"></script>
        <script type="text/javascript" language="JavaScript1.2" src="../../../../../js/jquery-2.2.4.min.js"></script>
        <script type="text/javascript" language="JavaScript1.2" src="../../../../../js/popcalendar.js"></script>
        <script type="text/javascript" language="JavaScript1.2" src="../../../../../js/bootstrap.min.js"></script>
    <style>
        .row input[type="checkbox"] {
            display: block !important;
        }
    </style>
    </head>
    <body>
        <table width="80%" cellpadding="0" cellspacing="0" border="0" align="center">
           <!--<tr>
            <td><img src="../../../../../imagenes/banner.jpg" width="100%" height="80"></td>
        </tr>-->
        <tr align="center">
            <td class="titulo">Proyecto Dual</td>
        </tr>
        <tr align="center">
            <td class="usuario"><%=usuario%></td>
        </tr>
        <tr align="center">
            <td class="encabezado">Seguimiento del asesor del modelo dual(Asessor dual)</td>
        </tr>
    </table>

    <div class="row SoloTexto2">
        <div class="col-md-1">&nbsp;</div>
        <div class="col-md-2">
            " Nombre: "
            <br>
            <label class="alert-success">Egan Alexis Dueñas Martínez</label>
        </div>
        <div class="col-md-3">
            " Carrera / Unidad: "
            <br>
            <label class="alert-success"> 
                Tecnologías de la Información Área Desarrollo de Software Multiplataforma UTSJR
            </label>
        </div>
        <div class="col-md-1">
            " Grupo : "
            <br>
            <label class="alert-success">TI01SM-19</label>
        </div>
        <div class="col-md-1">
            " Grado : "
            <br>
            <label class="alert-success">6</label>
        </div>
        <div class="col-md-1">
            " Expediente : "
            <br>
            <label class="alert-success">2019143023</label>
        </div>
        <div class="col-md-1">
            <img src="../../../../../imagenes/35986.png" width="95" height="89">
        </div>
        <div class="col-md-1">&nbsp;</div>
    </div>       
    <br>

    <div class="container">  
        <div class="row SoloTexto2">
        
            <div class="col-md-2">
                Nombre de la empresa
                <br>
                <select id="SEmpresa" name="SEmpresa" class="captura_obligada combo200">
                    <option value=""></option>
                    <%
                        consultas="SELECT direc_empresas.nombre,direc_empresas.cve_empresa "
                                 +"FROM direc_empresas INNER JOIN "
                                 +"dual_empresas ON direc_empresas.cve_empresa = dual_empresas.cve_empresa "
                                 +"WHERE  (dual_empresas.cve_competencia = 1)";
                        rs2=SMBD.SQLBD(consultas);
                        while(rs2.next())
                        {
                        nombre_empresa=rs2.getString(1);
                        cve_empresa=rs2.getInt(2);        
                    %>
                    <option value="<%=cve_empresa%>"><%=nombre_empresa%> <%=cve_empresa%></option>
                    <%
                        }
                        SMBD.desconectarBD();
                    %>
                </select>     
            </div>
        
        <div class="col-md-3">
            Nombre de Plan de rotación
            <br>
            <input type="text" onkeypress="return FCaracteres(event);" onkeyup="FMayusculas(this);" id="TNomRotacion" name="TNomRotacion" class="captura_obligada combo200">    
        </div>
        <div class="col-md-3">
            Nombre del instructor de empresa
            <br>
            <input type="text" onkeyup="FMayusculas(this);" onkeypress="return FCaracteresAlfa(event);" id="TNomInst" name="TNomInst" class="captura_obligada combo200" value="">
        </div>
    
        <div class="col-md-2">
            Ap. paterno
            <br>
            <input type="text" onkeyup="FMayusculas(this);" onkeypress="return FCaracteresAlfa(event);" id="TPatInst" name="TPatInst" class="captura_obligada combo150" value="">
        </div>
        <div class="col-md-2">
            Ap. materno
            <br>
            <input type="text" onkeyup="FMayusculas(this);" onkeypress="return FCaracteresAlfa(event);" id="TMatInst" name="TMatInst" class="captura_obligada combo150" value="">
        </div>     
    </div>
</div>
<div class="row SoloTexto2">
    <div class="col-md-1">&nbsp;</div>
    <div class="col-md-2">
            Número de tel.
            <br>
            <input type="text" onkeypress="return FCaracteresNum(event);" name="TNumeroInst" id="TNumeroInst" class="captura_obligada combo100">
        </div>
        <div class="col-md-2">
            Email
            <br>
            <input type="text" onkeypress="return FCaracteres(event);" name="TCorreoInst" id="TCorreoInst" class="captura_obligada combo100">
        </div>
        <div class="col-md-2" align="center">
            <img type="" src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guardar" onClick="FGuardarDatosInst(<%=cve_alumno%>,<%=cve_periodo%>,<%=cve_competencia%>);"> <!-- cve_competencia-->
            <br>Guardar
        </div>
    <div class="col-md-5">&nbsp;</div>
</div>

    <table width="80%" cellpadding="0" cellspacing="0" border="0" align="center">
        <tr align="center">
            <td class="encabezado">Plan de rotación de puestos de aprendizaje
            </td>
        </tr>
    </table>
    <!--<table width="80%" cellpadding="0" cellspacing="0" border="0" align="center">
        <tr align="center">
            <td class="encabezado">PLANEACION DE LA ROTACION EN LOS PUESTOS DE APRENDIZAJE (horarios,alumnos empresa)
            </td>
        </tr>
    </table>-->
    <br>
    <!--container horarios-------------------------------------------->
    <div class="container-fluid">
        <div class="row">
            <!--Tabla Dias-------------------------------------------------------->
        <%

        %>
            <div class="col-md-6">
                <table style="margin: auto;" align="" class="table table-hover table-sm border border-info " cellpadding="0" cellspacing="0">
                    <thead class="table-dark SoloTexto2">
                        <tr class="bg-info">
                            <th class="align-middle text-center" colspan="6" scope="col"><P>Días</P></th>
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
                            <td class="align-middle text-center">
                               <input id="dia_l" class="mx-auto" type="checkbox"></td>
                            <td class="align-middle text-center">
                                <input id="dia_m" class="mx-auto" type="checkbox"></td>
                            <td class="align-middle text-center">
                                <input id="dia_i" class="mx-auto" type="checkbox"></td>
                            <td class="align-middle text-center">
                                <input id="dia_j" class="mx-auto" type="checkbox"></td>
                            <td class="align-middle text-center">
                                <input id="dia_v" class="mx-auto" type="checkbox"></td>
                        </tr>
                    </tbody>
                </table>   
                        <br>
                        <div class="col-md-12" align="center">
                            <img type="" src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guardar dias" onClick="FGuardarDias(<%=cve_alumno%>,<%=cve_periodo%>,<%=cve_competencia%>);">
                                <br>Guardar dias
                        </div> 
                        <br>
            </div>
                <!--Tabla Semanas en UTSJR---------------------------------------------->
                <div class="col-md-6">
                    <table style="margin: auto;" align="" class="table table-hover table-sm border border-info " cellpadding="0" cellspacing="0">
                        <thead class="table-dark SoloTexto2">
                            <tr class="bg-info">
                                <th class="align-middle text-center" colspan="17" scope="col"><P>Semanas en UTSJR</P></th>
                            </tr>
                            <tr class="bg-secondary">
                                <th class="align-middle text-center" scope="col">Institución</th>
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
                                        
                                        <%
                                            for( num_sem=1;num_sem<=16;num_sem++)
                                            {
                                                %>
                                                    <td class="align-middle text-center">
                                                        <input id="sem_UT<%=num_sem%>" class="mx-auto" type="checkbox" onclick="FGuardarSemanas(1,<%=num_sem%>);">
                                                    </td>
                                                <%
                                            }
                                        %>
                                </tr>
                                <tr>
                                    <th class="align-middle text-center" scope="col">Empresa</th>
                                        
                                        <%
                                            for( num_sem=1;num_sem<=16;num_sem++)
                                            {
                                                %>
                                                    <td class="align-middle text-center">
                                                        <input id="sem_<%=num_sem%>" class="mx-auto" type="checkbox" onclick="FGuardarSemanas(2,<%=num_sem%>);">
                                                    </td>
                                                <%
                                            }
                                        %>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br>
                                    <!--<div class="col-md-12" align="center">
                                        <img type="" src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guardar semanas" onClick="FGuardarSemanas(<%=cve_alumno%>,<%=cve_periodo%>,<%=cve_competencia%>);">
                                        <br>Guardar semanas
                                    </div>-->
                                </div>
                                <br>

                                <%
    /*consultas="SELECT periodos.cve_periodo, periodos.numero_periodo "
             +"FROM periodos INNER JOIN "
             +"dual_alumnos ON periodos.cve_periodo = dual_alumnos.cve_periodo "
             +"WHERE (periodos.cve_periodo >= 68) AND (dual_alumnos.cve_alumno = "+cve_alumno+") AND (dual_alumnos.cve_competencia = "+cve_competencia+")";*/
           consultas="SELECT numero_periodo "
                    +"FROM periodos "
                    +"WHERE (cve_periodo = "+cve_periodo+")";
           rs=SMBD.SQLBD(consultas);
        while(rs.next()){
        
        numero_periodo=rs.getInt(1);
        
        nombre_periodo=SMBD.nombre_Periodo(cve_periodo);
        
        
            switch(numero_periodo)
            {
                case 1: if(cve_periodo==70)
                {
                    mes1="Sep";
                    mes2="Oct";
                    mes3="Nov";
                    mes4="Dic";
                    break;
                }
                case 2: if(cve_periodo==68)
                {
                    mes1="Ene";
                    mes2="Feb";
                    mes3="Mar";
                    mes4="Abr";
                    break;
                }
                case 3: if(cve_periodo==69)
                {
                    mes1="May";
                    mes2="Jun";
                    mes3="Jul";
                    mes4="Ago";
                    break;
                }
            };
        }
        SMBD.desconectarBD();
    %>
<!--------Tabla meses-------------------------------------------------->
        <div id="Meses" class="col-md-6">
            <table id="Tmeses" style="margin: auto;"  class="table table-hover table-sm border border-info" cellpadding="0" cellspacing="0">
                <thead class="table-dark SoloTexto2">
                    <tr class="bg-info">
                        <th class="align-middle text-center" colspan="4" scope="col">
                            <P value="<%=cve_periodo%>">Meses <%=nombre_periodo%></P>
                        </th>
                    </tr>
                    <tr class="bg-secondary">
                        <th class="align-middle text-center"value="<%=numero_periodo%>"><%=mes1%></th>
                        <th class="align-middle text-center"value="<%=numero_periodo%>"><%=mes2%></th>
                        <th class="align-middle text-center"value="<%=numero_periodo%>"><%=mes3%></th>
                        <th class="align-middle text-center"value="<%=numero_periodo%>"><%=mes4%></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="align-middle text-center">
                            <input id="mes_1" class="mx-auto" type="checkbox">
                        </td>
                        <td class="align-middle text-center">
                            <input id="mes_2" class="mx-auto" type="checkbox">
                        </td>
                        <td class="align-middle text-center">
                            <input id="mes_3" class="mx-auto" type="checkbox">
                        </td>
                        <td class="align-middle text-center">
                            <input id="mes_4" class="mx-auto" type="checkbox">
                        </td>
                    </tr>
                </tbody>
            </table>
            <br>
            <div class="col-md-12" align="center">
                <img type="" src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guardar meses" onclick="FGuardarMeses(<%=cve_alumno%>,<%=cve_periodo%>,<%=cve_competencia%>);">
                    <br>Guardar meses
            </div>
        </div>
            <br>
        <div class="col-md-6">
            <table class="table table-hover table-sm border border-info" cellpadding="0" cellspacing="0">
                <thead class="table-dark SoloTexto2">
                    <tr class="bg-info">
                        <th class="align-middle text-center" colspan="6" scope="col"><P>PUESTOS DE  APRENDIZAJE</P></th>
                    </tr>
                    <tr class="bg-secondary">
                        <th class="align-middle text-center" scope="col">PUESTO DE APRENDIZAJE (ANOTAR ESECUENCIA)
                        </th>
                        <th class="align-middle text-center" scope="col">OBJETIVOS DE APRENDIZAJE
                        </th>
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
    </div>
</div>
<!--Termina container horarios-------------------------------------------->
<br>
            <div class="row SoloTexto2">
                <div class="col-md-5">&nbsp;</div>
                <div class="col-md-2">
                    Horario
                    <br>
                    <textarea onkeypress="return FCaracteres(event);" class="captura combo200" style="margin-top: 1.32812; margin-bottom: 1.32812; height: 50px;" type="textarea" id="THorario" name="THorario"></textarea>
                    <!--<input type="text" id="" name="" class="captura_obligada combo200" readonly>-->
                </div>
                <div class="col-md-1">
                    <img src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guardar horario" onclick="FGuardarHorario(<%=cve_alumno%>,<%=cve_periodo%>,<%=cve_competencia%>);">
                    <br>Guardar horario
                </div>
                <div class="col-md-5">&nbsp;</div>
            </div>
                    <!--boton de observaciones--------------------------------------------------> 
                    <div class="row SoloTexto2">
                        <div class="col-md-2">&nbsp;</div>      
                        <div class="col-md-12" align="center">
                            <img onclick="abrirObservaciones();" target="popup" src="../../../../../imagenes/ikonoz/editar.png" class="iconsButtons" title="observaciones">
                            <br>Observaciones del alumno
                        </div> 
                        <div class="col-md-2">&nbsp;</div>
                    </div>
                    <br>

                    <table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
                        <tr align="center">
                            <td class="encabezado">Evaluacion para el alumno</td>
                        </tr>
                    </table>

<%/*
consultas="SELECT  dual_dias.L, dual_dias.M, dual_dias.I, dual_dias.J, dual_dias.V, dual_alumnos.horario, dual_alumnos.tel_inst_empresa, "
                         +"dual_alumnos.nom_inst_empresa + '  ' + dual_alumnos.ape_pat_inst_empresa + '  ' + dual_alumnos.ape_mat_inst_empresa AS nombre, dual_alumnos.correo_inst_empresa, dual_alumnos.nom_plan_rotacion, "
                         +"dual_puestos_aprendizaje.nombre_puesto_aprendizaje, dual_puestos_aprendizaje.objetivo_gral, dual_meses.mes_1, dual_meses.mes_2, dual_meses.mes_3, dual_meses.mes_4, dual_semanas.semana_1, "
                         +"dual_semanas.semana_2, dual_semanas.semana_3, dual_semanas.semana_4, dual_semanas.semana_5, dual_semanas.semana_6, dual_semanas.semana_7, dual_semanas.semana_8, dual_semanas.semana_9, "
                        +"dual_semanas.semana_10, dual_semanas.semana_11, dual_semanas.semana_16, dual_semanas.semana_15, dual_semanas.semana_14, dual_semanas.semana_13, dual_semanas.semana_12, "
                         +"dual_semanas.cve_institucion "
            +"FROM dual_dias INNER JOIN "
                         +"dual_alumnos ON dual_dias.cve_alumno = dual_alumnos.cve_alumno INNER JOIN "
                         +"dual_meses ON dual_alumnos.cve_alumno = dual_meses.cve_alumno INNER JOIN "
                         +"dual_puestos_aprendizaje ON dual_alumnos.cve_competencia = dual_puestos_aprendizaje.cve_competencia INNER JOIN "
                         +"dual_semanas ON dual_alumnos.cve_alumno = dual_semanas.cve_alumno "
            +"WHERE (dual_alumnos.cve_alumno = 34401)";
            rs3=SMBD.SQLBD(consultas);
    while(rs.next())
    {

    }
    SMBD.desconectarBD();

*/%>

<!-----------------Tabla Evaluaciones--------------------------------------------------> 
                    
                    <div class="">  
                        <table style="margin:auto;"  class="table table-hover table-sm border border-info" cellpadding="0" cellspacing="0" id="">
                            <thead class="table-dark SoloTexto2">
                                <tr class="bg-info">
                                    <th class="align-middle text-center" colspan="9" scope="col">
                                     Evaluaciones 
                                    </th>
                                    <tr class="bg-secondary">
                                        <th class="align-middle text-center" scope="col">Parcial</th>
                                        <th class="align-middle text-center" scope="col">Fecha de evaluación</th>
                                        <th class="align-middle text-center" scope="col">Ser</th>
                                        <th class="align-middle text-center" scope="col">Saber</th>
                                        <th class="align-middle text-center" scope="col">Saber Hacer</th>
                                        <th class="align-middle text-center" scope="col">Guardar</th>
                                        <th class="align-middle text-center" scope="col">Notificar</th>
                                        <th class="align-middle text-center">Horario de Alumno</th>
                                        <th class="align-middle text-center">Fecha de notificación</th>
                                    </tr>
                                </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="align-middle text-center" scope="">1</td>
                                <td class="align-middle text-center">_/_/_</td>
                                <td class="align-middle text-center">
                                    <select id="SEvaluacionS" class="captura_obligada">
                                        <option value="">SA</option>
                                        <option value="">SE</option>
                                        <option value="">SH</option>
                                    </select>
                                </td>
                                <td class="align-middle text-center">
                                    <select id="SEvaluacionSa" class="captura_obligada">
                                        <option value="">SA</option>
                                        <option value="">SE</option>
                                        <option value="">SH</option>
                                    </select>
                                </td>
                                <td class="align-middle text-center">
                                    <select id="SEvaluacionSh" class="captura_obligada">
                                        <option value="">SA</option>
                                        <option value="">SE</option>
                                        <option value="">SH</option>
                                    </select>
                                </td>
                                <td class="align-middle text-center">
                                    <input class="btn btn-info btn-sm" value="Guardar" title="Guardar" type="button" name="Guardar">
                                </td>
                                <td class="align-middle text-center">
                                    <input class="btn btn-info btn-sm" value="Notificar" title="Notificar" type="button" name="Notificar">
                                </td>
                                <td rowspan="3" class="align-middle text-center">
                                   <input class="btn btn-outline-info btn-sm" value="Horario" title="BHorario" type="button" target="popup" onclick="openVen();" name="Horario"> 
                                </td>
                                <td class="align-middle text-center">_/_/_</td>
                            </tr>
                            <tr>
                                <td class="align-middle text-center" scope="">2</td>
                                <td class="align-middle text-center" >_/_/_</td>
                                <td class="align-middle text-center">
                                    <select id="SEvaluacionS2" class="captura_obligada">
                                        <option value="">NA</option>
                                        <option value="">SA</option>
                                        <option value="">DE</option>
                                        <option value="">AU</option>
                                    </select></td>
                                    <td class="align-middle text-center">
                                        <select id="SEvaluacionSa2" class="captura_obligada">
                                            <option value="">NA</option>
                                            <option value="">SA</option>
                                            <option value="">DE</option>
                                            <option value="">AU</option>
                                        </select></td>
                                        <td class="align-middle text-center">
                                            <select id="SEvaluacionSH2" class="captura_obligada">
                                                <option value="">NA</option>
                                                <option value="">SA</option>
                                                <option value="">DE</option>
                                                <option value="">AU</option>
                                            </select>
                                        </td>
                                        <td class="align-middle text-center">
                                            <input class="btn btn-info btn-sm" value="Guardar" title="Guardar" type="button" name="Guardar">
                                        </td>
                                        <td class="align-middle text-center">
                                            <input class="btn btn-info btn-sm" value="Notificar" title="Notificar" type="button" name="Notificar">
                                        </td>
                                        
                                        <td class="align-middle text-center">_/_/_</td>
                                    </tr>
                                    <tr>
                                        <td class="align-middle text-center" scope="">3</td>
                                        <td class="align-middle text-center" >_/_/_</td>
                                        <td class="align-middle text-center">
                                            <select id="SEvaluacionS3" class="captura_obligada">
                                                <option value="">NA</option>
                                                <option value="">SA</option>
                                                <option value="">DE</option>
                                                <option value="">AU</option>
                                            </select>
                                        </td>
                                        <td class="align-middle text-center">
                                            <select id="SEvaluacionSa3" class="captura_obligada">
                                                <option value="">NA</option>
                                                <option value="">SA</option>
                                                <option value="">DE</option>
                                                <option value="">AU</option>
                                            </select>
                                        </td>
                                        <td class="align-middle text-center">
                                            <select id="SEvaluacionSH3" class="captura_obligada">
                                                <option value="">NA</option>
                                                <option value="">SA</option>
                                                <option value="">DE</option>
                                                <option value="">AU</option>
                                            </select>
                                        </td>
                                        <td class="align-middle text-center">
                                            <input class="btn btn-info btn-sm" value="Guardar" title="Guardar" type="button" name="Guardar">
                                        </td>
                                        <td class="align-middle text-center">
                                            <input class="btn btn-info btn-sm" value="Notificar" title="Notificar" type="button" name="Notificar">
                                        </td>
                                         
                                        </td>
                                        <td class="align-middle text-center">_/_/_</td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                            <!--<div class="col-md-3">&nbsp;</div>-->
                        </div>
                        
                        <!--botones de pie-------------------------------------------------->   
                       
                            <div class="row SoloTexto2 ">
                            <div class="col-md-2">&nbsp;</div>
                            <div class="col-md-3">
                                <img onClick="" src="../../../../../imagenes/ikonoz/nuevo.png" class="iconsButtons" title="Limpiar">
                                <br>Limpiar/Nuevo
                            </div>
                            <div class="col-md-3">
                                <img type="" src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guardar" onClick="">
                                <br>Guardar
                            </div>
                            <div class="col-md-3">
                                <img onClick="window.close();" src="../../../../../imagenes/ikonoz/salir.png" class="iconsButtons" title="Salir">
                                <br>Cerrar
                            </div>
                            <div class="col-md-1">&nbsp;</div>
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
                        <br>
                    </body>
<script type="text/javascript">

    function FCaracteresAlfa(event)
    {
        var key=(event.keyCode||event.which);
        var tecla=String.fromCharCode(key).toString();
        var letras="ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyzáéíóú .";
        
            if (letras.indexOf(tecla)==-1) 
            {
                return false;
            }
        
    }

    function FCaracteresNum(event)
    {
        var key=(event.keyCode||event.which);
        var tecla=String.fromCharCode(key).toString();
        var letras="1234567890";

            if (letras.indexOf(tecla)==-1) 
            {
                return false;
            }
    }

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


    function FMayusculas(letra) 
    {
        letra.value = letra.value.toUpperCase();
    }

    var paginaHorario;
    function openVen()
    {
        paginaHorario=window.open("http://localhost:8080/dual/jsp/prestacion_servicio/academicos/dual/seguimiento/seguimiento_a_dual/paginaHorario.jsp?cve_alumno=<%=cve_alumno%>","paginaHorario","width=800,height=500");
    }
    function closeVen() 
    {
        paginaHorario.close();
    }

    var myWindow;
    function abrirObservaciones() 
    {
        observacionesVentana=window.open("seguimiento_a_dual/observaciones.jsp","observacionesVentana","width=800,height=500");  
    }
    function cerrarObservaciones(){
        observacionesVentana.close();
    }

    function FSalir()
    {
        location.href="./../../../../../menuDual.jsp";
    }

    function FTerminaCarga()
        {
            $('#gif_espera').html('&nbsp;');
        }

    function FCargando()
        {
          $('#gif_espera').html('<img src="../../../../../imagenes/ajax-loader.gif" width="50">');  
        }

    FCargarSemanas();
    function FCargarSemanas()
    {
        var par=
        {
                "p_cve_alumno"                :<%=cve_alumno%>,
                "p_cve_periodo"               :<%=cve_periodo%>,
                "p_cve_competencia"           :<%=cve_competencia%>,
        };
        $.ajax
            ({
                data:par,
                url:"seguimiento_a_dual/cargarHorario.jsp",
                type:"POST",
                dataType:"JSON",
                success:function(res)
                {
                    var S1=res[0];
                    var S2=res[1];
                    
                    for(i=1;i<=16;i++)
                    {
                        if(S1["s"+i]==1)
                        {
                            $('#sem_UT'+i)[0].checked=true
                        }
                        else
                        {
                            $('#sem_UT'+i)[0].checked=false
                        }

                        if(S2["s"+i]==1)
                        {
                            $('#sem_'+i)[0].checked=true
                        }
                        else
                        {
                            $('#sem_'+i)[0].checked=false
                        }
                    }
                    //alert("Respuesta?");
                    //data = JSON.parse(res);
                    //console.log(res);
                    //alert(res.error);
                    //FTerminaCarga();
                }
            });
    }

    function FGuardarDias(cve_alumno,cve_periodo,cve_competencia)
    {

        FCargando();
        var par=
        {
                "p_cve_alumno"                :cve_alumno,
                "p_cve_periodo"               :cve_periodo,
                "p_cve_competencia"           :cve_competencia,
                "p_dia_l"                     :$('#dia_l')[0].checked ? 1 : 0,
                "p_dia_m"                     :$('#dia_m')[0].checked ? 1 : 0,
                "p_dia_i"                     :$('#dia_i')[0].checked ? 1 : 0,
                "p_dia_j"                     :$('#dia_j')[0].checked ? 1 : 0,
                "p_dia_v"                     :$('#dia_v')[0].checked ? 1 : 0,
                "action"                      :4
        };
        console.log(JSON.stringify(par));
        alert("seguimiento_a_dual/guardarHorario.jsp?p_cve_alumno="+par.p_cve_alumno+"&p_cve_periodo="+par.p_cve_periodo+"&p_cve_competencia="+par.p_cve_competencia+"&p_dia_l="+par.p_dia_l+"&p_dia_m="+par.p_dia_m+"&p_dia_i="+par.p_dia_i+"&p_dia_j="+par.p_dia_j+"&p_dia_v="+par.p_dia_v);
        $.ajax
            ({
                data:par,
                url:"seguimiento_a_dual/guardarHorario.jsp",
                type:"POST",
                dataType:"JSON",
                success:function(res)
                {
                    //console.log(res);
                    alert(res.error);
                    FTerminaCarga();
                }

            });        
    }
    
    function FGuardarSemanas(cve_institucion,num_sem)
    {
        //alert("valor de inst. "+cve_institucion);
        var valida=0;
        var valor=0;

            if(cve_institucion==1)
            {
                if($('#sem_UT'+num_sem).prop('checked')==true)
                {
                    valor=1;
                }
            }
            else
            {
                if($('#sem_'+num_sem).prop('checked')==true)
                {
                    valor=1;
                }
            }

            FCargando();
            var par=
            {
                "p_cve_alumno"                :<%=cve_alumno%>,
                "p_cve_periodo"               :<%=cve_periodo%>,
                "p_cve_competencia"           :<%=cve_competencia%>,
                "p_cve_institucion"           :cve_institucion,
                "p_num_sem"                   :num_sem,
                "p_valor"                     :valor,
                "action" :3
            };
            //console.log(JSON.stringify(par));
            //alert("seguimiento_a_dual/guardarHorario.jsp?p_cve_alumno="+par.p_cve_alumno+"&p_cve_periodo="+par.p_cve_periodo+"&p_cve_competencia="+par.p_cve_competencia+"&p_valor="+valor+"&p_num_sem="+num_sem+"&p_cve_institucion="+cve_institucion);
            $.ajax
            ({
                data:par,
                url:"seguimiento_a_dual/guardarHorario.jsp",
                type:"POST",
                dataType:"JSON",
                success:function(res)
                {
                    //alert("Respuesta?");
                    //data = JSON.parse(res);
                    console.log(res);
                    alert(res.error);
                    FTerminaCarga();
                }
            });
    }

    function FGuardarHorario(cve_alumno,cve_periodo,cve_competencia)
    {
        var valida=0;
        if($('#THorario').val()==""||$('#THorario').val()==null)
        {
            alert('Intruduzca el horario.');valida++;
            $('#THorario').focus();
        }
        if (valida==0) 
        {
            FCargando();
            var par=
            {
                "p_THorario"              :$('#THorario').val(),
                "p_cve_alumno"            :cve_alumno,
                "p_cve_periodo"           :cve_periodo,
                "p_cve_competencia"       :cve_competencia,
                "action" : 1
            };

            $.ajax
            ({
                data:par,
                url:"seguimiento_a_dual/guardarHorario.jsp",
                type:"POST",
                dataType:"JSON",
                success:function(res)
                {
                    //alert("Respuesta?");
                    //data = JSON.parse(res);
                    console.log(res);
                    alert(res.error);
                    FTerminaCarga();
                }
            });
        }
    }

    function FGuardarMeses(cve_alumno,cve_periodo,cve_competencia)
    {
        var valida=0;
        //alert($('#mes_3').val()+" "+valida);
        //alert($('#mes_4').val()+" "+valida); 
        {
            FCargando();
            var par=
            {
                "p_mes_1"                 :$('#mes_1')[0].checked ? 1 : 0,
                "p_mes_2"                 :$('#mes_2')[0].checked ? 1 : 0,
                "p_mes_3"                 :$('#mes_3')[0].checked ? 1 : 0,
                "p_mes_4"                 :$('#mes_4')[0].checked ? 1 : 0,  
                "p_cve_alumno"            :cve_alumno,
                "p_cve_periodo"           :cve_periodo,
                "p_cve_competencia"       :cve_competencia,
                "action" : 2
            };

            //console.log(par);

            $.ajax
            ({
                data:par,
                url:"seguimiento_a_dual/guardarHorario.jsp",
                type:"POST",
                dataType:"JSON",
                success:function(res)
                {
                    //alert("Respuesta?");
                    //data = JSON.parse(res);
                    console.log(res);
                    alert(res.error);
                    FTerminaCarga();
                }
            });
        }
    }


    function FGuardarDatosInst(cve_alumno,cve_periodo,cve_competencia)
    {
        var valida=0;
        //alert($('#SEmpresa_'+cve_alumno).val()+" "+valida);
        if($('#SEmpresa')[0].selectedIndex < 1)
        {
             alert('Seleccione una empresa primero.');valida++;
            $('#SEmpresa_'+cve_alumno).focus();
        }
        else
        {
            //alert($('#TNomRotacion').val()+" "+valida);
           if ($('#TNomRotacion').val()==""||$('#TNomRotacion').val()==null)
           {
                alert('Introduzca el nombre del plan de rotacion.');
                valida++;
                $('#TNomRotacion').focus();
           }
           else
           {
                if($('#TNomInst').val()==""||$('#TNomInst').val()==null)
                {
                    alert('Introduzca el nombre del instructor.');
                    valida++;
                    $('#TNomInst').focus();
                }
                else
                {
                    if ($('#TPatInst').val()==""||$('#TPatInst').val()==null)
                    {
                        alert('Introduzca el apellido paterno.');
                        valida++;
                        $('#TPatInst').focus();
                    }
                    else
                    {
                        if ($('#TMatInst').val()==""||$('#TMatInst').val()==null) 
                        {
                            alert('Introduzca el apellido materno');
                            valida++;
                            $('#TMatInst').focus();
                        }
                        else
                        {
                            if ($('#TNumeroInst').val()==""||$('#TNumeroInst').val()==null)
                            {
                                alert('Introduzca el teléfono del instructor');
                                valida++;
                                $('#TNumeroInst').focus(); 
                            }
                            else
                            {
                                if ($('#TCorreoInst').val()==""||$('#TCorreoInst').val()==null) 
                                {
                                    alert('Introduzca la dirección de correo electrónico del instructor');
                                    valida++;
                                    $('#TCorreoInst'
                                    ).focus();
                                }
                            } 
                        }
                    }    
                }
           }
        }
        //alert($('#SEmpresa'+cve_alumno).val()+" "+valida);
        if (valida==0) 
        {
            FCargando();
            //alert("ok: #SEmpresa_"+cve_alumno.toString());
            //alert("ok 2: "+$('#SEmpresa_'+cve_alumno.toString()).val());
            var par=
            {
                "p_SEmpresa"              :$('#SEmpresa').val(),
                "p_TNomRotacion"          :$('#TNomRotacion').val(),
                "p_TNomInst"              :$('#TNomInst').val(),
                "p_TPatInst"              :$('#TPatInst').val(),
                "p_TMatInst"              :$('#TPatInst').val(),
                "p_TNumeroInst"           :$('#TNumeroInst').val(),
                "p_TCorreoInst"           :$('#TCorreoInst').val(),
                "p_cve_alumno"            :cve_alumno,
                "p_cve_periodo"           :cve_periodo,
                "p_cve_competencia"       :cve_competencia

            };
            console.log(JSON.stringify(par));
            /*alert("seguimiento_a_dual/guardarDatos.jsp?p_SEmpresa_="+par.p_SEmpresa+""
                                                        &p_TNomRotacion="+par.p_TNomRotacion+"
                                                        &p_TNomInst="+par.p_TNomInst+"
                                                        &p_TPatInst="+par.p_TPatInst+"
                                                        &p_TMatInst="+par.p_TMatInst+"
                                                        &p_TNumeroInst"+par.p_TNumeroInst+"
                                                        &p_TCorreoInst"+par.p_TCorreoInst+"
                                                        &p_cve_alumno"+par.p_cve_alumno+"
                                                        &p_cve_periodo"par.p_cve_periodo+"
                                                        &p_cve_competencia"+par.p_cve_competencia);*/
            $.ajax({
                data:par,
                url:"seguimiento_a_dual/guardarDatos.jsp",
                type:"POST",
                dataType:"JSON",
                success:function(res)
                {
                    //alert("Respuesta?");
                    //data = JSON.parse(res);
                    console.log(res);
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