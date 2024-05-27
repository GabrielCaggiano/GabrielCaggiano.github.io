const requestURL = 'https://byui-cit230.github.io/weather/data/towndata.json';

fetch(requestURL)
  .then(function (response) {
    return response.json();
  })
  .then(function (jsonObject) {
    console.table(jsonObject);  // temporary checking for valid response and data parsing

    const towns = jsonObject['towns'];
    for (let i = 0; i < towns.length; i++ ) {

      if (i == 6){
        let h3 = document.createElement('h3');
        let event1 = document.createElement('p');
        let event2 = document.createElement('p');
        let event3 = document.createElement('p');

        h3.textContent = "Upcoming Events"
        event1.textContent = towns[i].events[0];
        event2.textContent = towns[i].events[1];
        event3.textContent = towns[i].events[2];
      

        document.querySelector('div.events').appendChild(h3);
        document.querySelector('div.events').appendChild(event1);
        document.querySelector('div.events').appendChild(event2);
        document.querySelector('div.events').appendChild(event3);

      }

    }
    
  });