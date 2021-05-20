$(function() {
    $('#slider-div').slick(
        {
            infinite: true,
            speed: 250,
            arrows: false,
            dots: true,
            autoplay: true,
            autoplaySpeed: 3000,
            pauseOnHover: true,
            vertical: false,
            draggable: false,
            dotClass: "slick-dots", 
        }
    );
});


$(function() {
    $('#product-slider').slick(
        {
            infinite: true,
            speed: 250,
            arrows: true,
            dots: true,
            autoplay: false,
            autoplaySpeed: 3000,
            pauseOnHover: true,
            vertical: false,
            draggable: true,
            dotClass: "slick-dots", 
            prevArrow: "<button type='button' class='slick-prev'>Previous</button>",
            nextArrow: "<button type='button' class='slick-next'>Next</button>",
        }
    );
});