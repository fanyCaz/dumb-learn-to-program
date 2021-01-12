createCharacters = () =>{
    var canvas = document.getElementById("play-place");
    if(canvas.getContext){
        var ctx = canvas.getContext('2d');

        ctx.beginPath();
        ctx.arc(50,100,25,0,Math.PI*2);
        ctx.fill();

    }
}


window.onload = function () {
    createCharacters();
}


/*
*  CREATE CAT
*  CREATE DOG
*  USER CAN CHOOSE CHARACTER
*  MAKE DOG MOVE LEFT-RIGHT
*  MAKE DOG MOVE RIGHT-LEFT
*  MAKE CAT MOVE LIKE DOG
*  MAKE CAT MOVE UP AND GOES DOWN
*  THE NOT CHOOSED CHARACTER MOVES ARBITRARY
*/