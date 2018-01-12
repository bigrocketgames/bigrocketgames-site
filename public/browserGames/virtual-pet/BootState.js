// JavaScript source code
var BootState = {

    //initiate some game-level settings
    init: function () {
        //scaling options
        this.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL;
        this.scale.pageAlignHorizontally = true;
        this.scale.pageAlighnVertically = true;
        this.scale.maxHeight = window.innerHeight * 0.70;
        this.scale.maxWidth = this.scale.maxHeight * 0.5625;
    },

    preload: function ()
    {
        this.load.image('preloadBar', '/browserGames/virtual-pet/images/bar.png');
        this.load.image('logo', '/browserGames/virtual-pet/images/logo.png');
    },

    create: function()
    {
        //setting background color to white
        this.game.stage.backgroundColor = '#fff';

        this.state.start('Preload');
    }
};