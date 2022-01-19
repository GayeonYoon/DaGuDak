/* Define Background Class */
function Background(assets,canvasElement){
   this.assets = assets; 
   this.canvasSize = {width: canvasElement.width, height: canvasElement.height}; //Canvas Size
   this.canvasContext = canvasElement.getContext('2d');         //Canvas Context
   this.canvasContext.fillStyle = "c0e2f1";
   this.spritesX = [];
   for(var i = 0; i < assets.length; i++){
      this.spritesX.push(0);
   }
}
 

Background.prototype.startAnimation = function(){ 
 //Clear Canvas  
 this.canvasContext.clearRect(0, 0, this.canvasSize.width, this.canvasSize.height);
 
 for(var i = 0; i < this.assets.length; i++){  
  //Draw Background Image
  var drawX = this.spritesX[i] * this.assets[i].bgImage.width;
  var drawWidth = this.assets[i].bgImage.width - drawX;
  this.canvasContext.drawImage(this.assets[i].bgImage,

                   drawX, 0, drawWidth, this.assets[i].bgImage.height,

                   0, 0, drawWidth, this.assets[i].bgImage.height);     
         
  //Fill Cut Out area     
  if(drawWidth < this.assets[i].bgImage.width) {
    var fillDrawWidth = this.assets[i].bgImage.width - drawWidth;
    this.canvasContext.drawImage(this.assets[i].bgImage,

                    0, 0, fillDrawWidth, this.assets[i].bgImage.height,

                    drawWidth, 0, fillDrawWidth, this.assets[i].bgImage.height);
  }      
 
  this.spritesX[i] = (this.spritesX[i] + this.assets[i].spritesRate) % 1;   
 } 
}


var fps = 60;                           //frame per second
var background;                        //Character Instance
var canvasElement;                    //Canvas Element
var assetfiles;                            //Asset Image File Array
var assets = [];                        //Custom Asset Object Array  
var currentAssetLoadCount = 0;  //Asset Image File Load Count  
 

function init(){ 
 canvasElement = document.getElementById("GameCanvas"); 
 

 //Define Asset Image File Array
 assetfiles = ['/DaGuDak/resources/images/racing/background/bgImg.png', '/DaGuDak/resources/images/racing/background/crowd2.png','/DaGuDak/resources/images/racing/background/track.png'];
 
 //Create Custom Literal Object(Define spritesRate Property) & Insert into Asset Image Array
 assets.push({spritesRate: 0.002});
 assets.push({spritesRate: 0.008});
 assets.push({spritesRate: 0.016});
  
 for (var i = 0; i < assetfiles.length; i++) {
    //Create Asset Image Ojbect
    var asset = new Image(); 
    asset.src = assetfiles[i];     
  
    //Assign Asset Image Object to the bgImage property that newly created
    assets[i].bgImage = asset;    
      
    //Assign Imgae Load Event
    asset.onload = onAssetLoadComplete;      
  }     
}

function onAssetLoadComplete(){ 
   //Check Load Complete of All Images
   if(++currentAssetLoadCount >= assetfiles.length){ 
     //Create Character Instance    
     background = new Background(assets,canvasElement);
     //Run Game Loop     
     setInterval(animationLoop, 1000 / fps);   
 } 
}




function scaleToFill(img){
   canvas = document.getElementById("GameCanvas"); 
   
    // get the scale
    var scale = Math.max(canvas.width / img.width, canvas.height / img.height);
    // get the top left position of the image
    var x = (canvas.width / 2) - (img.width / 2) * scale;
    var y = (canvas.height / 2) - (img.height / 2) * scale;
    ctx.drawImage(img, x, y, img.width * scale, img.height * scale);
}


function animationLoop(){
      background.startAnimation();
   }
   window.addEventListener("load", init, false);