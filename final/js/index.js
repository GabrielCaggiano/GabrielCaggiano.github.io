const requestURL = 'https://gabrielcaggiano.github.io/final/json/cards.json';

fetch(requestURL)
  .then(function (response) {
    return response.json();
  })
  .then(function (jsonObject) {
    console.table(jsonObject);  // temporary checking for valid response and data parsing

    const cards = jsonObject['cards'];
    for (let i = 0; i <= 2; i++ ) {

        let n = Math.floor((Math.random() * 7) + 1);

        let card = document.createElement('section');
        let name = document.createElement('h3');
        let motto = document.createElement('h4');
        let founded = document.createElement('p');
        let founder = document.createElement('p');
        let hq = document.createElement('p');
        let image = document.createElement('img');
        let url = document.createElement('p');

        card.className = "card_" + n;
        name.textContent = cards[n].name;
        motto.textContent = cards[n].motto;
        founded.textContent = "Founded in: " + cards[n].yearFounded;
        founder.textContent = "Population: " + cards[n].founder;
        hq.textContent = "Annual Rain Fall: " + cards[n].headquarters;
        url.textContent = "Website: " + cards[n].website;
        image.setAttribute('src', "/lesson9/images/" + cards[n].photo);
        image.setAttribute('alt', "photo of " + cards[n].name);

        card.appendChild(name);
        card.appendChild(motto);
        card.appendChild(founded);
        card.appendChild(founder);
        card.appendChild(hq);
        card.appendChild(url);

        document.querySelector('div.cards').appendChild(card);

      

    }
    
  });