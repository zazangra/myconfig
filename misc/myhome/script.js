document.onkeyup = (e) => {
  switch (e.keyCode) {
    case 89:
      //y
      window.open('https://www.youtube.com', '_blank');
      break;
    case 74:
      //j
      window.open('https://www.duckduckgo.com', '_blank');
      break;
    case 76:
      //l
      window.open('http://127.0.0.1', '_blank');
      break;
    case 77:
      //m
      window.open('https://elearning.unito.it/scienzeumanistiche/', '_blank');
      break;
    case 84:
      //t
      window.open(
        'https://mozilla.github.io/webrtc-landing/gum_test.html',
        '_blank'
      );
      break;
    case 71:
      //g
      window.open('https://github.com/', '_blank');
      break;
    case 85:
      // u
      window.open('https://www.udemy.com/', '_blank');
      break;
  }
};
