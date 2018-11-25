<div class="sidebar box" id="ArticleSidebarCtrl">
    <!-- 热门推荐 -->
    <div class="sidebox widget">
        <h3 class="widget-title">热门文章</h3>
        <ul class="list-unstyled">
            <li v-for="article in populars">
                <a :href="'/archives/' + article.postUrl" target="_blank">{{ article.postTitle }}</a>
                {{ article.postDate }}
            </li>
        </ul>
    </div>
    <!-- ./热门推荐 -->
    <div class="sidebox widget">
        <h3 class="widget-title">访问统计</h3>
        <a href="http://info.flagcounter.com/n3Zj"><img src="http://s04.flagcounter.com/count2/n3Zj/bg_FFFFFF/txt_000000/border_CCCCCC/columns_2/maxflags_10/viewers_0/labels_1/pageviews_0/flags_0/percent_0/" alt="Flag Counter" border="0"></a>
    </div>
    <div class="sidebox widget">
        <h3 class="widget-title">搜索</h3>
        <form class="searchform" style="margin-left: 10px;" method="get" action="#">
            <input type="text" name="s" placeHolder="搜索功能还没有做好哦" />
        </form>
    </div>

    <div class="sidebox widget">
        <h3 class="widget-title">分类</h3>
        <ul class="list-unstyled">
        <@commonTag method="categories">
            <#list categories?if_exists as category>
            <li><a href="/categories/${category.cateUrl}">&nbsp;&nbsp;${category.cateName} (${category.posts?size})</a></li>
            </#list>
        </@commonTag>
        </ul>
    </div>

    <div class="sidebox widget">
        <h3 class="widget-title">标签</h3>
        <ul class="list-unstyled">
        <@commonTag method="tags">
            <#list tags as tag>
            <li><a href="/tags/${tag.tagUrl}">&nbsp;&nbsp;${tag.tagName} (${tag.posts?size})</a></li>
            </#list>
        </@commonTag>
        </ul>
    </div>

    <#--<div class="sidebox widget">-->
        <#--<h3 class="widget-title">标签</h3>-->
        <#--<ul class="list-unstyled" v-for="tag in tags">-->
            <#--<li><a :href="'/tags/' + tag.tagUrl">&nbsp;&nbsp;{{tag.tagName}}</a></li>-->
            <#--<ul v-for="subtag in tag.sub">-->
                <#--<li><a :href="'/tags/' + tag.tagUrl">&nbsp;&nbsp;{{subtag.tagName}}</a></li>-->
            <#--</ul>-->
        <#--</ul>-->
    <#--</div>-->
</div>
<!--End Sidebar -->