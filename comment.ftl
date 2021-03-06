<#if post.allowComment?default(1)==1>
<@compress single_line=true>
<link type="text/css" rel="stylesheet" href="/static/plugins/OwO/OwO.min.css">
<style>
    ${options.native_css?if_exists}
</style>
<div id="CommentCtrl">
    <div class="comment-header uk-margin-bottom">
        <img class="comment-avatar" src="//gravatar.loli.net/avatar/none?s=256&d=${options.native_comment_avatar?default('mm')}">
        <input type="text" class="uk-input" v-model="commentAuthor" placeholder="昵称(必填)">
        <input type="text" class="uk-input" v-model="commentAuthorEmail" onblur="loadAvatar()" placeholder="邮箱(选填)">
        <input type="text" class="uk-input" v-model="commentAuthorUrl" placeholder="网址(选填)">
    </div>
    <input type="hidden" ref="postId" value="${post.postId?c}">
    <input type="hidden" ref="commentParent" value="0">
    <textarea class="uk-textarea" style="height:200px" ref="commentContent"
              placeholder="${options.native_comment_placeholder?default('您的评论')}"></textarea>
    <div class="OwO"></div>
    <input type="button" class="uk-button uk-button-primary uk-button-small" @click="normalComment" v-show="showCancelReply" value="取消回复"/>
    <input type="button" class="uk-button uk-button-primary uk-button-small" @click="submit" id="comment-submit" value="评论"/>

    <div class="comment-message" style="text-align: center;padding: 20px;display: none"></div>
    <div class="comment-info">
        <span id="comment-info-total" style="font-weight: 600">${commentsCount?default(0)}</span>评论
    </div>
    <#macro childComments comments>
    <div class="comment-entries comment-entries-inner" >
        <#if comments?? && comments?size gt 0>
        <#list comments?sort_by("commentDate") as comment>
        <div class="<#if comment.isAdmin==0>from_account<#else >from_staff</#if>" style="margin-left: 5px;"
             name="comment${comment.commentId?c}" id="comment-id-${comment.commentId?c}">
            <img class="comment-avatar" src="//gravatar.loli.net/avatar/${comment.commentAuthorAvatarMd5?if_exists}?s=256&d=${options.native_comment_avatar?default('mm')}">
            <div class="comment-container">
                <div class="comment-name">
                    <a href="${comment.commentAuthorUrl?if_exists}">${comment.commentAuthor?if_exists}</a>
                    <#if comment.isAdmin==1> &nbsp;<span class="uk-label ticket_staff">博主</span></#if>
                    <span class="uk-label uk-label-success comment-agent uk-visible@s" style="display: none">${comment.commentAgent?if_exists}</span>
                </div>
            <#--<div v-if="comment.toUser">to {{Name(comment.toUser)}}:</div><br/>-->
                ${comment.commentContent?if_exists}
            </div>
            <div class="comment-time">${comment.commentDate?string("yyyy-MM-dd HH:mm")}</div>
            <span @click="preComment(${comment.commentId?c})" class="comment-reply">回复</span>
            <div class="comment-clear" ></div>
        </div>
            <#if comment.childComments?? && comment.childComments?size gt 0>
                <@childComments comment.childComments></@childComments>
            </#if>
        </#list>
        </#if>
    </div>
    </#macro>
    <div class="comment-entries" id="comments-list">
    <#if comments?? && comments.getPageList()?size gt 0>
    <#list comments.getPageList()?sort_by("commentDate")?reverse as comment>
    <div class="<#if comment.isAdmin==0>from_account<#else >from_staff</#if>"
         name="comment${comment.commentId?c}" id="comment-id-${comment.commentId?c}">
        <img class="comment-avatar" src="//gravatar.loli.net/avatar/${comment.commentAuthorAvatarMd5?if_exists}?s=256&d=${options.native_comment_avatar?default('mm')}">
        <div class="comment-container">
            <div class="comment-name">
                <a href="${comment.commentAuthorUrl?if_exists}">${comment.commentAuthor?if_exists}</a>
                <#if comment.isAdmin==1> &nbsp;<span class="uk-label ticket_staff">博主</span></#if>
                <span class="uk-label uk-label-success comment-agent uk-visible@s" style="display: none">${comment.commentAgent?if_exists}</span>
            </div>
            ${comment.commentContent?if_exists}
        </div>
        <div class="comment-time">${comment.commentDate?string("yyyy-MM-dd HH:mm")}</div>
        <span at="${comment.commentId?c}" @click="preComment(${comment.commentId?c})" class="comment-reply">回复</span>
        <div class="comment-clear" ></div>
    </div>
        <#if comment.childComments?? && comment.childComments?size gt 0>
            <@childComments comment.childComments></@childComments>
        </#if>
    </#list>
    </#if>
    </div>
    <div class="native-nav" id="comment-nav">
    <#if comments.totalPage gt 1>
        <ol class="page-nav">
        <#if comments.hasPrevious>
        <li>
            <a href="?cp=${comments.nowPage-1}#comments-list" title="上一页">←</a>
        </li>
        </#if>
            <li>
        <#list rainbow as r>
        <#if r == comments.nowPage>
        <a href="?cp=${comments.nowPage}#comments-list" style="color: red;">${r}</a>
        <#else>
        <a href="?cp=${r}#comments-list">${r}</a>
        </#if>
        </#list>
            </li>
<#if comments.hasNext>
<li>
    <a href="?cp=${comments.nowPage+1}#comments-list" title="下一页">→</a>
</li>
</#if>
        </ol>
    </#if>
    </div>
</div>
<script src="/static/plugins/md5/md5.min.js"></script>
<script src="/static/plugins/ua-parser/ua-parser.min.js"></script>
<script src="/static/plugins/OwO/OwO.min.js"></script>
<#if options.comment_activate_power_mode?default("false") == "true">
<script src="/static/plugins/activate-power-mode/activate-power-mode.js"></script>
<script>
    POWERMODE.colorful = true;
    POWERMODE.shake = false;
    document.body.addEventListener('input', POWERMODE);
</script>
</#if>
<script>
    var avatarType = "${options.native_comment_avatar?default('mm')}";
</script>
</@compress>
</#if>

