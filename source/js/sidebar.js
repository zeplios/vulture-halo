new Vue({
    el: '#ArticleSidebarCtrl', 
    data: {
        populars: [], 
        tags: []
    },
    methods: {
        loadPopulars: function () {
            let url = '/api/posts/hot';
            let params = {
                count: 3
            };
            this.$http.get(url, {params: params}).then(response => {
                // get body data
                this.populars = [];
                let populars = response.body.result;
                for (let i = 0 ; i < populars.length && i < 3 ; i++) {
                    this.populars.push(populars[i]);
                }
            }, response => {
                // error callback
                throw response;
            });
        },
        loadTags: function() {
            let url = '/api/tags';
            this.$http.get(url).then(response => {
                // get body data
                this.tags = response.body.result;
            }, response => {
                // error callback
                throw response;
            });
        }
    },
    created: function() {
        this.loadPopulars(this);
        this.loadTags(this);
    }
});
