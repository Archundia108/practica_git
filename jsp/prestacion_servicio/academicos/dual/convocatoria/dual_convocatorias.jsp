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
        <title>Convocatoria</title>
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
                        <td class="encabezado">Convocatoria</td>
                    </tr>
                </table>
            </div>
        </div>

        <br>
        <div class="row SoloTexto2">
            <div class="col-md-2">&nbsp;</div>
            <div class="col-md-1">
                Folio
                <br>
                <input type="text" name="TFolio" id="TFolio" class="captura combo100" value="0" readonly>
            </div>
            <div class="col-md-1">
                Fecha de inicio
                <br>
                <input type="date" name="TFechaIni" id="TFechaIni" class="captura combo100">
            </div>
            <div class="col-md-1">
                Fecha de término
                <br>
                <input type="date" name="TFechaTer" id="TFechaTer" class="captura combo100">
            </div>
            <div class="col-md-1">
                Vigente
                <br>
                <select name="SVigente" id="SVigente" class="captura combo50">
                    <option value="-1">...seleccionar...</option>
                    <option value="1">Si</option>
                    <option value="0">No</option>
                </select>
            </div>
            <div class="col-md-2">
                Puesto de aprendizaje
                <br>
                <select name="SCvePuestoAprendizaje" id="SCvePuestoAprendizaje" class="captura combo200" onchange="FCarreras()">
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
            <div class="col-md-1">
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
                Descripción
                <br>
                <textarea name="TDescripcion" id="TDescripcion" cols="30" rows="5" class="captura_obligada combo200" onkeypress="return FCaracteres(event)"></textarea>
            </div>
            <div class="col-md-5">&nbsp;</div>
        </div>

        <br>
        <div class="row SoloTexto2">
            <div class="col-md-3" id="gif_espera">&nbsp;</div>
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
                <img src="../../../../../imagenes/ikonoz/inicio.png" class="iconsButtons" title="Salir" onclick="FSalir()">
                <br>
                Salir
            </div>
            <div class="col-md-3">&nbsp;</div>
        </div>

        <br>
        <div class="row SoloTexto2">
            <div class="col-md-1">&nbsp;</div>
            <div class="col-md-10">
                <table class="table table-hover table-sm border border-info SoloTexto2" cellpading="0" cellspacing="0" id="TblConvocatorias">
                    <thead class="table-dark SoloTexto2">
                        <tr class="bg-info">
                            <th class="aling-middle text-center" colspan="7" scope="col">Listado de convocatorias</th>
                        </tr>
                        <tr class="bg-secondary">
                            <th class="aling-middle text-center" scope="col">Folio</th>
                            <th class="aling-middle text-center" scope="col">Puesto de aprendizaje</th>
                            <th class="aling-middle text-center" scope="col">Puestos</th>
                            <th class="aling-middle text-center" scope="col">Descripción</th>
                            <th class="aling-middle text-center" scope="col">Fecha de inicio</th>
                            <th class="aling-middle text-center" scope="col">Fecha de término</th>
                            <th class="aling-middle text-center" scope="col">Vigente</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th class="aling-middle text-center" scope="col">--</th>
                            <td class="aling-middle text-center">--</td>
                            <td class="aling-middle text-center"><a href="">Ver</a></td>
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

        function FVentanaPuestos(cve_puesto_aprendizaje)
        {
            var w = screen.width;
            var h = screen.height;
            var left = w / 8;
            var top =  h / 8;
            w = (w / 8) * 6;
            h = (h / 8) * 5;
            
            var URL = "ver_puesto_aprendizaje.jsp?cve_puesto_aprendizaje="+cve_puesto_aprendizaje;
            
            window.open(URL,'titulo_ventana','width='+w+',height='+h+',menubar=no,scrollbars=yes,toolbar=no,locatio n=no,directories=no,resizable=no,top='+top+',left='+left);
        }

        function FTabla_convocatorias()
        {
            FCargando();
            var par =
            {
                "p_cve_usuario" : <%=cve_usuario%>
            }
            $.post
            (
                "dual_convocatorias/tabla_convocatorias.jsp", par,
                function(htmlExterno) 
                {
                    $('#TblConvocatorias').html(htmlExterno);
                    FTerminado();
                }
            )
        }
        FTabla_convocatorias()

        function FCarreras() 
        {
            if ($('#SCvePuestoAprendizaje').val() != -1)
            {
                FCargando();
                var par = 
                {
                    "p_cve_puesto_aprendizaje" : $('#SCvePuestoAprendizaje').val()
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
                )
            }
            else
            {
                $('#TCarrera').val("");
            }
        }

        function FRegistrar_convocatorias() 
        {
            FCargando();
            var valida = 0;
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
                    if ($('#SVigente').val() == -1 || $('#SVigente').val() == null ) 
                    {
                        alert("Favor de seleccionar si es vigente");
                        $('#SVigente').focus();
                        valida++;
                    }
                    else
                    {
                        if ($('#SCvePuestoAprendizaje').val() == -1 || $('#SCvePuestoAprendizaje').val() == null ) 
                        {
                            alert("Favor de seleccionar el puesto de aprendizaje");
                            $('#SCvePuestoAprendizaje').focus();
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
                                if ($('#TFolio').val() != 0) 
                                {
                                    FActualizar_convocatorias();
                                    valida++;
                                }
                            }
                        }
                    }
                }
            }

            if (valida == 0) 
            {
                FCargando();
                var f_ini = $('#TFechaIni').val().split('-');
                var nf_ini = f_ini[2] + '-' + f_ini[1] + '-' + f_ini[0];

                var f_ter = $('#TFechaTer').val().split('-');
                var nf_ter = f_ter[2] + '-' + f_ter[1] + '-' + f_ter[0];

                var par =
                {
                    "p_fecha_inicio"           : nf_ini,
                    "p_fecha_termino"          : nf_ter,
                    "p_vigente"                : $('#SVigente').val(),
                    "p_cve_puesto_aprendizaje" : $('#SCvePuestoAprendizaje').val(),
                    "p_descripcion"            : $('#TDescripcion').val(),
                    "p_cve_usuario"            : <%=cve_usuario%>
                }
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
                                        $('#TFolio').val(res.cve_convocatoria);
                                        FTabla_convocatorias();
                                    }
                    }
                )
            }
        }

        function FBuscar(cve_convocatoria)
        {
            FCargando();
            var par =
            {
                "p_cve_convocatoria" : cve_convocatoria
            }
            $.ajax
            (
                {
                    data      : par,
                    url       : "dual_convocatorias/buscar_convocatoria.jsp",
                    type      : "POST",
                    dataType  : "JSON",
                    success   : function (res) 
                                {
                                    $('#TFolio').val(res.cve_convocatoria);
                                    $('#TFechaIni').val(res.fecha_inicio);
                                    $('#TFechaTer').val(res.fecha_termino);
                                    $('#SVigente').val(res.vigente);
                                    $('#SCvePuestoAprendizaje').val(res.cve_puesto_aprendizaje);
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
            $('#TFolio').val(0);
            $('#TFechaIni').val("");
            $('#TFechaTer').val("");
            $('#SVigente').val(-1);
            $('#SCvePuestoAprendizaje').val(-1);
            FCarreras();
            $('#TDescripcion').val("");
            FTerminado();
        }

        function FActualizar_convocatorias() 
        {
            FCargando();
            var par = 
            {
                "p_cve_convocatoria"       : $('#TFolio').val(),
                "p_fecha_inicio"           : $('#TFechaIni').val(),
                "p_fecha_termino"          : $('#TFechaTer').val(),
                "p_vigente"                : $('#SVigente').val(),
                "p_cve_puesto_aprendizaje" : $('#SCvePuestoAprendizaje').val(),
                "p_descripcion"            : $('#TDescripcion').val()
            }
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

    </script>
</html>

<%
}
else
{
    out.print("Inicia sesi&oacute;n");
}
%>