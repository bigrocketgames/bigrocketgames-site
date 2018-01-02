document.addEventListener("turbolinks:load", function() {
  resetHeaderClasses();

  const path = window.location.pathname;

  switch(path) {
    case '/blog':
      $('.blog-link').addClass('active')
      break;

    default:
      $('.home-link').addClass('active')
      break;
  }

  function resetHeaderClasses(){
    $('.navbar-nav li').removeClass('active');
  }
});