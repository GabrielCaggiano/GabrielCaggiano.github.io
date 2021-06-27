const requestURL = 'https://byui-cit230.github.io/weather/data/towndata.json';

fetch(requestURL)
  .then(function (response) {
    return response.json();
  })
  .then(function (jsonObject) {
    console.table(jsonObject);  // temporary checking for valid response and data parsing

    const towns = jsonObject['towns'];
    for (let i = 0; i < towns.length; i++ ) {

      if (i == 0 || i == 2 || i == 6){
        let card = document.createElement('section');
        let name = document.createElement('h3');
        let motto = document.createElement('h4');
        let founded = document.createElement('p');
        let population = document.createElement('p');
        let rain = document.createElement('p');
        let image = document.createElement('img');

        card.className = "card_" + i;
        name.textContent = towns[i].name;
        motto.textContent = towns[i].motto;
        founded.textContent = "Founded in: " + towns[i].yearFounded;
        population.textContent = "Population: " + towns[i].currentPopulation;
        rain.textContent = "Annual Rain Fall: " + towns[i].averageRainfall;
        image.setAttribute('src', "/lesson9/images/" + towns[i].photo);
        image.setAttribute('alt', "photo of " + towns[i].name);

        card.appendChild(name);
        card.appendChild(motto);
        card.appendChild(founded);
        card.appendChild(population);
        card.appendChild(rain);
        card.appendChild(image);

        document.querySelector('div.cards').appendChild(card);

      }

    }
    
  });
