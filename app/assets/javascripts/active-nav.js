document.addEventListener("turbolinks:load", function() {
  resetHeaderClasses();

  const path = window.location.pathname;

  if (path.search("/about") > -1) {
    $('.about-link').addClass('active');
  } else if (path.search("/contact") > -1) {
    $('.contact-link').addClass('active');
  } else if (path.search("portfolio") > -1) {
    $('.portfolio-link').addClass('active');
  } else if (path.search("blog") > -1) {
    $('.blog-link').addClass('active');
  } else if (path.search("_games") > -1) {
    $('.games-link').addClass('active');
    findGame(path);
  } else {
    $('.home-link').addClass('active');
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