$(function() {
    'use strict';

    handleMainMenu();
    handleResponsiveSidebar();
    handleAccordionMenu();
    handleTooltips();
    handleFloatingLabels();
    // checkBoxes($('body'));

    if ($('body').hasClass('page-scrollspy')) {
        handleScrollSpySidebar();
    }
  
    $('.play').on('click', function() {
        var $controlPanel = $(this).parent();
        
        $controlPanel.removeClass('animated');

        setTimeout(function() {
          $controlPanel.addClass('animated');
        }, 10);
    });

    $('.tabs-responsive .dropdown').on('show.bs.dropdown', function () {
        $('.tabs-responsive, .tabs-responsive .nav').css( "overflow", "inherit" );
    });
    
    $('.tabs-responsive .dropdown').on('hide.bs.dropdown', function () {
        $('.tabs-responsive, .tabs-responsive .nav').removeAttr('style')
    });
});

var handleTooltips = function() {
    "use strict";
    $('[data-toggle="tooltip"]').tooltip();
};

var handleMainMenu = function() {
    "use strict";
  
    var mobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
    var menuList = $('.page-navbar .navbar-main > li');

    // Disable floating menu on mobile phones
    if (!mobile) {
        handleNavfloat();
        //close dropdown on hover
        menuList.on('mouseover', function() {
            if(!$(this).hasClass('open')) {
                $(this).closest('.nav').find('.open').removeClass('open');
            }
        });
    } else {
        $('html').addClass('mobile');	
    }

    // Show navigation menu on button click
    $('.navbar-toggle').on('click', function() {
        var btn = $(this);
        var target = $('body');

        if (!target.hasClass('navbar-open')) {
            btn.addClass('active');
            target.addClass('navbar-open');
        } else {
            target.addClass('navbar-closing');
            setTimeout(function() {
                target.addClass('navbar-bgfade');
            }, 400);
            setTimeout(function() {
                btn.removeClass('active');
                target.removeClass('navbar-open navbar-closing navbar-bgfade');
            }, 800);
        }
    });
};

// Floating menu function
function handleNavfloat() {
    var pageNav = $('.page-navbar');
    var prevScroll = '0';
    var curDir = 'down';
    var prevDir = 'up';
    var fixedSidebar = $('.main-sidebar-scrollspy');

    $(window).scroll(function () {
        if ($(this).scrollTop() > 100 && (!pageNav.hasClass('navbar-hidden') && !pageNav.hasClass('navbar-fixed'))) {
            pageNav.addClass('navbar-hidden');
        } else if ($(this).scrollTop() < 100 && (!pageNav.hasClass('navbar-fixed') && pageNav.hasClass('navbar-hidden'))) {
            pageNav.removeClass('navbar-hidden');
        }
        if ($(this).scrollTop() > 300) {
            if (!pageNav.hasClass('navbar-fixed')) {
                pageNav.addClass('navbar-fixed');
            }
            if ($(this).scrollTop() >= prevScroll) {
                curDir = 'down';
                if (curDir !== prevDir) {
                    prevDir = curDir;
                    pageNav.removeClass('navbar-visible').addClass('navbar-hidden');
                    fixedSidebar.removeClass('main-sidebar-floating-nav');
                }
            } else {
                curDir = 'up';
                if (curDir !== prevDir) {
                    pageNav.removeClass('navbar-hidden').addClass('navbar-visible');
                    fixedSidebar.addClass('main-sidebar-floating-nav');
                    prevDir = curDir;
                }
            }
            prevScroll = $(this).scrollTop();
        }
        if (pageNav.hasClass('navbar-fixed') && $(this).scrollTop() <= 10) {
            pageNav.removeClass('navbar-fixed navbar-visible');
            fixedSidebar.removeClass('main-sidebar-floating-nav');
        }
    });
}

var handleScrollSpySidebar = function() {
    "use strict";
  
    $('.page-scrollspy').scrollspy({ target: '.main-sidebar-scrollspy' });
    $('.main-sidebar-scrollspy .nav-sidebar').affix({
        offset: {
            top: $('.page-main').offset().top,
            bottom: $('body').height() - ($('.page-main').height() + $('.page-main').offset().top) + 80,
        }
    });
    console.log($('body').height() - ($('.page-main').height() + $('.page-main').offset().top) + 60);
    $('.main-sidebar-scrollspy .nav > li > a').on('click', function(e) {
        e.preventDefault();
        $('html, body').animate({
            scrollTop: $(this.hash).offset().top
        }, 250);
    });
};

