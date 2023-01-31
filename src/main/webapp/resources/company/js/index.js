(function($) {
	$.fn.queued = function() {
		var self = this;
		var func = arguments[0];
		var args = [].slice.call(arguments, 1);
		return this.queue(function() {
			$.fn[func].apply(self, args).dequeue();
		});
	}
}(jQuery));


$(function () {
	var playing = false;
	var winW;
	var winH;
	var $sectionWrap = $(".sectionWrap");
	var $section = $(".section");
	var sectionActive = 0;
	var footHeight;
	if($section.width() <= 720) {
		$('body').addClass('mo')
	}else if($section.width() > 720 && $section.width() <= 1100 ) {
		// topBannInit()
		$('body').removeClass('mo')
		$('body').addClass('tablet');
	}else if($section.width() > 1100 ) {
		// topBannInit()
		$('body').removeClass('mo')
		$('body').removeClass('tablet');
	};


	resize(true);
	init();
	gnb();
	var resizeTiming;
	$(window).resize(function () {
		if($section.width() <= 720) {
			$('body').addClass('mo')
			$(".header").stop().animate({ top: 0}, {
				duration: 500,
				easing: "easeInOutCubic"
			});
			$('.mainStep').stop().animate({top:0},300)
		}else if($section.width() > 720 && $section.width() <= 1100 ) {
			// topBannInit()
			$('body').removeClass('mo')
			$('body').addClass('tablet');
			$(".header").stop().animate({ top: 0}, {
				duration: 500,
				easing: "easeInOutCubic"
			});
			$('.mainStep').stop().animate({top:0},300)
		}else if($section.width() > 1100 ) {
			// topBannInit()
			$('body').removeClass('mo')
			$('body').removeClass('tablet');
			
		};
		//clearTimeout(resizeTiming);
		//resizeTiming = setTimeout(function () {
							//	resize();
		//}, 10);
		resize();
	});

	function init() {
		var sectionMany = $section.length - 1;
		$(document).mousewheel(function (event, delta) {
			if ( !$('body').is('.mo') && !$('body').is('.tablet')) {
				if (!playing && !$("body").hasClass("dim")) {
					playing = true;
					if (delta == -1) {
						if (sectionActive < sectionMany) {
							sectionActive = sectionActive + 1;
						} else {
							setTimeout(function () {
								playing = false;
							}, 100)
							return;
						}
					}
					if (delta == 1) {
						if (sectionActive == 0) {
							setTimeout(function () {
								playing = false;
							}, 100)
							return;
						} else {
							sectionActive = sectionActive - 1;
						}
					}
					$(".btn_event_close").click();
					sectionAnimating(sectionActive, 700);
				}
			}
		});
		$(".mainStep ul li a").click(function (e) {
			e.preventDefault();
			var idx = $(this).closest("li").index();
			sectionAnimating(idx, 700);
			var focusItem = setTimeout(function () {
				$('.section').eq(idx).focus()
			}, 750);
		})
		
		$(".btn_main_down").click(function (e) {
			e.preventDefault();
			if (sectionActive < sectionMany) {
				sectionAnimating(sectionActive + 1, 700);
			}
		})
		$(".btn_main_up").click(function (e) {
			e.preventDefault();
			if (sectionActive != 0) {
				sectionAnimating(sectionActive - 1, 700);
			}
		})
		$(".btn_main_top").click(function (e) {
			e.preventDefault();
			sectionAnimating(0, 700);
		})
		$(".btnAllmenu").click(function (e) {
			if ( !$('body').is('.mo')){
				sectionAnimating(0, 700);
			}
		})

		sectionAnimating(0, 0);
	}
	var endChk = false;
	//�뱀뀡 ��吏곸씪�� 紐⑥뀡 �쒖뼱
	function sectionAnimating(active, speed) {
		//�좊え�섏떆 �대깽�� �リ린
		//怨듯넻 紐⑥뀡
		
		
		sectionActive = active;
		$(".section").eq(active).focusin(function(){
			sectionActive = $(this).index();
		})
		if (sectionActive != 2) {
			$(".mainWrap").attr("class", "mainWrap section" + (sectionActive));
		}
		$(".sectionWrap").attr("class", "sectionWrap section" + (sectionActive));
		$(".mainStep a").blur();
		$section.css("z-index", 9);
		$section.eq(active).css("z-index", 10).addClass("active");
		var top = -winH * active;
		if (sectionActive < 3) {
			
			
		}else {
			top = -((winH * (active - 1)) + footHeight);

		}


		if (sectionActive !== 3) {
			if(endChk === false) {
				$(".section").find('.appear-animation').delay(600).queue(function(remove) {
					$(".section").removeClass("motion");
					$(this).removeClass("fadeInUp");
					remove();
				});
			}
			endChk = false;
		} else {
			endChk = true;
		}
		
		$(".sectionWrap").stop().animate({ top: top }, {
			duration: speed,
			easing: "easeInOutCubic",
			complete: function () {
				playing = false;
				$(".section").filter(function (index) {
					return index != active;
				}).removeClass("active");
				if (sectionActive == 2) {
					$(".mainWrap").attr("class", "mainWrap section" + (sectionActive));
				}
				if (!$("html").hasClass("htmlInit")) {
					$("html").addClass("htmlInit");
					resize(true);
				} else {
					resize();
				}
				if (sectionActive == 0) {
					$(".mainStep").addClass('step01');
				} else {
					$(".mainStep").removeClass('step01');
				}
				if (sectionActive < 3) {
					$(".mainStep li").removeClass("on").eq(active).addClass("on");
				}

				if(!$(".section").eq(active).hasClass("motion")) {
					$(".section").eq(active).addClass('on')
					$(".section").eq(active).find('.appear-animation').each(function(index, el) {
						$(el).delay(index * 250).queue(function(next) {
							$(this).addClass("fadeInUp");
							next();
						});
					});
				}
			}

		});
		if (sectionActive == 0) {
			if(!$("body").is('.tablet') && !$("body").is('.mo')) {
				$(".topMenuWrap").stop().slideDown({
					duration: 500,
					easing: "easeInOutCubic"
				});
				$(".mainStep").show().stop().animate({ right: "50%", opacity: 1 }, {
					duration: 1000,
					easing: "easeInOutCubic"
				});
				$('.gnbWrapBg').removeClass('init');
			}
			 
			
			
		} else {
			if(!$("body").is('.tablet') && !$("body").is('.mo')) {
				$(".topMenuWrap").stop().slideUp({
					duration: 500,
					easing: "easeInOutCubic"
				});
				$(".mainStep").show().stop().animate({ right: "50%", opacity: 1 }, {
					duration: 1000,
					easing: "easeInOutCubic"
				});
				$('.gnbWrapBg').addClass('init');
			}
		}

		
	}

	$(".section").on({
		focusin: function (e) {
			e.preventDefault();
			var idx = $(this).index();
			sectionAnimating(idx, 0);
		}
	})

	function resize(first) {
		if ( !$('body').is('.mo') && !$('body').is('.tablet')) {
			winH = $(window).height();
			if (winH <= 680) {
				winH = 680;
			}

			$('.section.section02 .sectionCon').css({height:winH})
			$('.section.section02 .sectionCon .sec02Cont img').css({height:winH, width: $(window).width() / 3})

			if (sectionActive != 0) {
				// $(".header").stop().animate({ top: -108 }, {
					// duration: 500,
					// easing: "easeInOutCubic"
				// });
				$(".header").addClass('header_on');
				$('.mainStep').stop().animate({top:0},300)
				$('.gnbWrapBg').addClass('init');
				$(".mainStep").addClass('step01');
				$('.mainStep').stop().animate({top:0, height:"100%"},400, "easeInOutCubic")
			} else {
				$(".header").stop().animate({ top: 0 }, {
					duration: 500,
					easing: "easeInOutCubic"
				});
				$(".header").removeClass('header_on');
				$('.gnbWrapBg').removeClass('init');
				$('.mainStep').stop().animate({top:0, height:"100%"},500, "easeInOutCubic")
			}
			var many = $section.length;
			var top = -winH * sectionActive;
			footHeight = $('.footerArea').height();
			if (sectionActive == 3) {
				top = -((winH * (sectionActive - 1)) + footHeight);
				$(".mainStep li").removeClass("on");

			}
			$(".sectionWrap").css({ top: top });
			if ($(".topEventWrap").css("display") == "block") {
				$(".mainWrap").css({ height: $(window).height() - 127, "top": 127 });
				$(".section").css({ height: $(window).height() - 127 });
			} else {
				$(".section, .mainWrap").css({ height: winH });
			}
		} else {
			$('.section.section02 .sectionCon').css({height:"auto"})
			$('.section.section02 .sectionCon .sec02Cont img').css({height:"auto", width: "100%"})
		}
		
	}
})
$(function() {
	(function() {
		var height = jQuery('.base-height').height();
		function heightInit() {
			height = jQuery('.base-height').height();
			if(height < 800) {
				jQuery('.mainVisual').height(800);
			} else {
				jQuery('.mainVisual').height(height);
			}			
		}
		heightInit();
		jQuery(window).resize(function() {
			heightInit();
		});
	})(jQuery);
});

