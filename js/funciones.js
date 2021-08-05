/*
	FUNCIONES GENERICAS
*/

function validarSiNumero(object)
/************************************************************************************
	DESCRIPCION: Esta funci�n es para validar solo n�meros.
				 En la validaci�n estamos indicando que sea diferente a la expresi�n regular definida. 
				 De ah� el simbolo exclamaci�n (!). Que lo que hace es negar lo puesto despu�s.	
	CREADO POR: Nancy Alegr�a L�pez
	FECHA: 13/05/2015
************************************************************************************/
{
	var numero = object.value;
	if (!/^([0-9])*$/.test(numero))
	{
		object.value = numero.substring(0,numero.length-1);
	}
}

function validarFecha(object)
/************************************************************************************
	DESCRIPCION: Esta funci�n es para validar que la fecha se ponga con este formato:
				 (Por ejemplo 01/01/2007)
	CREADO POR: Nancy Alegr�a L�pez
	FECHA: 13/05/2015
************************************************************************************/
{
	
	var fecha = object.value;
	var expreReg = /^\d{1,2}\/\d{1,2}\/\d{4}$/;

	if (!expreReg.test(fecha)) 
	{
		alert("EL FORMATO DE LA FECHA ES INCORRECTO. VERIFIQUE POR FAVOR.");		
		object.value = "";
		object.focus();		
	}			
}

