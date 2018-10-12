// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 1500 || document.documentElement.scrollTop > 1500) {
    document.getElementById("scroll-top").style.display = "block";
  } else {
    document.getElementById("scroll-top").style.display = "none";
  }
}