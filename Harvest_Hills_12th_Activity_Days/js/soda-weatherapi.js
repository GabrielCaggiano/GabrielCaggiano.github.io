const weatherURL = "https://api.openweathermap.org/data/2.5/weather?id=5607916&units=imperial&appid=961eddd3f168fd57de8e0076dcb9fdd8";

const forecastURL = "https://api.openweathermap.org/data/2.5/forecast?id=5607916&units=imperial&appid=961eddd3f168fd57de8e0076dcb9fdd8";

fetch(weatherURL)
  .then((response) => response.json())
  .then((jsObject) => {
    console.log(jsObject);

    document.getElementById('current-temp').textContent = " " + Math.round(jsObject.main.temp);
    document.getElementById('description').textContent = " " + jsObject.weather[0].description;
    document.getElementById('high-temp').textContent = " " + Math.round(jsObject.main.temp_max);
    document.getElementById('humidity').textContent = " " + Math.round(jsObject.main.humidity);
    document.getElementById('speed').textContent = " " + Math.round(jsObject.wind.speed) + " ";
  });

  fetch(forecastURL)
  .then((response) => response.json())
  .then((jsObject) => {
    console.log(jsObject);

    //create array
    let fiveDay = [];
    //j is an item being added to the array
    let j = 0;
    for(let i = 0; i < jsObject.list.length; i++) {
        if(jsObject.list[i].dt_txt.includes("18:00:00")) {
            fiveDay[j] = jsObject.list[i];
            j++;
        }

    }
    //test array is filling correctly
    console.log(fiveDay);

    const table = document.getElementById("5day");
    const tr = document.createElement("tr");
    let lastChild = document.getElementById("5dayTemp");
    
    for(let i = 0; i < fiveDay.length; i++) {

        let td = document.createElement('td');
        let img = document.createElement('img');

        img.setAttribute('src', 'https://openweathermap.org/img/w/' + fiveDay[i].weather[0].icon + '.png');
        img.setAttribute('alt', fiveDay[i].weather[0].description);

        td.appendChild(img);

        tr.appendChild(td);

        table.insertBefore(tr, lastChild);


        document.getElementById(`5dayTemp${i + 1}`).textContent = Math.round(fiveDay[i].main.temp);
    }
    
  });


