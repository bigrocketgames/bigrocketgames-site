document.addEventListener("turbolinks:load", function() {
  footerTag = document.getElementsByTagName("footer");

  if (footerTag[0].offsetTop <  window.innerHeight)  {
    $('.footer').addClass('navbar-fixed-bottom')
  }
  
});