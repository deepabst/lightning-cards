console.log("Play JS is on this page");

$('html').on('keyup', function (e) {
    // console.log(e.code);
    if (e.code == 'Space') {
        // flip card
        console.log("flip the card")
        $('.front').toggleClass('flipped');
        $('.back').toggleClass('flipped');
    }
    if (e.code == 'ArrowLeft') {
        // got it wrong
        console.log("toss the card to the left")
        if (typeof cardId !== 'undefined') {
            window.location = `/cards/${cardId}/confidence/-1`;
        }
    }
    if (e.code == 'ArrowRight') {
        // got it right
        console.log("toss the card to the right")
        if (typeof cardId !== 'undefined') {
            window.location = `/cards/${cardId}/confidence/1`;
        }
    }
    if (e.code == 'Escape') {
        // ESC
        console.log("exit game")
    }
});

$(document).ready(function () {
    $('.card').on('click', function (e) {
        $('.front').toggleClass('flipped');
        $('.back').toggleClass('flipped');
    });
});


console.log("End of PLay JS");