$(function () {
	var playing = false;
	var winW;
	var winH;
	var $sectionWrap = $(".sectionWrap");
	var $section = $(".section");
	var sectionActive = 0;
	var footHeight;
	if($section.width() <= 720) {
		$('body').addClass('mo')
	}else if($section.width() > 720 && $section.width() <= 1100 ) {
		$('body').removeClass('mo')
		$('body').addClass('tablet');
	}else if($section.width() > 1100 ) {
		$('body').removeClass('mo')
		$('body').removeClass('tablet');
	};

	gnb();
	$(window).resize(function () {
		if($section.width() <= 720) {
			$('body').addClass('mo')
			$('body').removeClass('tablet');
		}else if($section.width() > 720 && $section.width() <= 1100 ) {
			$('body').removeClass('mo')
			$('body').addClass('tablet');
		}else if($section.width() > 1100 ) {
			$('body').removeClass('mo')
			$('body').removeClass('tablet');
		};
	});
	var fixMode;
	var tipBarFix;
	var chkFix;
	var doc = $(document);
	var win = $(window);
	var top;

	var lastId,
		stickyNav = $(".mainStep"),
		stickyNavHeight = stickyNav.outerHeight()+1,
		menuItems = stickyNav.find("ul a"),
		scrollItems = menuItems.map(function(){
			var item = $($(this).attr("href"));
			if (item.length) { return item; }
		});
	var checkFloating = function() {
		var fromTop = getScrollOffsets().top+stickyNavHeight;
		var cur = scrollItems.map(function(){
			if ($(this).offset().top < fromTop - ($(window).outerHeight() / 3))
			return this;
		});
		cur = cur[cur.length-1];
		var id = cur && cur.length ? cur[0].id : "";
		if (lastId !== id) {
			lastId = id;
			menuItems
			.parent().removeClass("on")
			.end().filter("[href=#"+id+"]").parent().addClass("on");
		}
	};

	var getScrollOffsets = function() {
		return {
			'left': window.pageXOffset || document.documentElement.scrollLeft || document.body.scrollLeft,
			'top': window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop
		};
	};
	var getWindowSize = function() {
		var w = (window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth || 1003) - 2,
			h = (window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight || 650) - 2;
		return {
			"width": w,
			"height": h
		};
	};

	function targetMove (target, gutter) {
		$('html, body').animate({ 
			scrollTop: $(target).offset().top - gutter 
		}, 500, function() {

		});
	}

	win.scroll(checkFloating);
	checkFloating();

	$(".mainStep ul li a").click(function (e) {
		e.preventDefault();
		$(".mainStep ul li").removeClass('on');
		$(this).parent().addClass('on');
		var target = $(this).attr('href');
		targetMove(target, 0);
	})


	$('.mainVisual .slider.responsive').on('init', function(event, slick){
		$('.slider .slick-active').find('.motion').each(function(index, el) {
			 $(el).delay(index*350).queued('addClass', 'on');
		});
	});

	$('.mainVisual .slider.responsive').slick({
		fade: true,
		autoplay: true,
		autoplaySpeed: 4000,
		speed: 1000,
		pauseOnHover : false,
		pauseOnFocus : false,
		 dots: true,
		  arrows: true,
	});

	$('.mainVisual .sliderButtons').find('.sliderPrev').on('click', function(event) {
		$('.mainVisual>div>button.slick-prev').trigger('click');
	});

	$('.mainVisual .sliderButtons').find('.sliderNext').on('click', function(event) {
		$('.mainVisual>div>button.slick-next').trigger('click');
	});
	

	$('.mo_slider_wrap .sliderButtons1').find('.sliderPrev1').on('click', function(event) {
		$('.mo_slider_wrap .slick-prev').trigger('click');
	});

	$('.mo_slider_wrap .sliderButtons1').find('.sliderNext1').on('click', function(event) {
		$('.mo_slider_wrap .slick-next').trigger('click');
	});
	
	$('.chueo_slider_wrap .sliderButtons1').find('.sliderPrev1').on('click', function(event) {
		$('.chueo_slider_wrap .slick-prev').trigger('click');
	});

	$('.chueo_slider_wrap .sliderButtons1').find('.sliderNext1').on('click', function(event) {
		$('.chueo_slider_wrap .slick-next').trigger('click');
	});



	$('.mainVisual .slider.responsive').on('beforeChange', function(event, slick, currentSlide, nextSlide){
		$('.slider .slick-active').find('.motion').each(function(index, el) {
			 $(el).delay(index*100).queued('removeClass', 'on');
		});
	});


	$('.mainVisual .slider.responsive').on('afterChange', function(event, slick, currentSlide, nextSlide){
		$('.slider .slick-active').find('.motion').each(function(index, el) {
			 $(el).delay(index*350).queued('addClass', 'on');
		});
	});
	

})

