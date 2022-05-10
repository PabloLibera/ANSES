/* variables */
var textomas = document.getElementById("textomasinfo");


/* personalizar texto accordion */

function txtmasinfo() {
    if (textomas.innerText === "MAS INFORMACIÓN") {
        textomas.innerText = "MENOS INFORMACIÓN"
    } else {
        textomas.innerText = "MAS INFORMACIÓN"
    }
}

/* Tooltip */

var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
});


/* scroll */

function sumarscroll() {
    document.getElementById('pills-tab').scrollLeft += 100;
    }
function restarscroll() {
        document.getElementById('pills-tab').scrollLeft -= 100;
        }