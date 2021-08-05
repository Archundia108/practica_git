<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*, comun.*" errorPage="../../../../../error.jsp" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%
    if (session.getAttribute("usuario") != null)
    {
        BD SMBD = new BD();
        ResultSet rs;
        String usuario = String.valueOf(session.getAttribute("usuario"));
        int cve_usuario = Integer.parseInt(String.valueOf(session.getAttribute("cve_usuario")));
        
        String consultas = "", nombre_carrera = "", nombre_unidad = "";
        int cve_carrera = 0;
    %>

    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Puestos de aprendizaje</title>
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
                            <td class="titulo">PUESTOS DE APRENDIZAJE</td>
                        </tr>
                        <tr align="center">
                            <td class="usuario"><%=usuario%></td>
                        </tr>
                    </table>
                </div>
            </div>
            
            <br>
            <div class="row SoloTexto2">
                <div class="col-md-3">&nbsp;</div>
                <div class="col-md-1">
                    Folio
                    <br>
                    <input type="text" name="TCveAprendizaje" id="TCveAprendizaje" class="captura combo100" readonly value="0">
                </div>
                <div class="col-md-2">
                    Nombre del puesto de aprendizaje
                    <br>
                    <input type="text" name="TNombreAprendizaje" id="TNombreAprendizaje" class="captura_obligada combo200" onkeypress="return FNombre(event)">
                </div>
                <div class="col-md-3">
                    Carrera
                    <br>
                    <select name="SCarrera" id="SCarrera" class="captura combo300">
                        <option value="-1">...selecciona...</option>
                        <%
                            consultas = "SELECT c.cve_carrera, c.descripcion, u.nombre "
                                    + "FROM carreras_universidad c INNER JOIN unidades_academicas u ON c.cve_unidad_academica = u.cve_unidad_academica "
                                    + "WHERE (c.activo = 1) AND c.cve_director = "+cve_usuario+" "
                                    + "ORDER BY c.cve_unidad_academica, c.continuidad ASC";
                            rs = SMBD.SQLBD(consultas);
                            while (rs.next()) 
                            {
                                cve_carrera = rs.getInt(1);
                                nombre_carrera = rs.getString(2);
                                nombre_unidad = rs.getString(3);
                                %>
                                    <option value="<%=cve_carrera%>"><%=nombre_carrera%> / <%=nombre_unidad%></option>
                                <%
                            }
                            SMBD.desconectarBD();
                        %>
                    </select>
                </div>
                <div class="col-md-3">&nbsp;</div>
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
                    <img src="../../../../../imagenes/ikonoz/guardar.png" class="iconsButtons" title="Guardar" onclick="FRegistra_planes()">
                    <br>
                    Guardar/Modificar
                </div>
                <div class="col-md-2">
                    <img src="../../../../../imagenes/ikonoz/salir.png" class="iconsButtons" title="Cerrar" onclick="window.opener.FActualizar_select_puestos(); window.close()">
                    <br>
                    Cerrar
                </div>
                <div class="col-md-3">&nbsp;</div>
            </div>

            <br>
            <div class="row SoloTexto2">
                <div class="col-md-1">&nbsp;</div>
                <div class="col-md-10">
                    <table class="table table-hover table-sm border border-info SoloTexto2" cellpading="0" cellspacing="0" id="TblPlanesRotacion">
                        <thead class="table-dark SoloTexto2">
                            <tr class="bg-info">
                                <th class="aling-middle text-center" colspan="4" scope="col">Listado de puestos de aprendizaje</th>
                            </tr>
                            <tr class="bg-secondary">
                                <th class="aling-middle text-center" scope="col">Folio</th>
                                <th class="aling-middle text-center" scope="col">Nombre del plan</th>
                                <th class="aling-middle text-center" scope="col">Fecha</th>
                                <th class="aling-middle text-center" scope="col">Carrera</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th class="aling-middle text-center" scope="col">--</th>
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
            function FCargando() {
                $('#gif_espera').html('<img src="../../../../../imagenes/ajax-loader.gif" width="50">')
            }
            
            function FTerminado() {
                $('#gif_espera').html('&nbsp;')
            }

            function FNombre(event) 
            {
                var key = (event.keyCode || event.which);
                var tecla = String.fromCharCode(key).toString();
                var letras = "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyzáéíóú 1234567890";

                if (letras.indexOf(tecla) == -1) 
                {
                    return false;
                }
            }

            function FTabla_puestos_aprendizaje ()
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
                        $('#TblPlanesRotacion').html(htmlExterno);
                        FTerminado();
                    }
                ) 
            }
            FTabla_puestos_aprendizaje()

            function FRegistra_planes()
            {
                var valida = 0;
                if ($('#TNombreAprendizaje').val() == "" || $('#TNombreAprendizaje').val() == null) 
                {
                    alert("Favor de ingresar el nombre");
                    valida++;
                    $('#TNombreAprendizaje').focus();
                }
                else
                {
                    if ($('#SCarrera').val() == -1 || $('#SCarrera').val() == null) 
                    {
                        alert("Favor de ingresar la carrera");
                        valida++;
                        $('#SCarrera').focus();
                    }
                    else
                    {
                        if ($('#TCveAprendizaje').val() != 0) 
                        {
                            FActualizar_planes();
                            valida++;
                        }
                    }
                }
                if (valida == 0) 
                {
                    FCargando();
                    var par = 
                    {
                        "p_TCveAprendizaje"    : $('#TCveAprendizaje').val(),
                        "p_TNombreAprendizaje" : $('#TNombreAprendizaje').val(),
                        "p_SCarrera"           : $('#SCarrera').val(),
                        "p_cve_usuario"        : <%=cve_usuario%>
                    }
                    $.ajax
                    (
                        {
                            data        : par,
                            url         : "dual_puestos_aprendizaje/registrar_puesto_aprendizaje.jsp",
                            type        : "POST",
                            dataType    : "JSON",
                            success     : function (res)
                                        {
                                            alert(res.error);
                                            FTerminado();
                                            $('#TCveAprendizaje').val(res.cve_puesto_aprendizaje);
                                            FTabla_puestos_aprendizaje();
                                        }
                        }
                    )
                }
            }

            function FLimpiar() 
            {
                $('#TCveAprendizaje').val(0);
                $('#TNombreAprendizaje').val("");
                $('#SCarrera').val(-1);
            }

            function FBusca(cve_puesto_aprendizaje) 
            {
                FCargando();
                var par = 
                {
                    "p_TCveAprendizaje" : cve_puesto_aprendizaje
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
                                        $('#TCveAprendizaje').val(res.cve_puesto_aprendizaje);
                                        $('#TNombreAprendizaje').val(res.nombre_puesto_aprendizaje);
                                        $('#SCarrera').val(res.cve_carrera);
                                        FTerminado();
                                    }
                    }
                )
            }

            function FActualizar_planes()
            {
                FCargando();
                var par =
                {
                    "p_TCveAprendizaje"    : $('#TCveAprendizaje').val(),
                    "p_TNombreAprendizaje" : $('#TNombreAprendizaje').val(),
                    "p_SCarrera"           : $('#SCarrera').val(),
                    "p_cve_usuario"        : <%=cve_usuario%> 
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
                                        FTabla_puestos_aprendizaje();
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