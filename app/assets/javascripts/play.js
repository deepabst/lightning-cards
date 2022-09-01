console.log("Play JS is on this page");

$('html').on('keyup', function (e) {
    // console.log(e.code);
    if (e.code == 'Space') {
        // flip card
        console.log("flip the card")
    }
    if (e.code == 'ArrowLeft') {
        // got it wrong
        console.log("toss the card to the left")
    }
    if (e.code == 'ArrowRight') {
        // got it right
        console.log("toss the card to the right")
    }
    if (e.code == 'Escape') {
        // ESC
        console.log("exit game")
    }
});


console.log("End of PLay JS");