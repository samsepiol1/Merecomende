window.onload = () => {
    getDominantImageColor = ()=>{
        // get the image
        let sourceImage = document.querySelector("img");
        // get the background element
        let background = document.getElementsByTagName('body')[0];
        // initialize colorThief
        let colorThief = new ColorThief();
        // get color palette
        let color = colorThief.getColor(sourceImage);
        // set the background color
        background.style.backgroundColor = "rgb(" + color + ")";
    }
    getDominantImageColor();
    }