function createCards(data) {
    let row = document.getElementById('cotizaciones');

    row.innerHTML = "";

    let date = new Date();

    for (let divisa of data) {
        console.log(divisa)
        let col = document.createElement("div");

        col.setAttribute(
            "class",
            "col col-12 col-sm-6 col-lg-4"
        );

        let card = document.createElement("div");

        card.setAttribute(
            "class",
            "card bg-light p-0"
        );

        let cardHeader = document.createElement("div");

        cardHeader.setAttribute(
            "class",
            "card-header bg-dark text-white text-center"
        );
        cardHeader.innerText = `${divisa.nombre}`;

        let cardBody = document.createElement("div");

        let transactionLabel = document.createElement("div");

        transactionLabel.setAttribute(
            "class",
            "row justify-content-md-center d-flex w-100"
        );

        let buyLabel = document.createElement("div");

        buyLabel.setAttribute(
            "class",
            "col-6 text-center"
        );
        buyLabel.innerText = "Precio Compra:";

        let sellLabel = document.createElement("div");

        sellLabel.setAttribute(
            "class",
            "col-6 text-center"
        );
        sellLabel.innerText = "Precio Venta:";

        transactionLabel.appendChild(buyLabel);
        transactionLabel.appendChild(sellLabel);

        let transactionValue = document.createElement("div");

        transactionValue.setAttribute(
            "class",
            "row justify-content-md-center"
        );

        let buyValue = document.createElement("div");

        buyValue.setAttribute(
            "class",
            "col-6 text-center"
        );
        buyValue.style.fontSize = '120%';
        buyValue.style.padding = '5%';
        buyValue.innerText =
          isNaN(parseInt(divisa.compra))? "No Cotiza": `$${divisa.compra}`;

        let sellValue = document.createElement("div");

        sellValue.setAttribute(
            "class",
            "col-6 text-center"
        );
        sellValue.style.fontSize = '120%';
        sellValue.style.padding = '5%';
        sellValue.innerText = `$${divisa.venta}`;

        transactionValue.appendChild(buyValue);
        transactionValue.appendChild(sellValue);

        cardBody.appendChild(transactionLabel);
        cardBody.appendChild(transactionValue);

        let cardFooter = document.createElement("div");

        cardFooter.setAttribute(
            "class",
            "card-footer text-muted fs-6"
        );
        cardFooter.innerText = `última Actualización: ${date.getHours()}:${date.getMinutes()}hs`;

        card.appendChild(cardHeader);
        card.appendChild(cardBody);
        card.appendChild(cardFooter);

        col.appendChild(card)

        row.appendChild(col);
    }
}

function callAPI() {
    fetch('https://www.dolarsi.com/api/api.php?type=valoresprincipales')
        .then(response => response.json())
        .then(data => {
            createCards(data.filter(divisa => {
                return divisa.casa.nombre.toUpperCase().includes('DOLAR ') && !divisa.casa.nombre.toUpperCase().includes('SOJA');
            }).map(function(divisa) {
                let dato = {
                    nombre: divisa.casa.nombre,
                    compra: divisa.casa.compra,
                    venta: divisa.casa.venta
                }
                return dato;
            }))
        })
}

setInterval(() => {
    callAPI();
}, 120000);

callAPI();