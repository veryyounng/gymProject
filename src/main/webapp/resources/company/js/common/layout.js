$(document).ready(function () {
    $('.example2').beefup({
        openSingle: true
    });

    var sw = true;
    $('.family button').click(function () {
        sw = !sw;

        if (sw == true) {
            $('.family .family_list').hide();
        } else {
            $('.family .family_list').show();
        }
    });

    $('.mapArea').find('.btnMap').on({
        mouseenter: function () {
            var thisId = $(this).attr('id');
            $('.mapArea').addClass(thisId);
        },
        mouseleave: function () {},
        mouseleave: function () {
            var thisId = $(this).attr('id');
            $('.mapArea').removeClass(thisId);
        },
        click: function () {
            var thisId = $(this).attr('id');
            $('.mapArea').addClass(thisId);
            $('select[name="s_s_local"]').val($(this).attr('alt')).closest("form").submit();
        }
    });
    $('.mapArea').find('.btnMap2').on({
        mouseenter: function () {
            var thisId = $(this).attr('id');
            $('.mapArea').addClass(thisId);
        },
        mouseleave: function () {},
        mouseleave: function () {
            var thisId = $(this).attr('id');
            $('.mapArea').removeClass(thisId);
        }
    });
    if($('img[usemap]').length > 0){
        $('img[usemap]').rwdImageMaps();
    }
    $('.business_bx').slick({
        autoplay: true,
    });
});