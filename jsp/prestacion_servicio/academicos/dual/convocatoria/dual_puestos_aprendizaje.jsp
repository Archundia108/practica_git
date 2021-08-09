<%@
    page language="java"
    import="java.sql.*, java.lang.*, java.util.*, comun.*"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="../../../../../error.jsp"
%>

<%
    if (session.getAttribute("usuario") != null)
    {
        BD SMBD = new BD();
        ResultSet rs;

        String usuario = String.valueOf(session.getAttribute("usuario"));
        int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("cve_usuario")));
        
        String consultas = "", error = "", nombre_competencia = "";
        int cve_competencia = 0;

        %>
            <html>
                <head>
                    <title>Registro de puestos de aprendizaje</title>                    
                    <link rel="stylesheet" href="../../../../../estilos/sic.css">
                    <link rel="stylesheet" href="../../../../../estilos/bootstrap4.2.1.min.css"> 
                    <script type="text/javascript" src="../../../../../js/jquery-2.2.4.min.js"></script>
                    <script type="text/javascript" src="../../../../../js/bootstrap4.1.3.min.js"></script>
                </head>
                
                <body>
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
                            <td class="encabezado">Registro de puestos de aprendizaje</td>
                        </tr>
                    </table> 
                    
                    <br>
                    <div class="row SoloTexto2">
                        <div class="col-md-1">&nbsp;</div>
                        <div class="col-md-1">
                            Folio
                            <br>
                            <input type="text" name="TCvePuestoAprendizaje" id="TCvePuestoAprendizaje" class="captura combo100" value="0" readonly>
                        </div>
                        <div class="col-md-1">
                            Año
                            <br>
                            <input type="text" name="TAnio" id="TAnio" class="captura combo100" readonly>
                        </div>
                        <div class="col-md-2" id="divCompetencias">
                            <a href="javascript:FVentana_competencias()">Competencias</a>
                            <br>
                            <select name="SCveCompetencia" id="SCveCompetencia" class="captura combo200">
                                <option value="-1">...selecciona...</option>
                                <%
                                    consultas = "SELECT p.nombre_competencia, p.cve_competencia "
                                              + "FROM dual_competencias p "
                                              + "INNER JOIN carreras_universidad c ON c.cve_carrera = p.cve_carrera "
                                              + "WHERE c.cve_director = "+cve_usuario+"";
                                    rs = SMBD.SQLBD(consultas);
                                    while (rs.next()) 
                                    {
                                        nombre_competencia = rs.getString(1);
                                        cve_competencia = rs.getInt(2);
                                        %>
                                            <option value="<%=cve_competencia%>"><%=nombre_competencia%></option>
                                        <%
                                    }
                                    SMBD.desconectarBD();
                                %>
                            </select>
                        </div>
                        <div class="col-md-2">
                            Nombre del puesto de aprendizaje
                            <br>
                            <input type="text" name="TNomPuestoAprendizaje" id="TNomPuestoAprendizaje" class="captura_obligada combo200" onkeypress="return FCaracteres(event)">
                        </div>
                        <div class="col-md-2">
                            Objetivo general
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
                    <table width="80%" cellpadding="0" cellspacing="0" border="0" align="center">
                        <tr align="center">
                            <td class="encabezado">Conocimientos previos necesarios para el puesto de aprendizaje</td>
                        </tr>
                    </table>
                        

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
                            <img src="../../../../../imagenes/ikonoz/empresas.png" class="iconsButtons" title="Empresas" onclick="FVentana_empresas()">
                            <br>
                            Empresas
                        </div>
                        <div class="col-md-2">
                            <img src="../../../../../imagenes/ikonoz/avances.png" class="iconsButtons" title="Objetivos" onclick="FVentana_objetivos_aprendizaje()">
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
                            <img src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guardar" onclick="FRegistrar_puestos_aprendizaje()">
                            <br>
                            Guardar/Modificar
                        </div>
                        <div class="col-md-2">
                            <img src="../../../../../imagenes/ikonoz/editar.png" class="iconsButtons" title="Duplicar" onclick="FDuplicar_puestos_aprendizaje()">
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
                    <div class="row">
                        <div class="col-md-1">&nbsp;</div>
                        <div class="col-md-10">
                            <table class="table table-hover table-sm border border-info SoloTexto2" cellpading="0" cellspacing="0" id="TblPuestosAprendizaje">
                                <!--Tabla-->
                            </table>
                        </div>
                        <div class="col-md-1">&nbsp;</div>
                    </div>

                    <br>
                    <div class="row SoloTexto2">    
                        <div class="col-md-12">
                            Universidad Tecnológica de San Juan del Río <br>
                            Departamento de Tecnologías de la Información <br>
                            <a href="mailto:ncruzs@utsjr.edu.mx" class="liga" title="Edgar Gabriel Arteaga Archundia">
                                Desarrollo-Estadias
                            </a>
                        </div>
                    </div>
                </body>

                <script type="text/JavaScript" language="JavaScript">
                    function FSalir() 
                    {
                        location.href = "../../../../../menuDual.jsp";
                    }

                    function FCargando() 
                    {
                        $('#gif_espera').html('<img src="../../../../../imagenes/ajax-loader.gif" width="50">');
                    }

                    function FTerminado() 
                    {
                        $('#gif_espera').html('&nbsp;');
                    }

                    function FVentana_competencias()
                    {
                        var w = screen.width;
                        var h = screen.height;
                        var left = w / 8;
                        var top =  h / 8;
                        w = (w / 8) * 6;
                        h = (h / 8) * 5;
                        
                        var URL = "dual_competencias.jsp";
                        
                        window.open(URL,'titulo_ventana','width='+w+',height='+h+',menubar=no,scrollbars=yes,toolbar=no,locatio n=no,directories=no,resizable=no,top='+top+',left='+left);
                    }

                    function FVentana_empresas()
                    {
                        if ($('#TCvePuestoAprendizaje').val() == 0) 
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
                            
                            var URL = "dual_empresas.jsp?cve_competencia="+$('#SCveCompetencia').val();
                            
                            window.open(URL,'titulo_ventana','width='+w+',height='+h+',menubar=no,scrollbars=yes,toolbar=no,locatio n=no,directories=no,resizable=no,top='+top+',left='+left);
                        }
                    }

                    function FVentana_objetivos_aprendizaje()
                    {
                        if ($('#TCvePuestoAprendizaje').val() == 0) 
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
                            
                            var URL = "dual_objetivos_aprendizaje.jsp?nombre_puesto_aprendizaje="+$('#TNomPuestoAprendizaje').val()+"&cve_puesto_aprendizaje="+$('#TCvePuestoAprendizaje').val()+"&anio="+$('#TAnio').val();
                            
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

                    function FTabla_puestos_aprendizaje()
                    {
                        FCargando();
                        var par = 
                        {
                            "p_cve_usuario" : <%=cve_usuario%>
                        }

                        $.post
                        (
                            "dual_puestos_aprendizaje/tabla_puestos_aprendizaje.jsp", par,
                            function(htmlExterno) 
                            {
                                $('#TblPuestosAprendizaje').html(htmlExterno);
                                FTerminado();
                            }
                        );
                    }
                    FTabla_puestos_aprendizaje();

                    function FAnioActual() 
                    {
                        var today = new Date();
                        var anio = today.getFullYear();
                        $('#TAnio').val(anio);
                    }
                    FAnioActual();

                    function FRegistrar_puestos_aprendizaje() 
                    {
                        var valida = 0;
                        if ($('#SCveCompetencia').val() == -1 || $('#SCveCompetencia').val() == null) 
                        {
                            alert("Favor de seleccionar el puesto de aprendizaje");
                            valida++;
                            $('#SCveCompetencia').focus();
                        }
                        else
                        {
                            if ($('#TNomPuestoAprendizaje').val() == "" || $('#TNomPuestoAprendizaje').val() == null) 
                            {
                                alert("Favor de ingresar el nombre");
                                valida++;
                                $('#TNomPuestoAprendizaje').focus();
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
                                                            if ($('#TCvePuestoAprendizaje').val() != 0) 
                                                            {
                                                                FActualizar_puestos_aprendizaje();
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
                                "p_CvePuestoAprendizaje" : $('#TCvePuestoAprendizaje').val(),
                                "p_NomPuestoAprendizaje" : $('#TNomPuestoAprendizaje').val(),
                                "p_ObjetivoGral"         : $('#TObjetivoGral').val(),
                                "p_RequerimientosGral"   : $('#TRequerimientosGral').val(),
                                "p_Teoricos"             : $('#TTeoricos').val(),
                                "p_Procedimentales"      : $('#TProcedimentales').val(),
                                "p_Actitudinales"        : $('#TActitudinales').val(),
                                "p_ActvdDesarrollo"      : $('#TActvdDesarrollo').val(),
                                "p_Vigente"              : $('#SVigente').val(),
                                "p_CveCompetencia"       : $('#SCveCompetencia').val(),
                                "p_cve_usuario"          : <%=cve_usuario%>
                            }

                            $.ajax
                            (
                                {
                                    data      : par,
                                    url       : "dual_puestos_aprendizaje/registrar_puesto_aprendizaje.jsp",
                                    type      : "POST",
                                    dataType  : "JSON",
                                    success   : function (res) 
                                                {
                                                    alert(res.error);
                                                    FTerminado();
                                                    $('#TCvePuestoAprendizaje').val(res.cve_puesto_aprendizaje);
                                                    FTabla_puestos_aprendizaje();
                                                }
                                }
                            );
                        }
                    }

                    function FLimpiar() 
                    {
                        var today = new Date();
                        var anio = today.getFullYear();

                        $('#TCvePuestoAprendizaje').val(0);
                        $('#TAnio').val(anio);
                        $('#SCveCompetencia').val(-1);
                        $('#TNomPuestoAprendizaje').val("");
                        $('#TObjetivoGral').val("");
                        $('#TRequerimientosGral').val("");
                        $('#TTeoricos').val("");
                        $('#TProcedimentales').val("");
                        $('#TActitudinales').val("");
                        $('#TActvdDesarrollo').val("");
                        $('#SVigente').val(-1);
                    }

                    function FBuscar_puesto_aprendizaje(cve_puesto_aprendizaje) 
                    {
                        FCargando();
                        var par = 
                        {
                            "p_TCvePuestoAprendizaje" : cve_puesto_aprendizaje
                        }

                        $.ajax
                        (
                            {
                                data        : par,
                                url         : "dual_puestos_aprendizaje/buscar_puesto_aprendizaje.jsp",
                                type        : "POST",
                                dataType    : "JSON",
                                success     : function (res)
                                              {
                                                  $('#TCvePuestoAprendizaje').val(res.cve_puesto_aprendizaje);
                                                  $('#TAnio').val(res.anio);
                                                  $('#SCveCompetencia').val(res.cve_competencia);
                                                  $('#TNomPuestoAprendizaje').val(res.nombre_puesto_aprendizaje);
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
                        );
                    }

                    function FActualizar_puestos_aprendizaje() 
                    {
                        FCargando();
                        var par = 
                        {
                            "p_CvePuestoAprendizaje" : $('#TCvePuestoAprendizaje').val(),
                            "p_NomPuestoAprendizaje" : $('#TNomPuestoAprendizaje').val(),
                            "p_ObjetivoGral"         : $('#TObjetivoGral').val(),
                            "p_RequerimientosGral"   : $('#TRequerimientosGral').val(),
                            "p_Teoricos"             : $('#TTeoricos').val(),
                            "p_Procedimentales"      : $('#TProcedimentales').val(),
                            "p_Actitudinales"        : $('#TActitudinales').val(),
                            "p_ActvdDesarrollo"      : $('#TActvdDesarrollo').val(),
                            "p_Vigente"              : $('#SVigente').val(),
                            "p_CveCompetencia"       : $('#SCveCompetencia').val(),
                            "p_cve_usuario"          : <%=cve_usuario%>
                        }

                        $.ajax
                        (
                            {
                                data        : par,
                                url         : "dual_puestos_aprendizaje/actualizar_puesto_aprendizaje.jsp",
                                type        : "POST",
                                dataType    : "JSON",
                                success     : function (res)
                                            {
                                                alert(res.error);
                                                FTabla_puestos_aprendizaje()
                                                FTerminado();
                                            }
                            }
                        );
                    }

                    function FDuplicar_puestos_aprendizaje() 
                    {
                        if ($('#TCvePuestoAprendizaje').val() == 0) 
                        {
                            alert("Selecciona un puesto de aprendizaje o registralo");
                        }
                        else
                        {
                            FCargando();
                            var par = 
                            {
                                "p_CvePuestoAprendizaje" : $('#TCvePuestoAprendizaje').val()
                            }
                            $.ajax
                            (
                                {
                                    data      : par,
                                    url       : "dual_puestos_aprendizaje/duplicar_puesto_aprendizaje.jsp",
                                    type      : "POST",
                                    dataType  : "JSON",
                                    success   : function (res) 
                                                {
                                                    alert(res.error);
                                                    FTerminado();
                                                    $('#TCvePuestoAprendizaje').val(res.cve_puesto_aprendizaje);
                                                    FTabla_puestos_aprendizaje();
                                                }
                                }
                            )
                        }
                    }

                    function FActualizar_select_competencias() 
                    {
                        FCargando();
                        var par =
                        {
                            "p_cve_usuario" : <%=cve_usuario%>
                        }

                        $.post
                        (
                            "dual_puestos_aprendizaje/actualizar_select_competencias.jsp", par,
                            function(htmlExterno) 
                            {
                                $('#divCompetencias').html(htmlExterno);
                                FTerminado();
                            }
                        );
                    }
                </script>
            </html>
        <%
    }
    else
    {
        out.print("Inicia sesión");
    }
%>