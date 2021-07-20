const requestURL = 'https://gabrielcaggiano.github.io/final/json/cards.json';

fetch(requestURL)
  .then(function (response) {
    return response.json();
  })
  .then(function (jsonObject) {
    console.table(jsonObject);  // temporary checking for valid response and data parsing

    const cards = jsonObject['cards'];
    for (let i = 0; i < cards.length; i++ ) {

        let card = document.createElement('section');
        let name = document.createElement('h3');
        let motto = document.createElement('h4');
        let founded = document.createElement('p');
        let founder = document.createElement('p');
        let hq = document.createElement('p');
        let image = document.createElement('img');
        let url = document.createElement('a');

        card.className = "card";
        name.textContent = cards[i].name;
        motto.textContent = cards[i].motto;
        founded.textContent = "Founded in: " + cards[i].yearFounded;
        founder.textContent = "Founder: " + cards[i].founder;
        hq.textContent = "Headquarters: " + cards[i].headquarters;
        url.textContent = cards[i].website;
        url.setAttribute('href', cards[i].website);
        image.setAttribute('src', "/final/images/" + cards[i].photo);
        image.setAttribute('alt', "photo of " + cards[i].name);

        card.appendChild(name);
        card.appendChild(motto);
        card.appendChild(image);
        card.appendChild(founded);
        card.appendChild(founder);
        card.appendChild(hq);
        card.appendChild(url);

        document.querySelector('div.cards').appendChild(card);
        
    }
    
  });