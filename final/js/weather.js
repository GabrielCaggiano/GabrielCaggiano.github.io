//Latitude: 40.3491173
//Longitude: -111.9046567 

//api call

weatherURL = 'https://api.openweathermap.org/data/2.5/onecall?lat=40.3491173&lon=-111.9046567&units=imperial&exclude=minutely,hourly&appid=961eddd3f168fd57de8e0076dcb9fdd8'

fetch(weatherURL)
  .then((response) => response.json())
  .then((jsObject) => {
    console.log(jsObject);

    document.getElementById('current-temp').textContent = " " + Math.round(jsObject.current.temp);
    document.getElementById('description').textContent = " " + jsObject.current.weather[0].description;
    document.getElementById('humidity').textContent = " " + Math.round(jsObject.current.humidity);

    let dayName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

    for (let i = 1; i <= 3; i++) {
            let date = new Date(jsObject.daily[i].dt * 1000);
            console.log(date.getDay()); //test

            document.getElementById("day" + i).innerHTML=dayName[date.getDay()];
            document.getElementById("forecastTemp" + i).innerHTML=Math.round(jsObject.daily[i].temp.day);
    }

    let alert_msg = document.createElement('section');
    let alert_close = document.createElement('span');

    alert_msg.className = "alert-msg";
    alert_close.className = "alert-close";

    if (jsObject.hasOwnProperty('alerts')) {

      alert_msg.textContent = "Look out!: " + jsObject.alerts.event;
      alert_close.textContent = "close";
      alert_close.setAttribute('onClick', "this.parentElement.style.display='none';");

      alert_msg.appendChild(alert_close);
      document.querySelector('div.alert').appendChild(alert_msg);

    }
     else {

      alert_msg.textContent = "No worries mate, no alerts found!";
      alert_close.textContent = "close";
      alert_close.setAttribute('onClick', "this.parentElement.style.display='none';");

      alert_msg.appendChild(alert_close);
      document.querySelector('div.alert').appendChild(alert_msg);
      
     }

    
});