var handleResponsiveSidebar = function() {
    "use strict"; 
  
    $('.nav-responsive .btn').on('click', function() {
        var target = $('.nav-responsive');

        if (!target.hasClass('open')) {
            target.addClass('open');
            $('html, body').animate({
                scrollTop: target.offset().top
            }, 250);
        } else {
            target.removeClass('open');
        }
    });

    $('.nav-responsive > .nav-sidebar a').on('click', function() {
		    $(this).closest('.nav-responsive').removeClass('open');
    });
    $(document).on('click','.nav-responsive.open > .nav-sidebar > .dropdown > a', function(e) {
        e.preventDefault();
        $(this).parent().addClass('active');
    });
    $(document).mouseup(function (e) {	
        var target = $('.nav-responsive');
        if (!target.is(e.target) && target.has(e.target).length === 0) {
            target.removeClass('open');
        }
    });
};

var handleFloatingLabels = function() {
    "use strict";
    // $('.floatlabel').floatlabel();  
};

var handleAccordionMenu = function() {
    "use strict";

    $('.accordion .accordion-title').on('click', function () {
        var currLi = $(this).closest('li');
        if (!currLi.hasClass('open')) {
            $('.accordion .collapse.in').collapse('hide');
            $('.accordion li').removeClass('open');
            currLi.find('.collapse').collapse('toggle');
            currLi.closest('li').addClass('open');
            /*
            currLi.on('shown.bs.collapse', function () {
                $('html, body').animate({
                    scrollTop: currLi.offset().top - 60
                }, 250);		
            });
            */
        } else {
            $('.accordion li').removeClass('open');
            currLi.find('.collapse').collapse('toggle');
        }
    });
};

//var checkBoxes = function (container)
//{
//  "use strict";
//  container.find('input:not(.switch-checkbox)').icheck({
//    checkboxClass: 'checkbox-styled',
//    radioClass: 'radio-styled',
//    increaseArea: '20%'
//  });
//};


// For responsive tabs scrolling
$(function() {
    "use strict";

    function e() {
        c.classList.remove("disabled"), 
        n.classList.remove("disabled"), 
        l.scrollLeft <= 0 && c.classList.add("disabled"), 
        l.scrollLeft + l.clientWidth + 5 >= l.scrollWidth && n.classList.add("disabled")
    }

    function t(e) {
        l.scrollLeft += e
    }
    var n = document.querySelector(".btn-next"),
        c = document.querySelector(".btn-prev"),
        l = document.querySelector(".tabs-responsive > .tabs-container > .nav-tabs"),
        i = 40;
    if (l !== null) {
        l.addEventListener("scroll", e), 
        e(), 
        n.addEventListener("click", t.bind(null, i)), 
        n.addEventListener("tap", t.bind(null, i)), 
        c.addEventListener("click", t.bind(null, -i)), 
        c.addEventListener("tap", t.bind(null, -i))
    }
}(),
function() {
    "use strict";
    var e = document.querySelectorAll('[href=""]');
    Array.prototype.forEach.call(e, function(e) {
        e.addEventListener("click", function(e) {
            e.preventDefault()
        })
    })
});

function errorHandler(response) {
    alert("请求失败");
}

new Vue({
    el: '#Header', 
    data: {
        oscLoginUrl: '', 
        weiboLoginUrl: '',  
        githubLoginUrl: ''
    }, 
    methods: {
        loadLoginUrls: function() {
            this.$http.get('/login/osc/request').then(response => {
                this.oscLoginUrl = response.body.data.url;
            }, errorHandler);
            this.$http.get('/login/weibo/request').then(response => {
                this.weiboLoginUrl = response.body.data.url;
            }, errorHandler);
            this.$http.get('/login/github/request').then(response => {
                this.githubLoginUrl = response.body.data.url;
            }, errorHandler);
        }
    }, 
    mounted: function() {
        // this.loadLoginUrls();
    }
})

/* footer */
new Vue({
    el: '#footer', 
    data: {
        links: []
    }, 
    methods: {

    }, 
    mounted: function() {
        this.$http.get('/api/links').then(response => {
            this.links = response.body.result;
        }, response => {
            alert(response);
        });
    }
});
