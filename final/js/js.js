document.getElementById("assignment-last-modified").innerHTML = document.lastModified;
document.getElementById("copy-year").innerHTML = new Date().getFullYear();

function toggleMenu() {
    document.getElementsByClassName("navigation")[0].classList.toggle("responsive");
}

function joinUs() {
    location.href = "https://gabrielcaggiano.github.io/final/join.html";
}