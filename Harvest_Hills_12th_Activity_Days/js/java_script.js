document.getElementById("assignment-last-modified").innerHTML = document.lastModified;
document.getElementById("copy-year").innerHTML = new Date().getFullYear();

function toggleMenu() {
    document.getElementsByClassName("navigation")[0].classList.toggle("responsive");
}