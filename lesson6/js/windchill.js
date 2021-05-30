

const chill = document.getElementById('wind-chill');
const speed = document.getElementById('speed');
const temp  = document.getElementById('temp');

const t = parseFloat(temp.value);
const s = parseFloat(speed.value);

if (t <= 50 && s >=3) {
    chill.textContent = Math.round((35.74 + (0.6215 * t) - (35.75 * (s ** 0.16)) + 0.4275 * t * (s ** 0.16)) * 100) / 100;
}

else {
    chill.textContent = 'N/A';
}

