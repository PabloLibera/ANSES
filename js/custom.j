const notificaciones        = document.getElementById('notificaciones'),
      usuarioNombre         = document.getElementById('nombreUsuario'),
      usuarioRepresentante  = document.getElementById('nombreRepresentante'),
      usuarioCuil           = document.getElementById('numeroCuil'),
      usuarioTelefono       = document.getElementById('numeroTelefono'),
      usuarioMail           = document.getElementById('correoElectronico'),
      navBtns               = document.querySelectorAll('#menuPrincipal a'),
      fechas                = document.querySelectorAll('.leer-fecha'),
      lugar                 = document.querySelectorAll('.leer-lugar');

let quantityNotification = document.querySelectorAll('.notificaciones ul li.nueva').length,
    activeNavBtn         = document.querySelector('.nav-item .active');

/* Contador de notificaciones */
function showNotificationNumber() {

    if (quantityNotification > 0) {
        
        const notificationNumber = document.createElement('span');
                                   notificaciones.appendChild(notificationNumber);
                                   notificationNumber.setAttribute('id', 'numeroNotificaciones');
        
        notificationNumber.innerText = quantityNotification;

        if (quantityNotification > 1) {
            notificaciones.ariaLabel     = "Notificaciones. Tenés " + quantityNotification + " nuevas sin leer.";
        } else {
            notificaciones.ariaLabel     = "Notificaciones. Tenés una nueva sin leer.";
        }
        
    } else {
        notificaciones.ariaLabel     = "Notificaciones";
    }
    
}


/* Asignación de etiquetas ARIA para el menú usuario */
function setUserAriaLabel() {
    usuarioNombre.ariaLabel     = 'Datos personales de ' + usuarioNombre.children[1].innerText.toLowerCase();
    
  
    if (usuarioRepresentante) {
        usuarioRepresentante.ariaLabel = 'Representado por ' + usuarioRepresentante.children[0].children[1].innerText.toLowerCase();
    }
    
    usuarioCuil.ariaLabel       = 'cuil/cuit ' + usuarioCuil.children[0].children[1].innerText;
    usuarioTelefono.ariaLabel   = 'Número de teléfono ' + usuarioTelefono.children[0].children[1].innerText;
    usuarioMail.ariaLabel       = 'Correo electrónico ' + usuarioMail.children[0].children[1].innerText;
}


/* Convertir una fecha numerica a alfabetica*/
function toStringDate(string) {
    var monthName = ['enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio', 'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'];
    
    text = string;
      
    if (text.includes('/')) {
        weekDay = text.split(' ')[0];
        date  = text.split('/')[0].split(' ')[1];

        if(date.charAt(0) == 0) {
            date  = date.split('0')[1];
        }

        month = text.split('/')[1];

        return weekDay + ' ' + date + ' de ' + monthName[month - 1];
    }
}

/* Asignar una etiqueta ARIA para leer la fecha */
function setDateAriaLabel() {
    var day;

    for (let i = 0; i < fechas.length; i++) {

        day = fechas[i].querySelectorAll('.leer-fecha-item');
        fechas[i].querySelectorAll('p')[0].ariaLabel ='Tu fecha de cobro es el ' + toStringDate(day[0].innerText) + ', y tenés tiempo hasta el ' + toStringDate(day[1].innerText);
    }
}

/* Asigno una etiqueta ARIA para el lugar de cobro */
function setPlaceAriaLabel() {
    for (let i = 0; i < lugar.length; i++) {
        lugar[i].querySelectorAll('p')[0].ariaLabel = 'Tu lugar de cobro es ' + lugar[i].querySelectorAll('p')[0].innerText;
    }
}


/* Activar un link del sidebar */
function setActiveNav(el) {
    activeNavBtn.classList.remove('active');
    activeNavBtn.parentElement.removeAttribute('aria-current');
    activeNavBtn = el;
    activeNavBtn.classList.add('active');
    activeNavBtn.parentElement.setAttribute('aria-current', 'page');
}

/* Click al link del sidebar */
function setBtnOnClick() {

    var href;

    for (let i = 0; i < navBtns.length; i++) {
        navBtns[i].addEventListener('click', function(event){
            href = this.getAttribute('href');

            event.preventDefault();
            setActiveNav(this);
        });
    }
}

/* Cargar al inicio */
function onLoad() {
    showNotificationNumber();
    setUserAriaLabel();
    setDateAriaLabel();
    setPlaceAriaLabel();
    setBtnOnClick();
}

onLoad();