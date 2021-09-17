const cityCode = document.querySelector('#zipcode');
const cityName = [];
const cityValue = document.querySelector('#city');
cityCode.addEventListener('mouseout', (e) => {
    if (cityCode.value.length === 5) {
        checkCity(cityCode.value);
    }
});

async function checkCity(location) {
    console.log(location);
    const cityList = await fetch('https://geo.api.gouv.fr/communes?codePostal=' + location)
        .then(resultat => resultat.json())
        .then(json => json.forEach(nom => cityName.push(nom.nom)))
        .catch(err => handleError(err));
    updateSelectCity(cityName);
}

function updateSelectCity(data) {
    data.forEach(nom => {
        optionList = new Option(nom, nom, true, true);
        console.log(cityValue.options);
        cityValue.options[cityValue.options.length] = optionList;
        optionList.reset();
        console.log(optionList);
    });
    // cityValue.options[0];
}

function handleError(err) {
    console.error(err);
}