new Vue({
    el: '#ArticleSidebarCtrl', 
    data: {
        populars: [], 
        tags: []
    },
    methods: {
        loadPopulars: function () {
            var url = '/api/posts/hot';
            var params = {
                count: 3
            };
            this.$http.get(url, {params: params}).then(response => {
                // get body data
                this.populars = response.body.result;
            }, response => {
                // error callback
                throw response;
            });
        },
        loadTags: function() {
            var url = '/api/tags';
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
