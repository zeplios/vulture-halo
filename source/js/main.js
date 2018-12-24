$(function() {
    'use strict';

    // handleMainMenu();
    // handleResponsiveSidebar();
    // handleAccordionMenu();
});

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