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
        console.log(dato.compra)
        console.log('match: '+dato.compra.match(valoresAceptados))
    }
    return `<div class="col-sm-6">
                        <p class="card-text m-0">COMPRA</p>
                        <h4 class="fw-bold m-0" id="valorCompra">${icono}${dato.compra}</h4>
                    </div>`
}

function generarVenta(dato){
    return `<div class="col-sm-6">
                        <p class="card-text m-0">VENTA</p>
                        <h4 class="fw-bold m-0" id="valorVenta">$${dato.venta}</h4>
                    </div>`
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

    return `<div class="card-body bg-white ">
        <p class="card-text" id="variacion"><span class="fa ${icono}" ${estilo}></span> VARIACIÓN ${signo}${dato.variacion}%</p>
    </div>`
}

function obtenerMinutos(fecha){
    return(fecha.getMinutes()<10)?'0'+fecha.getMinutes():fecha.getMinutes();
}

function actualizar(){
    let fecha = new Date;
    return `ACTUALIZADO ${fecha.getDate()}/${fecha.getMonth()}/${fecha.getFullYear()} ${fecha.getHours()}:${obtenerMinutos(fecha)} `
}

let contenido = document.getElementById('contenido');

function imprimirCard(dato){
    let card = document.createElement('div');
    card.classList.add('col-md-4');
    card.classList.add('my-1');
    card.innerHTML= `
        <div class="card bg-success text-center h-100">
            <div class="h-100 px-1">
                <h3 class="card-title text-white position-relative top-50 translate-middle-y">
                    <span class="fa fa-money" style="color:white;"></span> ${dato.nombre}
                </h3>
            </div>
            <div class="card-body bg-secondary">
                <div class="row">
                    ${generarCompra(dato)}
                    ${generarVenta(dato)}
                </div>
            </div>
            ${generarVariacion(dato)}
            <p class="text-white" id="ultimaActualizacion">${actualizar()}</p>
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
    while (contenido.hasChildNodes()) {
        contenido.removeChild(contenido.firstChild);
    }
    llamadoAPI();
},120000);//Se actualiza cada dos minutos
