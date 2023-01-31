;(function($) {
	var on = $.fn.on, debounce;
	$.fn.on = function () {
		var args = Array.apply(null, arguments);
		var first = args[0];
		var last = args[args.length - 1];
		var isObj = typeof first === 'object';
		if (!isObj && isNaN(last) || (last === 1 && args.pop())) return on.apply(this, args);
		if (isObj) {
			for (var event in first) {
				this.on(event, last, first[event], args[1]);
			}
			return this;
		}
		var delay = args.pop();
		var fn = args.pop();
		args.push(function () {
			var self = this, params = arguments;
			clearTimeout(debounce);
			debounce = setTimeout(function () {
				fn.apply(self, params);
			}, delay);
		});
		return on.apply(this, args);
	};
}(this.jQuery || this.Zepto));


jQuery.fn.center = function(parent) {
	if (parent) {
		parent = this.parent();
	} else {
		parent = window;
	}
	this.css({
		"position": "absolute",
		"top": ((($(parent).height() - this.outerHeight()) / 2) + $(parent).scrollTop() + "px"),
		"left": ((($(parent).width() - this.outerWidth()) / 2) + $(parent).scrollLeft() + "px")
	});
	return this;
}
function isMobile() {
	try { document.createEvent("TouchEvent"); return true; }
	catch (e) { return false; }
}


(function () {
	var link_element = document.createElement("link"),
		s = document.getElementsByTagName("script")[0];
	if (window.location.protocol !== "http:" && window.location.protocol !== "https:") {
		link_element.href = "http:";
	}
	link_element.href += "//fonts.googleapis.com/css?family=Titillium+Web:200italic,200,300italic,300,400italic,400,600italic,600,700italic,700,900";
	link_element.rel = "stylesheet";
	link_element.type = "text/css";
	s.parentNode.insertBefore(link_element, s);
})();

var UserAgent = navigator.userAgent;

