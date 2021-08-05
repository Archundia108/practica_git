function asignarEventos(){
	
document.getElementById("abrir")
.addEventListener("click", function(){
document.getElementById("fondo").
className = "mostrar";	

document.getElementById("js_ventana").
className = "mostrar";
}, false);

document.getElementById("cerrar")
.addEventListener("click", function(){
document.getElementById("fondo").
className = "ocultar";	

document.getElementById("js_ventana").
className = "ocultar";
}, false);


//// cont2

document.getElementById("abrir2")
.addEventListener("click", function(){
document.getElementById("fondo").
className = "mostrar";	

document.getElementById("js_ventana2").
className = "mostrar";
}, false);

document.getElementById("cerrar2")
.addEventListener("click", function(){
document.getElementById("fondo").
className = "ocultar";	

document.getElementById("js_ventana2").
className = "ocultar";
}, false);


}