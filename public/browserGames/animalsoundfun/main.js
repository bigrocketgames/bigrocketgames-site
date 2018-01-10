// JavaScript source code

//this game will have only 1 state
var GameState =
    {
        //load the game assets before the game starts
        preload: function()
        {
            this.load.image("background", "../../wp-content/themes/bigrocket/game-assets/animalsoundfun/images/background.png");
            this.load.image("arrow", "../../wp-content/themes/bigrocket/game-assets/animalsoundfun/images/arrow.png");

            this.load.spritesheet("chicken", "../../wp-content/themes/bigrocket/game-assets/animalsoundfun/images/chicken_spritesheet.png", 131, 200, 3);
            this.load.spritesheet("horse", "../../wp-content/themes/bigrocket/game-assets/animalsoundfun/images/horse_spritesheet.png", 212, 200, 3);
            this.load.spritesheet("pig", "../../wp-content/themes/bigrocket/game-assets/animalsoundfun/images/pig_spritesheet.png", 297, 200, 3);
            this.load.spritesheet("sheep", "../../wp-content/themes/bigrocket/game-assets/animalsoundfun/images/sheep_spritesheet.png", 244, 200, 3);

            this.load.audio("chickenSound", ["../../wp-content/themes/bigrocket/game-assets/animalsoundfun/audio/chicken.ogg", "../../../wp-content/themes/bigrocket/game-assets/animalsoundfun/audio/chicken.mp3"]);
            this.load.audio("horseSound", ["../../wp-content/themes/bigrocket/game-assets/animalsoundfun/audio/horse.ogg", "../../../wp-content/themes/bigrocket/game-assets/animalsoundfun/audio/horse.mp3"]);
            this.load.audio("pigSound", ["../../wp-content/themes/bigrocket/game-assets/animalsoundfun/audio/pig.ogg", "../../../wp-content/themes/bigrocket/game-assets/animalsoundfun/audio/pig.mp3"]);
            this.load.audio("sheepSound", ["../../wp-content/themes/bigrocket/game-assets/animalsoundfun/audio/sheep.ogg", "../../../wp-content/themes/bigrocket/game-assets/animalsoundfun/audio/sheep.mp3"]);

        },

        //executed after everything is loaded
        create: function()
        {
            this.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL;
            this.scale.pageAlignHorizontally = true;
            this.scale.pageAlignVertically = true;
            this.scale.maxWidth = window.innerWidth * 0.60;
            this.scale.maxHeight = this.scale.maxWidth * 0.5625;
            this.background = this.game.add.sprite(0, 0, "background");

            //group for animals
            var animalData =
                [
                    { key: "chicken", text: "CHICKEN", audio: "chickenSound"},
                    { key: "horse", text: "HORSE", audio: "horseSound"},
                    { key: "pig", text: "PIG", audio: "pigSound" },
                    { key: "sheep", text: "SHEEP", audio: "sheepSound" }
                ];

            this.animals = this.game.add.group();

            var self = this;
            var animal;

            animalData.forEach(function(element){
                animal = self.animals.create(-1000, self.game.world.centerY, element.key, 1);
                animal.anchor.setTo(0.5);
                animal.customParams = { text: element.text, sound: self.game.add.audio(element.audio) };

                animal.animations.add("animate", [0,1,2,1,0,1], 3, false);

                animal.inputEnabled = true;
                animal.input.pixelPerfectClick = true;
                animal.events.onInputDown.add(self.animateAnimal, self);

            });

            this.currentAnimal = this.animals.next();
            this.currentAnimal.position.set(this.game.world.centerX, this.game.world.centerY);

            this.showText(this.currentAnimal);

            //left arrow
            this.leftArrow = this.game.add.sprite(60, this.game.world.centerY, "arrow");
            this.leftArrow.anchor.setTo(0.5);
            this.leftArrow.scale.x = -1;
            this.leftArrow.customParams = { direction: -1 };

            //left arrow allow user input
            this.leftArrow.inputEnabled = true;
            this.leftArrow.input.pixelPerfectClick = true;
            this.leftArrow.events.onInputDown.add(this.switchAnimal, this);

            //right arrow
            this.rightArrow = this.game.add.sprite(580, this.game.world.centerY, "arrow");
            this.rightArrow.anchor.setTo(0.5);
            this.rightArrow.customParams = { direction: 1 };

            //right arrow allow user input
            this.rightArrow.inputEnabled = true;
            this.rightArrow.input.pixelPerfectClick = true;
            this.rightArrow.events.onInputDown.add(this.switchAnimal, this);

            //this.chicken = this.game.add.sprite(this.game.world.centerX, this.game.world.centerY, "chicken");
            //this.chicken.anchor.setTo(0.5, 0.5);

            //enable user input on sprite
            

            //you can flip an image by setting a scale property to a negative (x flips horizontal, y flips vertical);
            //this.chicken.scale.x = -1;

            //rotating a sprite - this is done around the anchor point
            //this.chicken.angle = -45;
        },

        //this is executed multiple times per second
        update: function()
        {

        },

        switchAnimal: function (sprite, event)
        {
            if (this.isMoving)
            {
                return false;
            }
            
            this.isMoving = true;

            //hide text
            this.animalText.visible = false;

            var newAnimal, endX;

            //get the direction of the arrow and bring new animal from that direction
            if(sprite.customParams.direction > 0)
            {
                newAnimal = this.animals.next();
                newAnimal.x = -newAnimal.width / 2;
                endX = 640 + this.currentAnimal.width / 2;
            }
            else
            {
                newAnimal = this.animals.previous();
                newAnimal.x = 640 + newAnimal.width / 2;
                endX = -this.currentAnimal.width / 2;
            }

            //get the next animal and move it onto the screen to replace the old animal
            var newAnimalMovement = game.add.tween(newAnimal);
            newAnimalMovement.to({ x: this.game.world.centerX }, 1000);
            newAnimalMovement.onComplete.add(function ()
            {
                this.isMoving = false;
                this.showText(newAnimal);
            }, this);
            newAnimalMovement.start();

            //get final destination of current animal and move to it
            var currentAnimalMovement = this.game.add.tween(this.currentAnimal);
            currentAnimalMovement.to({ x: endX }, 1000);
            currentAnimalMovement.start();

            //set the next animal as the new current animal
            this.currentAnimal = newAnimal;

        },

        showText: function(animal)
        {
            
            if(!this.animalText)
            {
                var style =
                {
                    font: "bold 30pt Arial",
                    fill: "#D0171B",
                    align: "center"
                }
                this.animalText = this.game.add.text(this.game.width/2, this.game.height * 0.85, "", style);
                this.animalText.anchor.setTo(0.5);
            }

            this.animalText.setText(animal.customParams.text);
            this.animalText.visible = true;
        },

        animateAnimal: function (sprite, event) {
            sprite.play("animate");
            sprite.customParams.sound.play();
            
        },
        
    }

//initiate the Phaser framework
var game = new Phaser.Game(640, 360);

game.state.add("GameState", GameState);
game.state.start("GameState");