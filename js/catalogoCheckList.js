$(document).on("ready",inicio);

function inicio()
{
    //alert("HOLA");
    obtenerDatosDeAcceso(); 
    obtenerDatosUsuario();
    obtenerDatosComboResponsables();    
    mostrarTablaResponsables();

    
    $("body").on("click",".miLink",function(){	
        //data-id="intCveSeccion"
        var id = $(this).data("id"); // Este objeto es al que le des clic, pues no sabemos a cual de todos los elementos con
                // la clase .miLink le diste clic
        alert("Le di clic al ID: "+ id);
        
        consultarDatosParaActualizar(id);
    });
    

    $('#btnGuardar').on("click",function(){					
        //alert("Llego a Guardar");
        /*  Saber si es una inserción o una actualización de datos
            El valor del text de Clave Logistica si se encuentra en 0 --- Nuevo
            Si se encuentra en una valor mayor a 0 --- Actualización
        */        
        var valorCveLogistica = $('#txtCveLogistica').val();
                                        
        if(valorCveLogistica>0)
        {
            //alert("Va a función de actualizar");
            //tinyMCE.triggerSave();
            actualizarEnCatalogo();
            $('.modal-title').html("MENSAJE INFORMATIVO");
            $('.modal-body').html("ACTIVIDAD ACTUALIZADA CORRECTAMENTE.");					
            $('#envioModal').modal({show:true});                    
        
        }
        else
        {
            //tinyMCE.triggerSave();
        //    alert("Funcion de insertar");
            insertarEnCatalogo();
            $('.modal-title').html("MENSAJE INFORMATIVO");
            $('.modal-body').html("SE INSERTO LA ACTIVIDAD CORRECTAMENTE.");					
            $('#envioModal').modal({show:true});                    
                
        }
        
    });
    

   
    $('#btnSalir').on("click",function(){					
        //alert("Llego a btnSalir");
        window.history.back();
    });
    
    $('#txtDescripcionAct').on("keypress",function(){
        return apoztrofe(event);        
    });
}




function mostrarTablaResponsables()
/************************************************************************************
	DESCRIPCION: Muestra los los responsables y sus actividades
	CREADO POR: Nancy Alegría López
	FECHA: 31/10/2017
************************************************************************************/
{
	$.ajax({	
		url: 'catalogoCheckList/controladores/catalogo_respon_actividades_select.jsp',
		type : 'POST',
		success : function(response){				
            $("#TablaActividades").html(response);                
		}
	});   
}


function obtenerDatosComboResponsables()
/************************************************************************************
	DESCRIPCION: Obtiene los datos del combo de RESPONSABLES
	CREADO POR: Nancy Alegría López
	FECHA: 31/10/2017
************************************************************************************/
{
    //alert("Llego a obtenerDatosComboResponsables");
	$.ajax({
		url: 'catalogoCheckList/controladores/catalogo_persona_responsable.jsp',
		type : 'POST', 
        dataType: 'JSON',
        
		beforeSend : function(){			
			//$("#resultado").html("Procesando, espere por favor...");            
      //      alert("Llego before send");
		},
		success : function(resultado){   
            //alert("Llego aqui");
            //ok ok, ahora hay que recorrer el objeto json, en este caso ahora es la variable declarada entre parentesis (resultado)
            //Limpiamos el combo (no recuerdo si se hace así...)
            
            $("#cmbResponsable").html("");   
            
            $.each(resultado, function(id,r){
                $("#cmbResponsable").append("<option value='"+r.intCvePersona+"'>"+r.strNombre+"</option>");
                //console.log(value);
            });                                            
            
		}
	});
}

function consultarDatosParaActualizar(intCveLogistica)
/************************************************************************************
	DESCRIPCION: Consulta los datos según la clave seleccionada a fin de poderlos
                 visualizar y actualizar
	CREADO POR: Nancy Alegría López
	FECHA: 31/10/2017
************************************************************************************/
{   
    //alert("consultarDatosParaActualizar");
    var parametros = {
		"intCveLogistica" : intCveLogistica
	};	
    
	$.ajax({
		data : parametros,	
		url: 'catalogoCheckList/controladores/catalogo_respon_datos_para_actualizar.jsp',
		type : 'POST', 
        dataType: 'JSON',
		beforeSend : function(){			
			//$("#resultado").html("Procesando, espere por favor...");            
		},
		success : function(resultado){
            
            
            $("#cmbResponsable").val(resultado.intCvePersona);
            $('#cmbResponsable option:selected').val();
            //-->> Revisar porque no funciona siempre.... checalooooooo!!!
            if(resultado.intVigente == 1)
            {            
                $("#checkVigente").attr('checked', true);            
            }
            else
            {                
                $("#checkVigente").attr('checked', false);                               
            }
            
           
            $("#txtDescripcionAct").val(resultado.strNombreActividad);
            $("#txtCveLogistica").val(resultado.intCveLogistica);            
            
		}
	});
    
}

