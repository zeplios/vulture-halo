const s = new OwO({
    logo: 'OωO表情',
    container: document.getElementsByClassName('OwO')[0],
    target: document.getElementsByClassName('comment-input-content')[0],
    position: 'down',
    width: '100%',
    maxHeight: '210px',
    api: "/static/plugins/OwO/OwO.min.json"
});

/**
 * 格式化ua信息
 * @param string
 * @returns {string}
 */
const parser = new UAParser();

function show_ua(string) {
    parser.setUA(string);
    const uua = parser.getResult();
    if (uua.os.version === 'x86_64') {
        uua.os.version = 'x64';
    }
    const browser = uua.browser.name + ' ' + uua.browser.version;
    const os = uua.os.name + ' ' + uua.os.version;
    return '<span class="badge ticket_staff">' + browser + '</span><span class="badge ticket_staff">' + os + '</span>';
}

/**
 * 格式化字符串
 * @param a a
 * @returns {*}
 */
function formatContent(a) {
    a = a.replace(/\r\n/g, '<br/>');
    a = a.replace(/\n/g, '<br/>');
    a = a.replace(/\s/g, ' ');
    return a;
}

// -------------------------------------- 下面是之前的Vue实现 --------------------------------------------

//var app = angular.module('app', []);
new Vue({
    el: '#CommentCtrl',
    data: {
        uto: '',
        utoFacade: '',
        content: '',
        comments: [],
        commentAuthor: '',
        commentAuthorEmail: '',
        commentAuthorUrl: '',
        showCancelReply: false
    },
    methods: {
        Name: function(user) {
            return user ? user.nickname : "";
        },
        Time: function(millis) {
            return moment(millis).format("YYYY-MM-DD HH:mm");
        },
        preComment: function(at) {
            // this.uto = uto;
            // this.utoFacade = this.Name(uto);
            const $commentContent = $(this.$refs.commentContent);
            const $commentParent = $(this.$refs.commentParent);
            const commentParentAuthor = $('#comment-id-' + at).find(".comment-name a:eq(0)").text();
            $commentParent.val(at);
            $commentContent.attr("placeholder", "@" + commentParentAuthor);
            $commentContent.focus();
            this.showCancelReply = true;
        },
        normalComment: function() {
            $(this.$refs.commentParent).val(0);
        },
        cancelReply: function() {
            $(this.$refs.commentParent).val(0);
            $(this.$refs.commentContent).attr("placeholder", "");
            this.showCancelReply = false;
        },
        submit: function() {
            this.submitComment();
        },
        submitComment: function() {
            const author = this.commentAuthor;
            const content = $(this.$refs.commentContent);
            const email = this.commentAuthorEmail;
            const url = this.commentAuthorUrl;
            if (author === '' || content === '') {
                $(".comment-message").html("<span style='color:red'>请输入必填项！</span>");
                $(".comment-message").fadeIn(1000);
                setTimeout(function () {
                    $(".comment-message").fadeOut(1000);
                }, 1500);
                return;
            }
            $(this).attr("disabled", "disabled");
            $(this).html("提交中...");
            $.ajax({
                type: 'POST',
                url: '/newComment',
                async: false,
                data: {
                    'postId': this.$refs.postId.value,
                    'commentContent': formatContent(content.val()),
                    'commentAuthor': author,
                    'commentAuthorEmail': email,
                    'commentAuthorUrl': url,
                    'commentAgent': navigator.userAgent,
                    'commentParent': this.$refs.commentParent.value
                },
                success: function (data) {
                    localStorage.setItem('author', author);
                    localStorage.setItem('email', email);
                    localStorage.setItem('url', url);
                    if (data.code == 1) {
                        $('.comment-input-content').val("");
                        $(".comment-message").html("<span>" + data.msg + "</span>");
                    } else {
                        $(".comment-message").html("<span style='color:red'>" + data.msg + "</span>");
                    }
                    $(".comment-message").fadeIn(1000);
                    setTimeout(function () {
                        $(".comment-message").fadeOut(1000);
                        $("#comment-submit").removeAttr("disabled");
                        $("#comment-submit").html("提交");
                        window.location.reload();
                    }, 1500);
                }
            });
        },
        loadAvatar: function() { // 加载头像
            // //gravatar.loli.net/avatar/none?s=256&d=${options.native_comment_avatar?default('mm')}
            $(".comment-author-avatar").attr("src", "//gravatar.loli.net/avatar/" + md5(localStorage.getItem("email")) + "?s=256&d=" + avatarType);
            if (this.commentAuthorEmail !== '') {
                $(".comment-author-avatar").attr("src", "//gravatar.loli.net/avatar/" + md5(this.commentAuthorEmail) + "?s=256&d=" + avatarType);
            }
        }
    },
    mounted: function() {
        // this.loadComments();

        $(".comment-agent").each(function () {
            $(this).html(show_ua($(this).html()));
            $(this).show();
        });
        this.commentAuthor = localStorage.getItem("author");
        this.commentAuthorEmail = localStorage.getItem("email");
        this.commentAuthorUrl = localStorage.getItem("url");
        this.loadAvatar();
    },
})
