document.getElementById("assignment-last-modified").innerHTML = document.lastModified;
document.getElementById("copy-year").innerHTML = new Date().getFullYear();

function toggleMenu() {
    
    document.getElementById("primaryNav").classList.toggle("hide");
   }