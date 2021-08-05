/************************************************************************************
	DESCRIPCION: Esta funci�n es para validar solo n�meros.
				 En la validaci�n estamos indicando que sea diferente a la expresi�n regular definida. 
				 De ah� el simbolo exclamaci�n (!). Que lo que hace es negar lo puesto despu�s.	
	CREADO POR: Nancy Alegr�a L�pez
	FECHA: 13/05/2015
************************************************************************************/
function validarSiNumero(numero)
{
    if (!/^([0-9])*$/.test(numero))
    return false;
}


function validarEmail(email) 
{
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if ( !expr.test(email) )
	{
		return 1;  //error
	}
	else
	{
		return 0; //no error
	}
}					

function validarFormatoFecha(campo) 
/***********************************************************************
	DESCRIPCION: Esta funci�n nos validar� utilizando una expresi�n regular si nuestra 
	variable corresponde con el formato de una fecha corriente, como por ejemplo � 13/09/1985. 
	Devolver� true si la fecha es correcta y false si es incorrecta o la variable est� vac�a.
	CREADO POR: Nancy Alegr�a L�pez
	FECHA: 25/08/2016
***********************************************************************/
{
      var RegExPattern = /^([0][1-9]|[12][0-9]|3[01])(\/|-)([0][1-9]|[1][0-2])\2(\d{4})$/;
      
      if ((campo.match(RegExPattern)) && (campo!='')) {   
            return true;
      } else {      	
            return false;
      }
}

function validarFormatoRFC(campo) 
/***********************************************************************
	DESCRIPCION: Validar si el RFC tiene el formato correcto.
	CREADO POR: Nancy Alegr�a L�pez
	FECHA: 26/09/2016
***********************************************************************/
{
	  var RegExPattern = /^([A-Z�\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1]))([A-Z\d]{3})?$/;	  
      
      if ((campo.match(RegExPattern)) && (campo!='')) {   
            return true;
      } else {      	
            return false;
      }
}

function CalcularEdad(fecha)
{
// alert("Llego a Calcular Edad");
    var values=fecha.split("/");
    var dia = values[0];
    var mes = values[1];
    var ano = values[2];	 

	fecha_hoy = new Date();
	ahora_ano = fecha_hoy.getYear();
	ahora_mes = fecha_hoy.getMonth();
	ahora_dia = fecha_hoy.getDate();
	edad = (ahora_ano + 1900) - ano;
	    
	    if ( ahora_mes < (mes - 1)){
	      edad--;
	    }
	    if (((mes - 1) == ahora_mes) && (ahora_dia < dia)){ 
	      edad--;
	    }
	    if (edad > 1900){
	        edad -= 1900;
	    }
	 
//	    alert("�Tienes " + edad + " a�os!");
	return edad;		
}

function validarCurp(campo)
{
     var RegExPattern = /^([a-z]{4})([0-9]{6})([a-z]{6})([0-9A-Z]{1})([0-9]{1})$/i;	
      if ((campo.match(RegExPattern)) && (campo!='')) 
      {         
            return true;
      } 
      else 
      {      	     
            return false;
      }      

}

function soloLetrasyNumeros(e)
{
	   key = e.keyCode || e.which;		   
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " �����abcdefghijklmn�opqrstuvwxyz1234567890";
       especiales = "8-37-39-46";

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
}

function formatoTelefono(e)
{
	   key = e.keyCode || e.which;		   
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " 1234567890-()";
       especiales = "8-37-39-46";

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
}

function aMays(e, elemento) 
{
	tecla=(document.all) ? e.keyCode : e.which; 
 	elemento.value = elemento.value.toUpperCase(); 	
}

function soloNumeros(e)
{
	   key = e.keyCode || e.which;		   
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " 1234567890";
       especiales = "8-37-39-46";

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
}

function soloLetras(e)
{
	   key = e.keyCode || e.which;		   
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " �����abcdefghijklmn�opqrstuvwxyz";
       especiales = "8-37-39-46";

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
}
