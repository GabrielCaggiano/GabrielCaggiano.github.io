function getDifferenceOfDays(start, end) {
    const date1 = new Date(start); 
    const date2 = new Date(end);
    const oneDay = 86400000;
    const diffInTime = date2.getTime() - date1.getTime();
    const diffInDays = Math.round(diffInTime / oneDay);
    return diffInDays;
}

if(!localStorage.getItem('date')) {
    storeDate();
  } else {
    setDate();
  }

function storeDate() {
    localStorage.setItem('date', new Date());
    setDate();
}

function setDate() {
    var last_visited = localStorage.getItem('date'); 
    var current_date = new Date()
    document.getElementById('days').textContent = " " + getDifferenceOfDays(last_visited, current_date)
    localStorage.setItem('date', new Date());
}