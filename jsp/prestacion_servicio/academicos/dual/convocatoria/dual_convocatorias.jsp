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
        int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("clave_usuario")));

        String consultas = "", error = "", nombre_competencia = "";
        int cve_competencia = 0;

        %>
            <html>
                <head>
                    <title>Convocatoria</title>
                    
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
                            <td class="encabezado">Convocatoria</td>
                        </tr>
                    </table>

                    <br>
                    <div class="row SoloTexto2">
                        <div class="col-md-2">&nbsp;</div>
                        <div class="col-md-1">
                            Folio
                            <br>
                            <input type="text" name="TCveConvocatoria" id="TCveConvocatoria" class="captura combo100" value="0" readonly>
                        </div>
                        <div class="col-md-1">
                            Fecha de inicio
                            <br>
                            <input type="date" name="TFechaIni" id="TFechaIni" class="captura combo100">
                        </div>
                        <div class="col-md-1">
                            Fecha de t??rmino
                            <br>
                            <input type="date" name="TFechaTer" id="TFechaTer" class="captura combo100">
                        </div>
                        <div class="col-md-1">
                            Vigente
                            <br>
                            <select name="SVigente" id="SVigente" class="captura combo100">
                                <option value="-1">...seleccionar</option>
                                <option value="1">Si</option>
                                <option value="0">No</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            Competencia
                            <br>
                            <select name="SCveCompetencia" id="SCveCompetencia" class="captura combo200" onchange="FCarreras()">
                                <option value="-1">...selecciona...</option>
                                <%
                                    consultas = "SELECT p.nombre_competencia, p.cve_competencia "
                                              + "FROM dual_competencias p "
                                              + "INNER JOIN carreras_universidad c ON c.cve_carrera = p.cve_carrera "
                                              + "WHERE (c.cve_director = "+cve_usuario+")";
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
                            Carrera
                            <br>
                            <input type="text" name="TCarrera" id="TCarrera" class="captura combo300" readonly>
                        </div>
                        <div class="col-md-1">&nbsp;</div>
                    </div>

                    <br>
                    <div class="row SoloTexto2">
                        <div class="col-md-5">&nbsp;</div>
                        <div class="col-md-2">
                            Descripci??n
                            <br>
                            <textarea name="TDescripcion" id="TDescripcion" cols="30" rows="5" class="captura_obligada combo200" onkeypress="return FCaracteres(event)"></textarea>
                        </div>
                        <div class="col-md-5">&nbsp;</div>
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
                            <img src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guardar" onclick="FRegistrar_convocatorias()">
                            <br>
                            Guardar/Modificar
                        </div>
                        <div class="col-md-2">
                            <img src="../../../../../imagenes/ikonoz/notificar.png" class="iconsButtons" title="Notificar" onclick="FNotificar()">
                            <br>
                            Notificar
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
                        <div class="col-md-10" id="TblConvocatorias">
                            <table class="table-hover table-bordered" width="100%">
                                <thead class="table-dark SoloTexto2">
                                    <tr class="bg-info">
                                        <th class="align-middle text-center" colspan="8" scope="col">Listado de convocatorias</th>
                                    </tr>
                                    <tr class="bg-secondary align-middle text-center">
                                        <th scope="col">Folio</th>
                                        <th scope="col">Competencia</th>
                                        <th scope="col">Puestos de aprendizaje</th>
                                        <th scope="col">Descripci??n</th>
                                        <th scope="col">Fecha de inicio</th>
                                        <th scope="col">Fecha de t??rmino</th>
                                        <th scope="col">Vigente</th>
                                        <th scope="col">Fecha de notificaci??n</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th class="align-middle text-center" scope="col">--</th>
                                        <td class="align-middle text-center">--</td>
                                        <td class="align-middle text-center">--</td>
                                        <td class="align-middle text-center">--</td>
                                        <td class="align-middle text-center">--</td>
                                        <td class="align-middle text-center">--</td>
                                        <td class="align-middle text-center">--</td>
                                        <td class="align-middle text-center">--</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-1">&nbsp;</div>
                    </div>

                    <br>
                    <div class="row SoloTexto2">    
                        <div class="col-md-12">
                            Universidad Tecnol??gica de San Juan del R??o <br>
                            Departamento de Tecnolog??as de la Informaci??n <br>
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

                    function FCaracteres(event) 
                    {
                        var key = (event.keyCode || event.which);                
                        var tecla = String.fromCharCode(key).toString();
                        var letras = "ABCDEFGHIJKLMN??OPQRSTUVWXYZabcdefghijklmn??opqrstuvwxyz??????????1234567890 ,.";

                        if (letras.indexOf(tecla) == 13) 
                        {
                            if (letras.indexOf(tecla) == -1) 
                            {
                                return false;   
                            }
                        }
                    }

                    function FVentana_ver_competencias(cve_competencia)
                    {
                        var w = screen.width;
                        var h = screen.height;
                        var left = w / 8;
                        var top =  h / 8;
                        w = (w / 8) * 6;
                        h = (h / 8) * 5;
                        
                        var URL = "impresion_competencia.jsp?cve_competencia="+cve_competencia;
                        
                        window.open(URL,'titulo_ventana','width='+w+',height='+h+',menubar=no,scrollbars=yes,toolbar=no,locatio n=no,directories=no,resizable=no,top='+top+',left='+left);
                    }

                    function FTabla_convocatorias()
                    {
                        FCargando();
                        var par =
                        {
                            "p_cve_usuario" : <%=cve_usuario%>
                        };

                        $.post
                        (
                            "dual_convocatorias/tabla_convocatorias.jsp", par,
                            function(htmlExterno) 
                            {
                                $('#TblConvocatorias').html(htmlExterno);
                                FTerminado();
                            }
                        );
                    }
                    FTabla_convocatorias()

                    function FCarreras() 
                    {
                        if ($('#SCveCompetencia').val() != -1)
                        {
                            FCargando();
                            var par = 
                            {
                                "p_cve_competencia" : $('#SCveCompetencia').val()
                            }

                            $.ajax
                            (
                                {
                                    data        : par,
                                    url         : "dual_convocatorias/ver_carrera.jsp",
                                    type        : "POST",
                                    dataType    : "JSON",
                                    success     : function (res)
                                                  {
                                                      $('#TCarrera').val(res.nombre_carrera);
                                                      FTerminado();
                                                  }
                                }
                            );
                        }
                        else
                        {
                            $('#TCarrera').val("");
                        }
                    }

                    function FRegistrar_convocatorias() 
                    {
                        var valida = 0;
                        var date = new Date();
                        var dia = date.getDate();
                        var mes = date.getMonth() + 1;
                        if (mes < 12)
                        {
                            mes = '0' + mes;
                        }
                        var anio = date.getFullYear();
                        var hoy = anio + '-' + mes + '-' + dia;
                        var fecha = (hoy).split('-');

                        if ($('#TFechaIni').val() == 0 || $('#TFechaIni').val() == null ) 
                        {
                            alert("Favor de ingresar la fecha de inicio");
                            $('#TFechaIni').focus();
                            valida++;
                        }
                        else
                        {
                            if ($('#TFechaTer').val() == 0 || $('#TFechaTer').val() == null ) 
                            {
                                alert("Favor de ingresar la fecha de termino");
                                $('#TFechaTer').focus();
                                valida++;
                            }
                            else
                            {
                                if ($('#SVigente').val() == -1 || $('#SVigente').val() == null) 
                                {
                                    alert("Favor de ingresar si es vigente");
                                    $('#SVigente').focus();
                                    valida++;
                                }
                                else
                                {
                                    if ($('#SCveCompetencia').val() == -1 || $('#SCveCompetencia').val() == null ) 
                                    {
                                        alert("Favor de seleccionar el puesto de aprendizaje");
                                        $('#SCveCompetencia').focus();
                                        valida++;
                                    }
                                    else
                                    {
                                        if ($('#TDescripcion').val() == 0 || $('#TDescripcion').val() == null ) 
                                        {
                                            alert("Favor de ingresar la descripcion");
                                            $('#TDescripcion').focus();
                                            valida++;
                                        }
                                        else
                                        {
                                            var f_ini = $('#TFechaIni').val().split('-');
                                            var nf_ini = f_ini[2] + '-' + f_ini[1] + '-' + f_ini[0];
                                            var f_ter = $('#TFechaTer').val().split('-');
                                            var nf_ter = f_ter[2] + '-' + f_ter[1] + '-' + f_ter[0];

                                            if (f_ter[0] < fecha[0]) 
                                            {
                                                alert("Ingrese una fecha de t??rmino v??lida");
                                                $('#TFechaTer').focus();
                                                valida++;
                                            }
                                            else
                                            {
                                                if (f_ter[1] < fecha[1]) 
                                                {
                                                    alert("Ingrese una fecha de t??rmino v??lida");
                                                    $('#TFechaTer').focus();
                                                    valida++;
                                                }
                                                else
                                                {
                                                    if (f_ter[2] < fecha[2]) 
                                                    {
                                                        alert("Ingrese una fecha de t??rmino v??lida");
                                                        $('#TFechaTer').focus();
                                                        valida++;
                                                    }
                                                    else
                                                    {
                                                        if ($('#TCveConvocatoria').val() != 0) 
                                                        {
                                                            FActualizar_convocatorias();
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

                        if (valida == 0) 
                        {
                            FCargando();
                            var par =
                            {
                                "p_fecha_inicio"     : nf_ini,
                                "p_fecha_termino"    : nf_ter,
                                "p_vigente"          : $('#SVigente').val(),
                                "p_cve_competencia"  : $('#SCveCompetencia').val(),
                                "p_descripcion"      : $('#TDescripcion').val(),
                                "p_cve_usuario"      : <%=cve_usuario%>
                            };

                            $.ajax
                            (
                                {
                                    data      : par,
                                    url       : "dual_convocatorias/registrar_convocatoria.jsp",
                                    type      : "POST",
                                    dataType  : "JSON",
                                    success   : function (res) 
                                                {
                                                    alert(res.error);
                                                    FTerminado();
                                                    $('#TCveConvocatoria').val(res.cve_convocatoria);
                                                    FTabla_convocatorias();
                                                }
                                }
                            );
                        }
                    }

                    function FBuscar(cve_convocatoria)
                    {
                        FCargando();
                        var par =
                        {
                            "p_cve_convocatoria" : cve_convocatoria
                        };

                        $.ajax
                        (
                            {
                                data      : par,
                                url       : "dual_convocatorias/buscar_convocatoria.jsp",
                                type      : "POST",
                                dataType  : "JSON",
                                success   : function (res) 
                                            {
                                                $('#TCveConvocatoria').val(res.cve_convocatoria);
                                                $('#TFechaIni').val(res.fecha_inicio);
                                                $('#TFechaTer').val(res.fecha_termino);
                                                $('#SVigente').val(res.vigente);
                                                $('#SCveCompetencia').val(res.cve_competencia);
                                                FCarreras();
                                                $('#TDescripcion').val(res.descripcion);
                                                FTerminado();
                                            }
                            }
                        );
                    }

                    function FLimpiar() 
                    {
                        FCargando();
                        $('#TCveConvocatoria').val(0);
                        $('#TFechaIni').val("");
                        $('#TFechaTer').val("");
                        $('#SVigente').val(-1);
                        $('#SCveCompetencia').val(-1);
                        FCarreras();
                        $('#TDescripcion').val("");
                        FTerminado();
                    }

                    function FActualizar_convocatorias() 
                    {
                        FCargando();
                        var par = 
                        {
                            "p_cve_convocatoria"  : $('#TCveConvocatoria').val(),
                            "p_fecha_inicio"      : $('#TFechaIni').val(),
                            "p_fecha_termino"     : $('#TFechaTer').val(),
                            "p_vigente"           : $('#SVigente').val(),
                            "p_cve_competencia"   : $('#SCveCompetencia').val(),
                            "p_descripcion"       : $('#TDescripcion').val()
                        };

                        $.ajax
                        (
                            {
                                data      : par,
                                url       : "dual_convocatorias/actualizar_convocatoria.jsp",
                                type      : "POST",
                                dataType  : "JSON",
                                success   : function (res) 
                                            {
                                                alert(res.error);
                                                FTabla_convocatorias();
                                                FTerminado();
                                            }
                            }
                        );
                    }

                    function FNotificar() 
                    {
                        if ($('#TCveConvocatoria').val() == 0) 
                        {
                            alert("Selecciona una convocatoria o reg??strala");
                        }
                        else
                        {
                            FCargando();
                            var par = 
                            {
                                "p_cve_convocatoria" : $('#TCveConvocatoria').val()
                            };

                            $.ajax
                            (
                                {
                                    data      : par,
                                    url       : "dual_convocatorias/notificar.jsp",
                                    type      : "POST",
                                    dataType  : "JSON",
                                    success   : function (res) 
                                                {
                                                    alert(res.error);
                                                    FTabla_convocatorias();
                                                    FTerminado();
                                                }
                                }
                            );
                        }
                    }

                    function FVerificar_fecha(fecha_termino, cve_convocatoria) 
                    {
                        var valida_fecha = 0;
                        var date = new Date();
                        var dia = date.getDate();
                        var mes = date.getMonth() + 1;
                        if (mes < 12)
                        {
                            mes = '0' + mes;
                        }
                        var anio = date.getFullYear();
                        var hoy = dia + '-' + mes + '-' + anio;
                        var fecha = (hoy).split('-');
                        var f_ter = (fecha_termino).split('/');

                        if (f_ter[2] >= fecha[2]) 
                        {
                            if (f_ter[1] >= fecha[1]) 
                            {
                                if (f_ter[0] >= fecha[0]) 
                                {
                                    valida_fecha++;
                                }
                            }
                        }

                        if (valida_fecha == 0) 
                        {
                            var par = 
                            {
                                "p_cve_convocatoria" : cve_convocatoria
                            };

                            $.ajax
                            (
                                {
                                    data      : par,
                                    url       : "dual_convocatorias/actualizar_vigencia.jsp",
                                    type      : "POST",
                                    dataType  : "JSON"
                                }
                            );
                        }
                    }
                </script>
            </html>
        <%
    }
    else
    {
        out.print("Inicia sesi??n");
    }
%>