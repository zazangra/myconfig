//var key = e.which || e.keyCode;

document.onkeyup = function(e) {
  if (e.keyCode == 89) { //y
          window.open("https://www.youtube.com", "_blank");
  }

  else if (e.keyCode == 70){//f
          window.open("https://www.facebook.com", "_blank");
  }

  else if (e.keyCode == 74){//j
          window.open("https://www.duckduckgo.com", "_blank");
  }

  else if (e.keyCode == 76){//l
          window.open("http://127.0.0.1", "_blank");
  }

  else if (e.keyCode == 77){//m
          window.open("https://elearning.unito.it/scienzeumanistiche/", "_blank");
  }

  else if (e.keyCode == 84){//t
          window.open("https://mozilla.github.io/webrtc-landing/gum_test.html", "_blank");
  }

}
