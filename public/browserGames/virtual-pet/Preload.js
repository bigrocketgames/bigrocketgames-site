// JavaScript source code
var Preload = {

    //load the game assets before the game starts
    preload: function () {

        this.logo = this.add.sprite(this.game.world.centerX, this.game.world.centerY, 'logo');
        this.logo.anchor.setTo(0.5);

        this.preloadBar = this.add.sprite(this.game.world.centerX, this.game.world.centerY + 128, 'preloadBar');
        this.preloadBar.anchor.setTo(0.5);
        this.load.setPreloadSprite(this.preloadBar);

        this.load.image('backyard', '/browserGames/virtual-pet/images/backyard.png');
        this.load.image('apple', '/browserGames/virtual-pet/images/apple.png');
        this.load.image('candy', '/browserGames/virtual-pet/images/candy.png');
        this.load.image('rotate', '/browserGames/virtual-pet/images/rotate.png');
        this.load.image('toy', '/browserGames/virtual-pet/images/rubber_duck.png');
        this.load.image('arrow', '/browserGames/virtual-pet/images/arrow.png');

        this.load.spritesheet('pet', '/browserGames/virtual-pet/images/pet.png', 97, 83, 5, 1, 1);

    },

    create: function () {
        
        this.state.start('HomeState');
    }
};