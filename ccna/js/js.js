function showAnswers() {
    var x = document.getElementsByClassName("ans-hidden");
    var i;

    for (i = 0; i < x.length; i++){
        x[i].style.backgroundColor = "#1E1E24";
        x[i].style.color = "#FFBA08";
    }
}

function hideAnswers() {
    var x = document.getElementsByClassName("ans-hidden");
    var i;

    for (i = 0; i < x.length; i++){
        x[i].style.backgroundColor = "unset";
        x[i].style.color = "#1E1E24";
    }
}

function toggleDiv() {
    var x = document.getElementById("dikta1");
    var y = document.getElementById("selector1");
    if (x.style.display === "none") {
      x.style.display = "block";
      y.innerHTML = "&#x25b2;"
    } else {
      x.style.display = "none";
      y.innerHTML = "&#x25bc;"
    }
  }