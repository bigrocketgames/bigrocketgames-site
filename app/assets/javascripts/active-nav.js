document.addEventListener("turbolinks:load", function() {
  resetHeaderClasses();

  const path = window.location.pathname;
  // const pathFound = pathSearch(path);

  switch(path) {
    case '/about':
      $('.about-link').addClass('active')
      break;

    case '/contact':
      $('.contact-link').addClass('active')
      break;
      
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