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


$(function() {
    $('.pw-check').focusout(function() {
        if($('#signup-pw').val() != $('#signup-pw__check').val()) {
            $('.text-pw').css('display', 'block');
            $('#signup-pw__check').val('');

            return false;
        }else {
            $('.text-pw').css('display', 'none');
        }
    });
});


$(function() {
    $('#signup-pw').focusout(function() {
        if(!/^[a-zA-Z0-9]{8,20}/.test($('#signup-pw').val())) {
            $('.text-pw__check').css('display', 'block');
            $('#signup-pw').val('');

            return false;
        }else {
            $('.text-pw__check').css('display', 'none');
        }
    });
});



$(function() {
    $('#signup-phonenum').focusout(function() {
        if(!/^\d{3}-\d{3,4}-\d{4}$/.test($('#signup-phonenum').val())) {
            $('.text-pn').css('display', 'block');
            $('#signup-phonenum').val('');

            return false;
        }else {
            $('.text-pn').css('display', none);
        }
    });
});




function addressApi() {
    new daum.Postcode({
        oncomplete: function(data) {
            let fullAddr = '';
            let extraAddr = '';

            if(data.userSelectedType === 'R') {
                fullAddr = data.roadAddress;
            }else {
                fullAddr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R') {
                if(data.bname !== '') {
                    extraAddr += data.bname;
                }

                if(data.buildingName !== '') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                fullAddr += (extraAddr !== '' ? ' (' + extraAddr +')' : '');
            }
            document.getElementById('signup-postcode').value = data.zonecode;
            document.getElementById('signup-address').value = fullAddr;
        }
    }).open();
}


