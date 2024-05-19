// Selecciona todos los elementos que deseas eliminar
var elementosAEliminar = document.querySelectorAll('div[data-message-author-role="user"]');
console.log(elementosAEliminar)
// Itera sobre los elementos
for (var i = 0; i < elementosAEliminar.length; i++) {
        alert(elementosAEliminar[i].childNodes[0].innerText);
        // elementosAEliminar[i].remove();
}
