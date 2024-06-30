// Client ID and API key from the Developer Console
const CLIENT_ID = 'YOUR_CLIENT_ID';
const API_KEY = 'AIzaSyCzI0FyVpjS290X8GrRSE7Urr5LeP_REVk';

// Array of API discovery doc URLs for APIs used by the quickstart
const DISCOVERY_DOCS = ["https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest"];

// Authorization scopes required by the API; multiple scopes can be included, separated by spaces.
const SCOPES = "https://www.googleapis.com/auth/calendar.readonly";

// On load, called to load the auth2 library and API client library.
function handleClientLoad() {
    gapi.load('client:auth2', initClient);
}

// Initializes the API client library and sets up sign-in state listeners.
function initClient() {
    gapi.client.init({
        apiKey: API_KEY,
        clientId: CLIENT_ID,
        discoveryDocs: DISCOVERY_DOCS,
        scope: SCOPES
    }).then(() => {
        listUpcomingEvents();
    });
}

// Fetch the upcoming events from the specific calendar
function listUpcomingEvents() {
    gapi.client.calendar.events.list({
        'calendarId': 'b0843586ac3cee42aca1e927c3d9d7e8539b6be1829c8b4c6e211152df0a0afb@group.calendar.google.com',
        'timeMin': (new Date()).toISOString(),
        'showDeleted': false,
        'singleEvents': true,
        'maxResults': 10,
        'orderBy': 'startTime'
    }).then(response => {
        const events = response.result.items;
        const eventsDiv = document.getElementById('events');

        if (events.length > 0) {
            for (let i = 0; i < events.length; i++) {
                const event = events[i];
                const when = event.start.dateTime || event.start.date;
                const eventDiv = document.createElement('div');
                eventDiv.className = 'event';
                eventDiv.innerHTML = `<strong>${event.summary}</strong><br>${when}`;
                eventsDiv.appendChild(eventDiv);
            }
        } else {
            eventsDiv.innerHTML = 'No upcoming events found.';
        }
    });
}

// Load the API client and auth2 library
handleClientLoad();