$(document).ready(function(){
  $('.chueo_slider').slick({
  	
  	pauseOnHover : false,
	pauseOnFocus : false,
	responsive: [
    
    {
      breakpoint: 765,
      settings: {
      
        dots: true
      }
    }
    // You can unslick at a given breakpoint now by adding:
    // settings: "unslick"
    // instead of a settings object
  ]
  });
});

$(document).ready(function(){
  $('.mo_slider').slick({
  	
  	pauseOnHover : false,
	pauseOnFocus : false
  });
});
$(document).ready(function(){
  $('.sec3_slider').slick({
  	
  	pauseOnHover : false,
	pauseOnFocus : false,
	dots: true
  });
});
	
$(document).ready(function(){
  $('.sec02_li').slick({
  	pauseOnHover : false,
	pauseOnFocus : false,
  	  slidesToShow: 4,
  slidesToScroll: 4,
	responsive: [
    {
      breakpoint: 1024,
      settings: {
        slidesToShow: 4,
        slidesToScroll: 4,
        
      }
    },
    {
      breakpoint: 765,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2,
        infinite: true,
        dots: true
      }
    }
    // You can unslick at a given breakpoint now by adding:
    // settings: "unslick"
    // instead of a settings object
  ]
  });
});					

function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}


function myFunction2() {
    document.getElementById("myDropdown2").classList.toggle("show");
}

	        
// $(function(){
	     // $(".sub_menu_wrap").hide();
	        // $("ul.menu").hover(function(){
		    // $(".sub_menu_wrap").show();
