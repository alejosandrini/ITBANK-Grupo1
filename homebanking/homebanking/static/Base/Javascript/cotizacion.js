function createCards(data) {
    let row = document.getElementById('cotizaciones');

    row.innerHTML = "";

    let date = new Date();

    for (let divisa of data) {
        console.log(divisa)
        let col = document.createElement("div");

        col.setAttribute(
            "class",
            "col col-12 col-lg-6"
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
        cardHeader.style.fontSize = '80%';
        cardHeader.innerHTML = `<span class="fa fa-money" style="color:white;"></span> ${divisa.nombre}`;

        let cardBody = document.createElement("div");

        let transactionLabel = document.createElement("div");

        transactionLabel.setAttribute(
            "class",
            "row justify-content-center w-100 gx-1"
        );

        let buyLabel = document.createElement("div");

        buyLabel.setAttribute(
            "class",
            "col-6 text-center mx-auto"
        );
        buyLabel.innerText = "Compra:";

        let sellLabel = document.createElement("div");

        sellLabel.setAttribute(
            "class",
            "col-6 text-center mx-auto"
        );
        sellLabel.innerText = "Venta:";

        transactionLabel.appendChild(buyLabel);
        transactionLabel.appendChild(sellLabel);

        let transactionValue = document.createElement("div");

        transactionValue.setAttribute(
            "class",
            "row justify-content-center"
        );

        let buyValue = document.createElement("div");

        buyValue.setAttribute(
            "class",
            "col-6 text-center"
        );
        buyValue.style.fontSize = '120%';
        buyValue.style.padding = '5%';
        buyValue.innerText =
          isNaN(parseInt(divisa.compra))? "No Cotiza": `$${divisa.compra.substring(0, divisa.compra.indexOf(',')+3)}`;

        let sellValue = document.createElement("div");

        sellValue.setAttribute(
            "class",
            "col-6 text-center"
        );
        sellValue.style.fontSize = '120%';
        sellValue.style.padding = '5%';
        sellValue.innerText = `$${divisa.venta.substring(0, divisa.venta.indexOf(',')+3)}`;

        transactionValue.appendChild(buyValue);
        transactionValue.appendChild(sellValue);

        cardBody.appendChild(transactionLabel);
        cardBody.appendChild(transactionValue);

        let cardFooter = document.createElement("div");

        cardFooter.setAttribute(
            "class",
            "card-footer text-muted fs-6 text-center"
        );
        cardFooter.innerText = `Actualizado: ${date.getHours()}:${date.getMinutes()}hs`;

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