function insertarEnCatalogo()
/************************************************************************************
	DESCRIPCION: Inserta en tabla: kat_logiztika
	CREADO POR: Nancy Alegría López
	FECHA: 31/10/2017
************************************************************************************/
{	
    //alert("Llego a insertarEnCatalogo");
    var strDescripcion = $('#txtDescripcionAct').val();
    var intCvePersonaResponsable = $('#cmbResponsable option:selected').val();
    var intCveEstatus = 0;
    
    if( $("#checkVigente").is(':checked') )
    {
        intCveEstatus = 1;
    }        
    else
    {
        intCveEstatus = 0;
    }
    
    var intCvePersonaMod = $('#txtCvePersonaModifica').val(); 
        
    var parametros = {
		"strDescripcion"                     : strDescripcion,
        "intCvePersonaResponsable"           : intCvePersonaResponsable,
        "intCveEstatus"                      : intCveEstatus,
        "intCvePersonaMod"                   : intCvePersonaMod
	};	

    //console.log(parametros);   
    
	$.ajax({
		data : parametros,	
		url: 'catalogoCheckList/controladores/catalogo_respon_ins.jsp',
		type : 'POST',
		beforeSend : function(){			
			$("#resultado").html("Procesando, espere por favor...");
		},
		success : function(response){				
            $("#resultado").html("");
            //alert(response);  
//            var Cve = 0;
//            Cve = response;
//            alert(Cve);            
            $("#txtCveLogistica").val(response.intCveLogistica);            
            mostrarTablaResponsables();               
            
            
		}
	});
    
}



function actualizarEnCatalogo()
/************************************************************************************
	DESCRIPCION: Actualizar actividad en tabla: kat_logiztika
	CREADO POR: Nancy Alegría López
	FECHA: 31/01/2017
************************************************************************************/
{	
    //alert("Llego a actualizarEnCatalogo");
    var intCveLogistica = $('#txtCveLogistica').val();
    var strDescripcionActividad = $('#txtDescripcionAct').val();
    var intCvePersonaResponsable = $('#cmbResponsable option:selected').val();
    var intEstatus = 0;
    
    //alert(intCveLogistica + '--' + strDescripcionActividad  + '--' + intCvePersonaResponsable + '--' + intEstatus);
    if( $("#checkVigente").is(':checked') )
    {
        intEstatus = 1;
    }        
    else
    {
        intEstatus = 0;
    }
    //alert("intEstatus -- " + intEstatus);
    var intCvePersonaMod = $('#txtCvePersonaModifica').val(); 
        
    var parametros = {
		"intCveLogistica"                   : intCveLogistica,
        "strDescripcionActividad"           : strDescripcionActividad,
        "intCvePersonaResponsable"          : intCvePersonaResponsable,
        "intEstatus"                        : intEstatus,
        "intCvePersonaMod"                  : intCvePersonaMod
	};	

    //console.log(parametros);   
    
	$.ajax({
		data : parametros,	
		url: 'catalogoCheckList/controladores/catalogo_respon_upd.jsp',
		type : 'POST',
		beforeSend : function(){			
			$("#resultado").html("Procesando, espere por favor...");
		},
		success : function(response){				
            $("#resultado").html("");
            mostrarTablaResponsables();                
		}
	});
}

function FSalir()
{
	location.href = "inicio.jsp?menu=4&op=9";
}


function obtenerDatosDeAcceso()
/************************************************************************************
	DESCRIPCION: Obtiene los datos de la persona que accedio al Sistema
	CREADO POR: Nancy Alegría López
	FECHA: 31/10/2017
	
	
	
************************************************************************************/
{
    //alert("Llego a obtenerDatosDeAcceso");
	$.ajax({
		url: 'catalogoCheckList/controladores/obtieneDatosAcceso.jsp',
		type : 'POST', 
        dataType: 'JSON',
		beforeSend : function(){			
			//$("#resultado").html("Procesando, espere por favor...");            
            //alert("Llego before send");
		},
		success : function(resultado){   
            //alert("Lego aqui");
            //alert(resultado.CvePersonaAccesa);
            
            $("#txtCvePersonaModifica").val(resultado.CvePersonaAccesa);
		}
	});
}

/************************************************************************************
	DESCRIPCION: Obtiene datos de usuario que entra al Sistema
	CREADO POR: Nancy Alegría López
	FECHA: 27/09/2017
************************************************************************************/
function obtenerDatosUsuario()
{
 //   console.log("Entro a funcion");
    //alert("Llego a obtenerDatosUsuario");
/*    var parametros = {
		"intCvePersona" : intCvePersona
	};	*/
    
	$.ajax({    
        //data : parametros,
		url: 'catalogoCheckList/controladores/obtieneDatosUsuario.jsp',
		type : 'POST', 
        dataType: 'JSON',
        
		beforeSend : function(){			
			//$("#resultado").html("Procesando, espere por favor...");            
		},
		success : function(resultado){   
            //console.log(resultado.strNombreUsuario);
            //alert("resultado.strNombreUsuario -- " + resultado.strNombreUsuario);
            //alert("resultado.nombreArea -- " + resultado.nombreArea);
            $("#nombreArea").html("");   
            $("#nombreArea").html(resultado.strArea);                        
            
            $("#nombreUsuario").html("");   
            $("#nombreUsuario").html(resultado.strNombreUsuario);                        
		}
	});
}

function apoztrofe(e)
{ 
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toString();
    letras = " áéíóúabcdefghijklmnñopqrstuvwxyzÁÉÍÓÚABCDEFGHIJKLMNÑOPQRSTUVWXYZ-0123456789";//Se define todo el abecedario que se quiere que se muestre.
    especiales = [6, 8, 9, 13, 20, 37, 38, 40, 41, 43, 44, 46, 58, 60, 62]; //Es la validación del KeyCodes, que teclas recibe el campo de texto.

    tecla_especial = false
    for(var i in especiales) 
	{
        if(key == especiales[i]) 
		{
            tecla_especial = true;
            break;
        }
    }

    if(letras.indexOf(tecla) == -1 && !tecla_especial)
        return false;
}