// 				  
//                
			// },
			// function(){
			   // $(".sub_menu_wrap").hide();
// 				
//                
//                  
			// });
// });	

$(function(){
	     $(".sub_menu_wrap").hide();
	        $("ul.menu li").hover(function(){
		    $(".sub_menu_wrap:not(:animated)",this).show();
				  $(this).find(".menu_top").addClass("menu_top_sel");
               
			},
			function(){
			   $(".sub_menu_wrap",this).hide();
				 $(this).find(".menu_top").removeClass("menu_top_sel");
               
                 
			});
});	
 
 
 

//$(function(){
// $(".sub_bar_con").hide();
//    $("ul.bar_menu li").hover(function(){
 //   $(".sub_bar_con:not(:animated)",this).show();
//		 
//	},
//	function(){
//	   $(".sub_bar_con",this).hide();
//		
 //        
//	});
// 20201201});	



 $(function(){
    //resize: 브라우저 창 너비의 변경된 값을 width 변수에 저장
    $(window).resize(function () {
        var width = $(window).width();
        if (width>768) {
        	$(".sub_bar_con").hide();
    $("ul.bar_menu li").hover(function(){
    $(".sub_bar_con:not(:animated)",this).show();
		 
	},
	function(){
	   $(".sub_bar_con",this).hide();
		
         
	});
	
	
        	
        } else  if (width<768) {
            $(".sub_bar_con").hide();
        	$("ul.bar_menu li").click(function(){
		    $(this).find(".sub_bar_con").toggle();
				 
			});
          
        }
    });

    $(window).trigger("resize"); //강제로 호출하는 함수
}); //20201201

    



       





$(document).ready(function(){
	  $(".fix_submenu").hide();
  $(".fix_menu").click(function(){
   $(".fix_submenu").show();
  });
  $(".fix_submenu").hover(function(){
    $(this).show();
		 
	},
	function(){
	     $(this).hide();
		
         
	});
});