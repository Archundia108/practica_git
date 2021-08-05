<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*, comun.*" errorPage="../../../../../error.jsp" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%
if (session.getAttribute("usuario") != null)
{
    BD SMBD = new BD();
    ResultSet rs;
    String usuario = String.valueOf(session.getAttribute("usuario"));
    int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("cve_usuario")));
    
    String consultas = "", error = "", nombre_puesto_aprendizaje = "";
    int cve_puesto_aprendizaje = 0;
%>

    <!DOCTYPE html>
    <html>
        <head>
            <title>Registro de puestos</title>
            <link rel="stylesheet" href="../../../../../estilos/sic.css">
            <link rel="stylesheet" href="../../../../../estilos/bootstrap4.2.1.min.css"> 
            <script type="text/javascript" src="../../../../../js/jquery-2.2.4.min.js"></script>
            <script type="text/javascript" src="../../../../../js/bootstrap4.1.3.min.js"></script>
        </head>
        <body>
            <div class="row">
                <div class="col-md-12">
                    <table width="80%" cellpadding="0" cellspacing="0" border="0" align="center">
                        <tr align="center">
                            <td><img src="../../../../../imagenes/banner.jpg" width="751" height="80"></td>
                        </tr>
                        <tr align="center">
                            <td class="titulo">PROYECTO DUAL</td>
                        </tr>
                        <tr align="center">
                            <td class="usuario"><%=usuario%></td>
                        </tr>
                        <tr align="center">
                            <td class="encabezado">Registro de puestos</td>
                        </tr>
                    </table>
                </div>
            </div>
            
            <br>
            <div class="row SoloTexto2">
                <div class="col-md-1">&nbsp;</div>
                <div class="col-md-1">
                    Folio
                    <br>
                    <input type="text" name="TCvePuesto" id="TCvePuesto" class="captura combo100" value="0" readonly>
                </div>
                <div class="col-md-1">
                    Año
                    <br>
                    <input type="text" name="TAnio" id="TAnio" class="captura combo100" readonly>
                </div>
                <div class="col-md-2" id="divCvePuestoAprendizaje">
                    <a href="javascript:FVentanaPuestosAprendizaje()">Puestos de aprendizaje</a>
                    <br>
                    <select name="SCvePuestoAprendizaje" id="SCvePuestoAprendizaje" class="captura combo200">
                        <option value="-1">...selecciona...</option>
                        <%
                            consultas = "SELECT p.nombre_puesto_aprendizaje, p.cve_puesto_aprendizaje "
                                      + "FROM dual_puestos_aprendizaje p "
                                      + "INNER JOIN carreras_universidad c ON c.cve_carrera = p.cve_carrera "
                                      + "WHERE c.cve_director = "+cve_usuario+"";
                            rs = SMBD.SQLBD(consultas);
                            while (rs.next()) 
                            {
                                nombre_puesto_aprendizaje = rs.getString(1);
                                cve_puesto_aprendizaje = rs.getInt(2);
                                %>
                                    <option value="<%=cve_puesto_aprendizaje%>"><%=nombre_puesto_aprendizaje%></option>
                                <%
                            }
                            SMBD.desconectarBD();
                        %>
                    </select>
                </div>
                <div class="col-md-2">
                    Nombre del puesto
                    <br>
                    <input type="text" name="TNomPuesto" id="TNomPuesto" class="captura_obligada combo200" onkeypress="return FCaracteres(event)">
                </div>
                <div class="col-md-2">
                    Objetivo general de aprendizaje
                    <br>
                    <textarea name="TObjetivoGral" id="TObjetivoGral" cols="30" rows="5" class="captura_obligada combo200" onkeypress="return FCaracteres(event)"></textarea>
                </div>
                <div class="col-md-2">
                    Requerimientos generales
                    <br>
                    <textarea name="TRequerimientosGral" id="TRequerimientosGral" cols="30" rows="5" class="captura_obligada combo200" onkeypress="return FCaracteres(event)"></textarea>
                </div>
                <div class="col-md-1">&nbsp;</div>
            </div>

            <br>
            <div class="row">
                <div class="col-md-12">
                    <table width="80%" cellpadding="0" cellspacing="0" border="0" align="center">
                        <tr align="center">
                            <td class="encabezado">Conocimientos previos necesarios para el puesto de aprendizaje</td>
                        </tr>
                    </table>
                </div>
            </div>

            <br>
            <div class="row SoloTexto2">
                <div class="col-md-2">&nbsp;</div>
                <div class="col-md-2">
                    Teóricos
                    <br>
                    <textarea name="TTeoricos" id="TTeoricos" cols="30" rows="5" class="captura_obligada combo200" onkeypress="return FCaracteres(event)"></textarea>
                </div>
                <div class="col-md-2">
                    Procedimentales
                    <br>
                    <textarea name="TProcedimentales" id="TProcedimentales" cols="30" rows="5" class="captura_obligada combo200" onkeypress="return FCaracteres(event)"></textarea>
                </div>
                <div class="col-md-2">
                    Actitudinales
                    <br>
                    <textarea name="TActitudinales" id="TActitudinales" cols="30" rows="5" class="captura_obligada combo200" onkeypress="return FCaracteres(event)"></textarea>
                </div>
                <div class="col-md-2">
                    Actividades a desarrollar
                    <br>
                    <textarea name="TActvdDesarrollo" id="TActvdDesarrollo" cols="30" rows="5" class="captura_obligada combo200" onkeypress="return FCaracteres(event)"></textarea>
                </div>
                <div class="col-md-2">&nbsp;</div>
            </div>

            <br>
            <div class="row SoloTexto2">
                <div class="col-md-2">&nbsp;</div>
                <div class="col-md-2">
                    Vigente
                    <br>
                    <select name="SVigente" id="SVigente" class="captura combo50">
                        <option value="-1">...seleccionar...</option>
                        <option value="1">Si</option>
                        <option value="0">No</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <img src="../../../../../imagenes/ikonoz/empresas.png" class="iconsButtons" title="Empresas" onclick="FVentanaEmpresas()">
                    <br>
                    Empresas
                </div>
                <div class="col-md-2">
                    <img src="../../../../../imagenes/ikonoz/avances.png" class="iconsButtons" title="Objetivos" onclick="FVentanaObjetivos()">
                    <br>
                    Objetivos de aprendizaje
                </div>
                <div class="col-md-2">
                    <img src="../../../../../imagenes/ikonoz/historico.png" class="iconsButtons" title="Matriz">
                    <br>
                    Adjuntar matriz
                </div>
                <div class="col-md-2">&nbsp;</div>
            </div>

            <br>
            <div class="row SoloTexto2">
                <div class="col-md-2" id="gif_espera">&nbsp;</div>
                <div class="col-md-2">
                    <img src="../../../../../imagenes/ikonoz/nuevo.png" class="iconsButtons" title="Limpiar" onclick="FLimpiar()">
                    <br>
                    Limpiar/Nuevo
                </div>
                <div class="col-md-2">
                    <img src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guardar" onclick="FRegistra_puestos()">
                    <br>
                    Guardar/Modificar
                </div>
                <div class="col-md-2">
                    <img src="../../../../../imagenes/ikonoz/editar.png" class="iconsButtons" title="Duplicar" onclick="FDuplicar_puestos()">
                    <br>
                    Duplicar puesto
                </div>
                <div class="col-md-2">
                    <img src="../../../../../imagenes/ikonoz/inicio.png" class="iconsButtons" title="Salir" onclick="FSalir()">
                    <br>
                    Salir
                </div>
                <div class="col-md-2">&nbsp;</div>
            </div>

            <br>
            <div class="row SoloTexto2">
                <div class="col-md-1">&nbsp;</div>
                <div class="col-md-10">
                    <table class="table table-hover table-sm border border-info SoloTexto2" cellpading="0" cellspacing="0" id="TblPuestos">
                        <thead class="table-dark SoloTexto2">
                            <tr class="bg-info">
                                <th class="aling-middle text-center" colspan="7" scope="col">Puestos registrados</th>
                            </tr>
                            <tr class="bg-secondary">
                                <th class="aling-middle text-center" scope="col">Folio</th>
                                <th class="aling-middle text-center" scope="col">Nombre de puesto</th>
                                <th class="aling-middle text-center" scope="col">Puesto de aprendizaje</th>
                                <th class="aling-middle text-center" scope="col">Objetivo general</th>
                                <th class="aling-middle text-center" scope="col">Requerimientos generales</th>
                                <th class="aling-middle text-center" scope="col">Fecha de registro</th>
                                <th class="aling-middle text-center" scope="col">Vigente</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th class="aling-middle text-center" scope="col">--</th>
                                <td class="aling-middle text-center">--</td>
                                <td class="aling-middle text-center">--</td>
                                <td class="aling-middle text-center">--</td>
                                <td class="aling-middle text-center">--</td>
                                <td class="aling-middle text-center">--</td>
                                <td class="aling-middle text-center">--</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-1">&nbsp;</div>
            </div>

            <br>
            <div class="row SoloTexto2">    
                <div class="col-md-12">
                    Universidad Tecnológica de San Juan del Río <br>
                    Departamento de Tecnologías de la Información <br>
                    <a href="mailto:ncruzs@utsjr.edu.mx" class="liga" title="Neftali Cruz Soriano">
                        Coordinador de sistemas
                    </a>
                </div>
            </div>
        </body>
        <script type="text/JavaScript" language="JavaScript">
            function FSalir() 
            {
                location.href = "../../../../../menuDual.jsp";
            }

            function FCargando() {
                $('#gif_espera').html('<img src="../../../../../imagenes/ajax-loader.gif" width="50">')
            }

            function FTerminado() {
                $('#gif_espera').html('&nbsp;')
            }

            function FVentanaPuestosAprendizaje()
            {
                var w = screen.width;
                var h = screen.height;
                var left = w / 8;
                var top =  h / 8;
                w = (w / 8) * 6;
                h = (h / 8) * 5;
                
                var URL = "dual_puestos_aprendizaje.jsp";
                
                window.open(URL,'titulo_ventana','width='+w+',height='+h+',menubar=no,scrollbars=yes,toolbar=no,locatio n=no,directories=no,resizable=no,top='+top+',left='+left);
            }

            function FVentanaEmpresas()
            {
                if ($('#TCvePuesto').val() == 0) 
                {
                    alert("Selecciona un puesto de aprendizaje o registralo");
                }
                else
                {
                    var w = screen.width;
                    var h = screen.height;
                    var left = w / 8;
                    var top =  h / 8;
                    w = (w / 8) * 6;
                    h = (h / 8) * 5;
                    
                    var URL = "dual_puestos_empresas.jsp?cve_puesto_aprendizaje="+$('#SCvePuestoAprendizaje').val();
                    
                    window.open(URL,'titulo_ventana','width='+w+',height='+h+',menubar=no,scrollbars=yes,toolbar=no,locatio n=no,directories=no,resizable=no,top='+top+',left='+left);
                }
            }

            function FVentanaObjetivos()
            {
                if ($('#TCvePuesto').val() == 0) 
                {
                    alert("Selecciona un puesto de aprendizaje o registralo");
                }
                else
                {
                    var w = screen.width;
                    var h = screen.height;
                    var left = w / 8;
                    var top =  h / 8;
                    w = (w / 8) * 6;
                    h = (h / 8) * 5;
                    
                    var URL = "dual_obj_result.jsp?nombre_dual_puesto="+$('#TNomPuesto').val()+"&cve_dual_puesto="+$('#TCvePuesto').val()+"&anio="+$('#TAnio').val();
                    
                    window.open(URL,'titulo_ventana','width='+w+',height='+h+',menubar=no,scrollbars=yes,toolbar=no,locatio n=no,directories=no,resizable=no,top='+top+',left='+left);
                }
            }

            function FCaracteres(event) 
            {
                var key = (event.keyCode || event.which);                
                var tecla = String.fromCharCode(key).toString();
                var letras = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyzáéíóú1234567890 ,.";

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

            function FTabla_puestos()
            {
                FCargando();
                var par =
                {
                    "p_cve_usuario" : <%=cve_usuario%>
                }
                $.post
                (
                    "dual_puestos/tabla_puestos.jsp", par,
                    function(htmlExterno) 
                    {
                        $('#TblPuestos').html(htmlExterno);
                        FTerminado();
                    }
                )
            }
            FTabla_puestos()

            function FAnioActual() 
            {
                var today = new Date();
                var anio = today.getFullYear();
                $('#TAnio').val(anio);
            }
            FAnioActual();

            function FRegistra_puestos() 
            {
                var valida = 0;
                if ($('#SCvePuestoAprendizaje').val() == -1 || $('#SCvePuestoAprendizaje').val() == null) 
                {
                    alert("Favor de seleccionar el puesto de aprendizaje");
                    valida++;
                    $('#SCvePuestoAprendizaje').focus();
                }
                else
                {
                    if ($('#TNomPuesto').val() == "" || $('#TNomPuesto').val() == null) 
                    {
                        alert("Favor de ingresar el nombre");
                        valida++;
                        $('#TNomPuesto').focus();
                    }
                    else
                    {
                        if ($('#TObjetivoGral').val() == "" || $('#TObjetivoGral').val() == null) 
                        {
                            alert("Favor de ingresar los objetivos generales");
                            valida++;
                            $('#TObjetivoGral').focus();
                        }
                        else
                        {
                            if ($('#TRequerimientosGral').val() == "" || $('#TRequerimientosGral').val() == null) 
                            {
                                alert("Favor de ingresar los reguerimientos generales");
                                valida++;
                                $('#TRequerimientosGral').focus();
                            }
                            else
                            {
                                if ($('#TTeoricos').val() == "" || $('#TTeoricos').val() == null) 
                                {
                                    alert("Favor de ingresar los conocimientos teoricos");
                                    valida++;
                                    $('#TTeoricos').focus();
                                }
                                else
                                {
                                    if ($('#TProcedimentales').val() == "" || $('#TProcedimentales').val() == null) 
                                    {
                                        alert("Favor de ingresar los conocimientos procedimentales");
                                        valida++;
                                        $('#TProcedimentales').focus();
                                    }
                                    else
                                    {
                                        if ($('#TActitudinales').val() == "" || $('#TActitudinales').val() == null) 
                                        {
                                            alert("Favor de ingresar los conocimientos actitudinales");
                                            valida++;
                                            $('#TActitudinales').focus();
                                        }
                                        else
                                        {
                                            if ($('#TActvdDesarrollo').val() == "" || $('#TActvdDesarrollo').val() == null) 
                                            {
                                                alert("Favor de ingresar las actividades a desarrollar");
                                                valida++;
                                                $('#TActvdDesarrollo').focus();
                                            }
                                            else
                                            {
                                                if ($('#SVigente').val() == -1 || $('#SVigente').val() == null) 
                                                {
                                                    alert("Favor de seleccionar la vigencia");
                                                    valida++;
                                                    $('#SVigente').focus();
                                                }
                                                else
                                                {
                                                    if ($('#TCvePuesto').val() != 0) 
                                                    {
                                                        FActualizar_puestos();
                                                        valida++;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (valida == 0) 
                {
                    FCargando();
                    var par =
                    {
                        "p_cve_dual_puesto"     : $('#TCvePuesto').val(),
                        "p_NomPuesto"           : $('#TNomPuesto').val(),
                        "p_ObjetivoGral"        : $('#TObjetivoGral').val(),
                        "p_RequerimientosGral"  : $('#TRequerimientosGral').val(),
                        "p_Teoricos"            : $('#TTeoricos').val(),
                        "p_Procedimentales"     : $('#TProcedimentales').val(),
                        "p_Actitudinales"       : $('#TActitudinales').val(),
                        "p_ActvdDesarrollo"     : $('#TActvdDesarrollo').val(),
                        "p_Vigente"             : $('#SVigente').val(),
                        "p_CvePuestoAprendizaje": $('#SCvePuestoAprendizaje').val(),
                        "p_cve_usuario"         : <%=cve_usuario%>
                    }
                    $.ajax
                    (
                        {
                            data      : par,
                            url       : "dual_puestos/registrar_puesto.jsp",
                            type      : "POST",
                            dataType  : "JSON",
                            success   : function (res) 
                                        {
                                            alert(res.error);
                                            FTerminado();
                                            $('#TCvePuesto').val(res.cve_dual_puesto);
                                            FTabla_puestos();
                                        }
                        }
                    )
                }
            }

            function FLimpiar() 
            {
                var today = new Date();
                var anio = today.getFullYear();
                $('#TCvePuesto').val(0);
                $('#TAnio').val(anio);
                $('#SCvePuestoAprendizaje').val(-1);
                $('#TNomPuesto').val("");
                $('#TObjetivoGral').val("");
                $('#TRequerimientosGral').val("");
                $('#TTeoricos').val("");
                $('#TProcedimentales').val("");
                $('#TActitudinales').val("");
                $('#TActvdDesarrollo').val("");
                $('#SVigente').val(-1);
            }

            function FBusca(cve_dual_puesto) 
            {
                FCargando();
                var par = 
                {
                    "p_TCvePuesto" : cve_dual_puesto
                }
                $.ajax
                (
                    {
                        data        : par,
                        url         : "dual_puestos/buscar_puesto.jsp",
                        type        : "POST",
                        dataType    : "JSON",
                        success     : function (res)
                                    {
                                        $('#TCvePuesto').val(res.cve_dual_puesto);
                                        $('#TAnio').val(res.anio);
                                        $('#SCvePuestoAprendizaje').val(res.cve_puesto_aprendizaje);
                                        $('#TNomPuesto').val(res.nombre_dual_puesto);
                                        $('#TObjetivoGral').val(res.objetivo_gral);
                                        $('#TRequerimientosGral').val(res.requerimientos_gral);
                                        $('#TTeoricos').val(res.con_teoricos);
                                        $('#TProcedimentales').val(res.con_procedimentales);
                                        $('#TActitudinales').val(res.con_actitudinales);
                                        $('#TActvdDesarrollo').val(res.actvd_desarrollo);
                                        $('#SVigente').val(res.vigente);
                                        FTerminado();
                                    }
                    }
                )
            }

            function FActualizar_puestos() 
            {
                FCargando();
                var par = 
                {
                    "p_cve_dual_puesto"     : $('#TCvePuesto').val(),
                    "p_NomPuesto"           : $('#TNomPuesto').val(),
                    "p_ObjetivoGral"        : $('#TObjetivoGral').val(),
                    "p_RequerimientosGral"  : $('#TRequerimientosGral').val(),
                    "p_Teoricos"            : $('#TTeoricos').val(),
                    "p_Procedimentales"     : $('#TProcedimentales').val(),
                    "p_Actitudinales"       : $('#TActitudinales').val(),
                    "p_ActvdDesarrollo"     : $('#TActvdDesarrollo').val(),
                    "p_Vigente"             : $('#SVigente').val(),
                    "p_CvePuestoAprendizaje": $('#SCvePuestoAprendizaje').val(),
                    "p_cve_usuario"         : <%=cve_usuario%>
                }
                $.ajax
                (
                    {
                        data        : par,
                        url         : "dual_puestos/actualizar_puesto.jsp",
                        type        : "POST",
                        dataType    : "JSON",
                        success     : function (res)
                                    {
                                        alert(res.error);
                                        FTabla_puestos()
                                        FTerminado();
                                    }
                    }
                );
            }

            function FDuplicar_puestos() 
            {
                if ($('#TCvePuesto').val() == 0) 
                {
                    alert("Selecciona un puesto de aprendizaje o registralo");
                }
                else
                {
                    FCargando();
                    var par = 
                    {
                        "p_cve_dual_puesto" : $('#TCvePuesto').val()
                    }
                    $.ajax
                    (
                        {
                            data      : par,
                            url       : "dual_puestos/duplicar_puesto.jsp",
                            type      : "POST",
                            dataType  : "JSON",
                            success   : function (res) 
                                        {
                                            alert(res.error);
                                            FTerminado();
                                            $('#TCvePuesto').val(res.cve_dual_puesto);
                                            FTabla_puestos();
                                        }
                        }
                    )
                }
            }

            function FActualizar_select_puestos() 
            {
                FCargando();
                var par =
                {
                    "p_cve_usuario" : <%=cve_usuario%>
                }
                $.post
                (
                    "dual_puestos/actualizar_select_puestos.jsp", par,
                    function(htmlExterno) 
                    {
                        $('#divCvePuestoAprendizaje').html(htmlExterno);
                        FTerminado();
                    }
                )
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