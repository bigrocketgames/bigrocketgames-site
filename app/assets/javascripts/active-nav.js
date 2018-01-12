document.addEventListener("turbolinks:load", function() {
  resetHeaderClasses();

  const path = window.location.pathname;
  const pathFound = pathSearch(path);

  if (path === "/about") {
    $('.about-link').addClass('active');
  } else if (path === "/contact") {
    $('.contact-link').addClass('active');
  } else if (pathFound === "portfolio") {
    $('.portfolio-link').addClass('active');
  } else if (pathFound === "blog") {
    $('.blog-link').addClass('active');
  } else if (pathFound === "mobile-games" || pathFound === "browser-games") {
    $('.games-link').addClass('active');
    findGame(path);
  } else {
    $('.home-link').addClass('active');
  }

  function pathSearch(path){

    if (path.search("/games/mobile_games") > -1) {
      return "mobile-games";
    } else if (path.search("/games/browser_games") > -1) {
      return "browser-games";
    } else if (path.search("/blog") > -1) {
      return "blog";
    } else if (path.search("/portfolio") > -1) {
      return "portfolio";
    }
  }

  function findGame(path) {
    if (path.split("/").length < 4) {
      return
    }
    const game = path.split("/")[3];
    const gameWords = game.split("-");
    let gameInitials = ''

    for (let i = 0; i < gameWords.length; i++) {
      gameInitials += (gameWords[i][0]);
    }

    const gameClass = `${gameInitials}-game-link`
    $(`.${gameClass}`).addClass('active');
  }

  function resetHeaderClasses(){
    $('.navbar-nav li').removeClass('active');
  }
});