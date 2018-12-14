// Code snippet inspired by https://github.com/ruibaby/casper-halo
$(function ($) {
    $archivesContainer = $('.archive-items');
    $archivesContainer.masonry({
        // options
        itemSelector: '.archive-item'
    });

    let currentPage = 1;
    let maxPages = 2;
    const $document = $(document);
    const buffer = 300;

    let ticking = false;
    let isLoading = false;

    let lastScrollY = window.scrollY;
    let lastWindowHeight = window.innerHeight;
    let lastDocumentHeight = $document.height();

    function onScroll() {
        lastScrollY = window.scrollY;
        requestTick();
    }

    function onResize() {
        lastWindowHeight = window.innerHeight;
        lastDocumentHeight = $document.height();
        requestTick();
    }

    function requestTick() {
        if (!ticking) {
            requestAnimationFrame(infiniteScroll);
        }
        ticking = true;
    }

    function infiniteScroll() {
        // return if already loading
        if (isLoading) {
            return;
        }

        // return if not scroll to the bottom
        if (lastScrollY + lastWindowHeight <= lastDocumentHeight - buffer) {
            ticking = false;
            return;
        }

        /**
         * maxPages is defined in default.hbs and is the value
         * of the amount of pagination pages.
         * If we reached the last page or are past it,
         * we return and disable the listeners.
         */
        if (currentPage >= maxPages) {
            window.removeEventListener('scroll', onScroll, {passive: true});
            window.removeEventListener('resize', onResize);
            return;
        }

        isLoading = true;

        // next page
        currentPage += 1;

        // Load more
        let nextPage = '/api/posts/page/' + currentPage;
        console.log('get ' + nextPage);

        $.get(nextPage, function (response) {
            console.log(response);
            let posts = response.result.content;
            maxPages = response.result.totalPages;
            let $newElements = Array();
            if (posts.length > 0) {
                for (let i = 0; i < posts.length ; i++) {
                    let post = posts[i];
                    let newElementHtml = '<div class="col-sm-4 archive-item"><a class="service" href="/archives/' + post.postUrl + '">';
                    if (post.postThumbnail) {
                        newElementHtml += '<img src="' + post.postThumbnail + '" uk-scrollspy="cls: uk-animation-scale-up; repeat: true" class="uk-box-shadow-medium uk-border-rounded" alt="" />'
                    }
                    newElementHtml += '<div class="service-body"><h3>' + post.postTitle + '</h3><p>' + post.postSummary + '</p><span class="icon-image">';
                    newElementHtml += moment(post.postDate).format('YYYY-MM-DD') + '</span></div></a></div>';
                    let $newElement = $(newElementHtml);
                    $archivesContainer.append($newElement);
                    $newElements.push($newElement);
                }
                $archivesContainer.imagesLoaded( function() {
                    $newElements.forEach(function ($element) {
                        $archivesContainer.masonry('appended', $element);
                    })
                });
            }

        }).fail(function (xhr) {
            // 404 indicates we've run out of pages
            if (xhr.status === 404) {
                window.removeEventListener('scroll', onScroll, {passive: true});
                window.removeEventListener('resize', onResize);
            }
        }).always(function () {
            lastDocumentHeight = $document.height();
            isLoading = false;
            ticking = false;
        });
    }

    window.addEventListener('scroll', onScroll, {passive: true});
    window.addEventListener('resize', onResize);

    infiniteScroll();
});