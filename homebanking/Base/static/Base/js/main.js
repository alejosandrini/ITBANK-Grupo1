let  valoresAceptados = /^[0-9|,]+$/;

function reducirInformacion(info){
    let nuevoDato = {
        nombre: info.casa.nombre,
        compra: info.casa.compra,
        venta: info.casa.venta,
        variacion: info.casa.variacion
    };
    return nuevoDato;
}



function esDolar(dato){
    return dato.nombre.includes('Dolar ')&&!(dato.nombre.includes('Soja'));
}


function generarCompra(dato){
    let icono = '$';
    if(dato.compra.match(valoresAceptados)==null){
        icono = ''
    }else{
        let posicionDecimales = dato.compra.indexOf(',')
        dato.compra = dato.compra.substring(0, posicionDecimales+3)
    }
    return `
                        <p class="card-text m-0">COMPRA</p>
                        <h4 class="fw-bold m-0" id="valorCompra">${icono}${dato.compra}</h4>
           `
}

function generarVenta(dato){
    let icono = '$';
    if(dato.venta.match(valoresAceptados)==null){
        icono = ''
    }else{
        let posicionDecimales = dato.venta.indexOf(',')
        dato.venta = dato.venta.substring(0, posicionDecimales+3)
    }
    return `
                        <p class="card-text m-0">VENTA</p>
                        <h4 class="fw-bold m-0" id="valorVenta">${icono}${dato.venta}</h4>
           `
}

function generarVariacion(dato){
    let icono;
    let signo ='';
    let estilo;
    if(dato.variacion.includes('-')){
        icono = 'fa-caret-down';
        estilo = 'style="color:red;"';
    }else{
        icono = 'fa-caret-up';
        signo = '+';
        estilo = 'style="color:green;"';
    }
    let posicionDecimales = dato.variacion.indexOf(',')
    dato.variacion = dato.variacion.substring(0, posicionDecimales+3)
    return `
        <p class="card-text" id="variacion"><span class="fa ${icono}" ${estilo}></span> VARIACIÓN ${signo}${dato.variacion}%</p>
            `
}

function obtenerMinutos(fecha){
    return(fecha.getMinutes()<10)?'0'+fecha.getMinutes():fecha.getMinutes();
}

function actualizar(){
    let fecha = new Date;
    return `ACTUALIZADO ${fecha.getDate()}/${fecha.getMonth()}/${fecha.getFullYear()} ${fecha.getHours()}:${obtenerMinutos(fecha)} `
}

function generarNombre(dato){
    return `
                    <span class="fa fa-money" style="color:white;"></span> ${dato.nombre}
           `
}

let contenido = document.getElementById('contenido');

function imprimirCard(dato, numeroCard){
    let card = document.createElement('div');
    card.classList.add('col-md-4');
    card.classList.add('my-1');
    card.innerHTML= `
        <div class="card bg-success text-center h-100">
            <div class="h-100 px-1">
                <h3 class="card-title text-white position-relative top-50 translate-middle-y nombre">
                    ${generarNombre(dato)}
                </h3>
            </div>
            <div class="card-body bg-secondary">
                <div class="row">
                    <div class="col-sm-6 compra">
                        ${generarCompra(dato)}
                    </div>
                    <div class="col-sm-6 venta">
                        ${generarVenta(dato)}
                    </div>
                </div>
            </div>
            <div class="card-body bg-white variacion">
                ${generarVariacion(dato)}
            </div>
            <p class="text-white actualizacion" id="ultimaActualizacion">
                ${actualizar()}
            </p>
        </div>`
    contenido.appendChild(card);
}

function llamadoAPI(){ 
    fetch('https://www.dolarsi.com/api/api.php?type=valoresprincipales')
    .then(response => response.json())
    .then(data => {
        let datos = data.map(x=>reducirInformacion(x)).filter(y=>esDolar(y));
        console.log(datos);
        for(let dato of datos){
            imprimirCard(dato);
            console.log(dato);
        }
    });
}
llamadoAPI();
setInterval(()=>{
    fetch('https://www.dolarsi.com/api/api.php?type=valoresprincipales')
    .then(response => response.json())
    .then(data => {
        let datos = data.map(x=>reducirInformacion(x)).filter(y=>esDolar(y));
        actualizarDatos(datos);
    })
    console.log('Se actualizaron los datos!')
},120000);//Se actualiza cada dos minutos

function actualizarDatos(datos){
    let cantidadCards = document.querySelectorAll("div.card").length;
    console.log("Cantidad de cards = ", cantidadCards)
    console.log("Cantidad de datos = ", datos.length)
    if (cantidadCards!=datos.length){ 
        //por si la API nos devuelve un elemento nuevo, genera todas las cartas de nuevo
        llamadoAPI();
    }else{
        //si es la misma cantidad, se actualizan solo los datos
        let nombres = document.getElementsByClassName("nombre");
        let compras = document.getElementsByClassName("compra");
        let ventas = document.getElementsByClassName("venta");
        let variaciones = document.getElementsByClassName("variacion");
        let actualizaciones = document.getElementsByClassName("actualizacion");
        for(let i in datos){
            nombres.item(i).innerHTML = generarNombre(datos[i]);
            compras.item(i).innerHTML = generarCompra(datos[i]);
            ventas.item(i).innerHTML = generarVenta(datos[i]);
            variaciones.item(i).innerHTML = generarVariacion(datos[i]);
            actualizaciones.item(i).innerHTML = actualizar();
        }
    }
}