if (UserAgent.match(/iPhone|iPod|iPod2|ipad|ipad2|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) {
	isMobileWebKit = true;
} else {
	isMobileWebKit = false;
}

function over_img(img, n) {

	var hover = "_" + n;
	if (img.hasClass("on") == false && img.find("img").length > 0) {
		menuimg = img.find("img");

		if (menuimg.attr("src").indexOf(".jpg") > 0) {
			menuimg_type = ".jpg";
		} else if (menuimg.attr("src").indexOf(".gif") > 0) {
			menuimg_type = ".gif";
		} else if (menuimg.attr("src").indexOf(".png") > 0) {
			menuimg_type = ".png";
		}


		menuimg_src = menuimg.attr("src").split("_off")[0];
		menuimg_src = menuimg_src.split("_on")[0];
		menuimg_src = menuimg_src.split("_select")[0];
		menuimg.attr("src", menuimg_src + hover + menuimg_type);
	}
}

function gnb(dep1, dep2, dep3, dep4) {
	var $gnbWrap = $('.gnbWrap'),
		$gnbWrapBg = $('.gnbWrapBg'),
		$gnb = $('#gnb'),
		$gnbLi = $gnb.find(' > li'),
		$gnb2Dep = $gnbLi.find('.dep2Wrap'),
		$gnb2DepLi = $gnb2Dep.find('.dep2 > ul > li'),
		$gnb3DepLi = $gnb2DepLi.find('.dep3 > li'),
		$gnb4DepLi = $gnb3DepLi.find('.dep4 > li'),
		resetTime = null;

		dep1 = $("#gnb > li." + dep1).index() + 1;
		dep2 = $("#gnb > li .dep2 > ul > li." + dep2).index() + 1;
		dep3 = $("#gnb > li .dep2 > ul > li > .dep3 > ul > li." + dep3).index() + 1;
		if( dep1) {
			$('.mobileGnbWrap .allmenu >li').eq(dep1 - 1).addClass('on')
		}
		if( dep2) {
			$('.mobileGnbWrap .allmenu >li .dep2 > ul > li').eq(dep2 - 1).addClass('on')
		}

		if( dep3) {
			$('.mobileGnbWrap .allmenu >li .dep2 > ul > li > .dep3 > ul > li').eq(dep3 - 1).addClass('on')
		}


	removeActive();
	$gnbLi.on({
		"mouseenter focusin": function () {
			clearTimeout(resetTime);
			
			//$gnb2Dep.hide();
			
			
			$(".cateList .txWrap").hide();
			$(".cateList .txWrap0"+ parseInt($(this).index() + 1)).show();
			var gnbHeight = $(this).find($gnb2Dep).outerHeight() + 70;
			$gnbWrapBg.css({height: 500});
			$gnb2Dep.hide();
			$(this).find($gnb2Dep).show(0, function() {
				$gnbWrapBg.addClass("active");
				$gnbLi.removeClass('on');
				$(this).parent().addClass('on');
			});
		},
		"mouseleave focusout": function () {
			resetTime = setTimeout(function () {
				removeActive();
			}, 300)
		}
	});
	// $gnbWrapBg.on({
	// 	"mouseenter focusin": function () {
	// 		clearTimeout(resetTime);
	// 		$gnbWrapBg.addClass("active");
	// 	}
	// });
	$gnb2Dep.find("li").on({
		"mouseenter focusin": function () {
			clearTimeout(resetTime);
		}
	});

	var gnbWrapH;

	if( $('body').is('.mo') ) {
		gnbWrapH = 90;
	} else {
		gnbWrapH = 90;
	}


	//common removeActive
	function removeActive() {
		$gnbWrapBg.removeClass("active");
		//$gnb2Dep.hide();
		$gnbWrapBg.css({height: gnbWrapH})
		$gnbLi.removeClass('on');
		$gnb2DepLi.removeClass('on');
		$gnb3DepLi.removeClass('on');
		//$gnbLi.eq(dep1 - 1).addClass('on');
		$gnbLi.eq(dep1 - 1).find($gnb2DepLi).eq(dep2 - 1).addClass('on');
		$gnbLi.eq(dep1 - 1).find($gnb2DepLi).eq(dep2 - 1).find($gnb3DepLi).eq(dep3 - 1).addClass('on');
	}
	var $allmenu = $('#allmenu'),
			$allmenuLi = $allmenu.find(' > li'),
			$allmenu2Dep = $allmenuLi.find('.dep2Wrap'),
			$allmenu2DepLi = $allmenu2Dep.find('.dep2 > ul > li'),
			$allmenu3DepLi = $allmenu2DepLi.find('.dep3 > ul > li'),
			$allmenu4DepLi = $allmenu3DepLi.find('.dep4 > ul > li');

		$(".locationWrap .locationLink.dep1 > a").text($allmenuLi.eq(dep1 - 1).find(">a").text());
		$(".locationWrap .locationLink.dep1 .selectMenu li").eq(dep1 - 1).addClass("on");


		$allmenuLi.eq(dep1 - 1).addClass("on");
		$allmenuLi.eq(dep1 - 1).find($allmenu2DepLi).eq(dep2 - 1).addClass("on");
		$allmenuLi.eq(dep1 - 1).find($allmenu2DepLi).eq(dep2 - 1).find($allmenu3DepLi).eq(dep3 - 1).addClass("on");
		$allmenuLi.eq(dep1 - 1).find($allmenu2DepLi).eq(dep2 - 1).find($allmenu3DepLi).eq(dep3 - 1).find($allmenu4DepLi).eq(dep4 - 1).addClass("on");

		var dep1Item = $allmenuLi.eq(dep1 - 1).find(".dep2 ul").clone();
		$('#sideMenu').append('<ul class="navList">' + dep1Item.html() + '</ul>');

		if (dep2) {
			var dep2Item = $allmenuLi.eq(dep1 - 1).find(".dep2 ul").clone();
			
			dep2Item.find(".dep3").remove();
			$(".locationWrap .location").append('<li class="locationLink dep2"><a href="#" class="active">' + $allmenuLi.eq(dep1 - 1).find($allmenu2DepLi).eq(dep2 - 1).find(">a").text() + '</a><ul class="selectMenu">' + dep2Item.html() + '</ul>');

		}
		if (dep3) {
			var dep3Item = $allmenuLi.eq(dep1 - 1).find($allmenu2DepLi).eq(dep2 - 1).find(".dep3 ul").clone();
			dep3Item.find(".dep4").remove();
			$(".locationWrap .location").append('<li class="locationLink dep3"><a href="#" class="active">' + $allmenuLi.eq(dep1 - 1).find($allmenu2DepLi).eq(dep2 - 1).find($allmenu3DepLi).eq(dep3 - 1).find(">a").text() + '</a><ul class="selectMenu">' + dep3Item.html() + '</ul>');





		}
		if (dep4) {
			var dep4Item = $allmenuLi.eq(dep1 - 1).find($allmenu2DepLi).eq(dep2 - 1).find($allmenu3DepLi).eq(dep3 - 1).find(".dep4").clone();
			$(".locationWrap .location").append('<li class="locationLink dep4"><a href="#" class="active">' + $allmenuLi.eq(dep1 - 1).find($allmenu2DepLi).eq(dep2 - 1).find($allmenu3DepLi).eq(dep3 - 1).find($allmenu4DepLi).eq(dep4 - 1).find(">a").text() + '</a><ul class="selectMenu">' + dep4Item.html() + '</ul>');
		}
		$(".locationWrap .locationLink li").removeClass("on sub")
		$(".locationWrap .location > li:last-child").addClass("on")
	$(".locationWrap .locationLink .active").click(function (e) {
		e.preventDefault();
		if (!$(this).closest(".locationWrap .locationLink").find(".selectMenu").hasClass("open")) {
			$(".locationWrap .locationLink").find(".selectMenu").removeClass("open");
			$(this).closest(".locationWrap .locationLink").find(".selectMenu").addClass("open");
		} else {
			$(".locationWrap .locationLink").find(".selectMenu").removeClass("open");
		}
	})

	$('.gnbArea .gnb > li > a').on('click', function(event) {
		event.preventDefault();
		
	});
	//寃��됰찓��
	$(".btnSearchOpen").click(function (e) {
		e.preventDefault();
		if (!$(this).hasClass("open")) {
			$(this).addClass("open");
			$(".totalSearchWrap").slideDown({
				duration: 300,
				easing: "easeInOutCubic"
			})
		} else {
			$(this).removeClass("open");
			$(".totalSearchWrap").slideUp({
				duration: 300,
				easing: "easeInOutCubic"
			})
		}
	})
	$(".btnSearchClose").click(function (e) {
		e.preventDefault();
		$(".btnSearchOpen").removeClass("open");
		$(".totalSearchWrap").slideUp({
			duration: 300,
			easing: "easeInOutCubic"
		})
	})


	//sideNav
	var sideNav = $("#sideNav").find('.navList');
	// default reset
	function resetSideNav(){
		sideNav.find('>li').each(function(){
			var $self = $(this);
			sideNav.find("li").removeClass('on');
		})
	};

	// 1depth control 
	sideNav.find("> li > a")
		.bind("mouseenter", function(){
			resetSideNav();
			sideNav.find("> li").removeClass('on');
			$(this).parent('li').addClass('on');
		})
		.bind("focusin", function(){
			$(this).mouseenter();
		});

	// 1depth control 
	sideNav.find("> li > ul a")
		.bind("mouseenter", function(){
			sideNav.find("> li").removeClass('on');
			sideNav.find("> li > ul li").removeClass('on');
			$(this).parent('li').addClass('on');
			$(this).parent('li').parents('li').addClass('on');
		})
		.bind("focusin", function(){
			$(this).mouseenter();
		});

	//sideNav reset
	$('#sideNav').bind("mouseleave", function(){
		resetSideNav()
		navInit(dep1, dep2, dep3, dep4);
	});

	//init
	function navInit(dep1, dep2, dep3 , dep4){
		if (dep2 != 0){
			//sideNav
			var sideNav_dep1 = sideNav.find('> li').eq(dep2-1);
			sideNav_dep1.addClass('on');

			if (dep3 != 0){
				//sideNav
				var sideNav_dep2 = sideNav_dep1.find('ul li').eq(dep3-1);
				sideNav_dep1.find('ul').show();
				sideNav_dep2.addClass('on');

				if (dep4 != 0){
					//sideNav
					var sideNav_dep3 = sideNav_dep2.find('ul li').eq(dep4-1);
					sideNav_dep2.find('ul').show();
					sideNav_dep3.addClass('on');
				}
			}
		}
	}
	try {
		navInit(dep1, dep2, dep3, dep4);
	} catch(err){

	}
}
$(function () {
	(function() {
		var height = jQuery(window).outerHeight();

		jQuery(window).scroll(function(event) {
			if( jQuery(window).scrollTop() > height - (height/1.2) ) {
				jQuery(".gnbWrapBg").addClass('init')
			} else {
				jQuery(".gnbWrapBg").removeClass('init')
			}
		});
	})(jQuery);

	
jQuery.fn.center = function(parent) {
	if (parent) {
		parent = this.parent();
	} else {
		parent = window;
	}
	this.css({
		"position": "absolute",
		"top": ((($(parent).height() - this.outerHeight()) / 2) + $(parent).scrollTop() + "px"),
		"left": ((($(parent).width() - this.outerWidth()) / 2) + $(parent).scrollLeft() + "px")
	});
	return this;
}
	// Fixes anchor focus in Chrome/Safari/IE by setting the tabindex of the
	// target container to -1 on page load
	if (window.location.hash) {
		$(window.location.hash).attr("tabindex", -1).focus();
	}
	$(".skip_navigation a").focus(function () {
		$(".skip_navigation a").removeClass("on");
		$(this).addClass("on");
	})
	$(".skip_navigation a").blur(function () {
		$(".skip_navigation a").removeClass("on");
	})
	/* 濡ㅼ삤踰� �대�吏� */
	$(".rollOver").each(function () {
		$(this).bind("foucs mouseenter", function () {
			over_img($(this), "on");
		});
		$(this).bind("blur mouseleave", function () {
			over_img($(this), "off");
		})
	});
	//�쒕툕�섏씠吏� 硫붾돱 �ㅼ퐫濡� �대깽��
	//
	var footerHeight;
	footerHeight = $('#footer').height();
	if ($(".subContentWrap").length > 0) {
		$(window).scroll(function () {
			footerHeight = $('#footer').height();
			var top = $(window).scrollTop()
			var target = 107;
			// if (top > target) {
			// 	$(".locationWrap").addClass("fixed");
			// } else {
			// 	$(".locationWrap").removeClass("fixed");
			// }

			if ($(document).height() - footerHeight < (top + $(window).height())) {
				$(".btn_contentTop").addClass("ab");
				$(".btn_contentTop").css({bottom: footerHeight + 50})
			} else {
				$(".btn_contentTop").removeClass("ab");
				$(".btn_contentTop").css({bottom: ""})
			}
		})
		$(".btn_contentTop").click(function (e) {
			e.preventDefault();
			$("body, html").stop().animate({ scrollTop: 0 }, {
				duration: 200,
				easing: "easeInOutCubic"
			});
		})
	}

	$(".tabDisplay .tabArea a").click(function (e) {
		e.preventDefault();
		var idx = $(this).parent().index();
		$(this).closest(".tabArea").find("li").removeClass("on").eq(idx).addClass("on");
		$(this).closest(".tabArea").find("li a span").remove();
		$(this).closest(".tabArea").find("li").eq(idx).find("a").append("<span class='hide_txt'>�꾩옱�섏씠吏�</span>");
		$(this).closest(".tabDisplay").find(".tabContent").hide().eq(idx).show();
	})
	
	if (isMobile()) {
		$("body").addClass("isTablet");
	}

})
// LayerPopup �닿린
var popupTarget;
function layerPop(n, target, type) {
	if (n == "open") {

		if (type) {
			$("." + target).css("z-index", "40");
			$("body").append("<div class='dim_bg " + target + "' style='z-index:39;display:block'></div>")
		} else {
			$(".popupWrap").hide();
			$(".dim_bg").show();
		}
		$(".popupWrap." + target).show();
		$("body").addClass("dim");
		$("." + target).attr("tabindex", -1).focus();
	} else {
		if (type) {
			$("." + target).hide();
			$(".dim_bg." + target).remove();
		} else {
			$(".popupWrap").hide();
			$(".dim_bg").hide();
		}
		$("body").removeClass("dim");
	}
}



$(function() {
	var docHeight = $(document).height();
	var footHeight = $("#footer").height();
	var windowWidth = $(window).width();
	var gnbTop;
	$('.mobileNav').find('.btnMnav').on('click', function(event) {
		event.preventDefault();
		
	});

	function resetMoGnb() {
		$('.mobileGnbWrap').slideUp();
		$('.btnAllmenu ').removeClass('open')
		$('#wrap .lyDim').remove();
	}

	$(document).on('click touchstart', '.lyDim', function(event) {
		event.preventDefault();
		resetMoGnb();
	});


	$('.btnAllmenu').on('click', function(event) {
		event.preventDefault();
		var height = jQuery('.base-height').height();
		if( $('.header ').is('.mobile') ) {
			resetMoGnb();

			return false;
		}
		if ( $('body').is('.mo') ) {
			if( $(this).is('.open') ) {
				$(this).removeClass('open')

				if( jQuery(window).scrollTop() > height - (height/1.5) ) {
					$('.gnbWrapBg').removeClass("init2");
				} else {
					$('.gnbWrapBg').removeClass("init");
					$('.gnbWrapBg').removeClass("init2");
				}
				$('.mobileGnbWrap').slideUp();
			} else {
				$(this).addClass('open')
				$('.mobileGnbWrap').slideDown();
				$('.gnbWrapBg').addClass("init");
				$('.gnbWrapBg').addClass("init2");
			}
		} else {
			layerPop('open','popup_allmenu');
		}
	});

	$('.popup_allmenu .btnClose').on('click', function(event) {
		event.preventDefault();
		layerPop('close','popup_allmenu');
	});


	$(window).on({
		resize: function (e) { 
			 if ($(window).width() != windowWidth) {
				windowWidth = $(window).width();
				listenWidth();
			 }
		},
		load : function(e) {
			listenWidth();
		}
	},10);

	function listenWidth() {
		if(windowWidth <= 747) {
			mobileVer()
			$('body').addClass('mo')
			if ( $('body').is('.mo') ) {
				$('.subItems').stop().slideUp();
				$('.indexCt .itemWrap > a').removeClass('active')
				$('.indexCt .itemWrap > a').off('mouseenter', indexItemMouseenter)
				$('.indexCt .itemWrap').off('mouseleave', indexItemMouseleave)
				$('.indexCt .itemWrap > a').on('click', indexItemClick)
			}
		}else if(windowWidth > 747 ) {
			pcVer()
			$('body').removeClass('mo')
			if ( !$('body').is('.mo') ) {
				$('.subItems').stop().slideUp();
				$('.indexCt .itemWrap > a').removeClass('active')
				$('.indexCt .itemWrap > a').on('mouseenter', indexItemMouseenter)
				$('.indexCt .itemWrap').on('mouseleave', indexItemMouseleave)
				$('.indexCt .itemWrap > a').off('click', indexItemClick)
			}
		};
		function mobileVer() {}
		function pcVer() {
				resetMoGnb();
		}
	}

	function indexItemMouseenter() {
		$('.subItems').stop().slideUp();
		$(this).next('.subItems').stop().slideDown();
	}

	function indexItemMouseleave() {
		$('.subItems').stop().slideUp();
	}


	function indexItemClick(ev) {
		ev.preventDefault();
		$('.subItems').stop().slideUp();
		$(this).next('.subItems').stop().slideDown();
		$('.indexCt .itemWrap > a').removeClass('active')
		$(this).addClass('active');
	}


	$('.indexCt .itemWrap a').hover(function() {
		$(this).addClass('on');
	}, function() {
		$(this).removeClass('on');
	});

	/*familysite*/
	$('.familysite > a').on('click', function (e) {
		e.preventDefault();
		if (!$(this).hasClass("open")) {
			$(this).addClass("open");
			$(this).closest(".familysite").find("ul").slideDown(300);
		} else {
			$(this).removeClass("open");
			$(this).closest(".familysite").find("ul").slideUp(300);
		}
	});

	// faq
	$('.faq-wrap dt a').click(function () {
		var faqListContainer = $(this).parent().parent();
		var currentContent = $(this).parent().next('dd');
		if ( 'block' == $(this).parent().next('dd').css('display') ) {
			currentContent.slideUp(280);
			$(this).attr('title','�듬� �닿린');
			$('.faq-wrap dt').removeClass('active');
		} else {
			faqListContainer.find('dd').slideUp(280);
			currentContent.stop().slideDown(280);
			$('.faq-wrap dt a').attr('title','�듬� �닿린');
			$(this).attr('title','�듬� �リ린');
			$('.faq-wrap dt').removeClass('active');
			$(this).parent('dt').addClass('active');
		}
	});


	$('.topMenuArea .global > a').on('click', function(event) {
		event.preventDefault();
		$(this).next('.list').toggleClass('on');
	});

	$('.businessSlider .responsive').slick({
		infinite: true,
		speed: 300,
		slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: true,
		autoplaySpeed: 3000,
		pauseOnHover : false,
		pauseOnFocus : false
	});
	var certificateListsBigImg;
	$('.certificationList').find('a').on('click', function(event) {
		event.preventDefault();
		certificateListsBigImg = $(this).attr('data-src');
		$('.certificationList').find('a').removeClass('click');
		$(this).addClass('click');
		$('.certificateLyWrap').show()
		$(".certificateLyWrap .certificateLyArea .imgArea img").attr('src', certificateListsBigImg).load(function() {
			$(".certificateLyWrap .certificateLyArea").center(false);
		$('.certificateLyWrap .imgArea').focus()
		});
	});

	$('.certificateLyWrap .lyClose').find('a').on('click', function(event) {
		event.preventDefault();
		$('.certificateLyWrap').hide();
		$('.certificateLists').find('a.click').focus();
	});

	$('.certificateLyWrap .lyClose').find('a').on('keydown', function(e) {
		var keyCode = e.keyCode || e.which; 
		if (keyCode == 9) { 
		e.preventDefault(); 
			$('.certificateLyWrap').hide();
			$('.certificateLists').find('a.click').focus();
		} 
	});


	$('.businessMapArea .mapListSlider .slider').slick({
		fade: true,
		speed: 700,
		slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: true,
		autoplaySpeed: 3000,
		pauseOnHover : false,
		pauseOnFocus : false
	});
});