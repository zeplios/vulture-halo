<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <title>${options.blog_title}</title>
    <link href="/${themeName}/source/image/icon.png" rel="shortcut icon">
<#include "common/css.ftl"/>
</head>
<body>
<#include "common/nav.ftl"/>

<div class="page-banner">
</div>

<div class="uk-section uk-container">
    <div uk-grid>
        <div class="uk-width-3-4@m uk-width-1-1">
            <h3>友站列表</h3>
            <ul class="uk-list uk-list-large uk-list-divider">
            <@commonTag method="links">
            <#list links as link>
                <li><a href="${link.linkUrl}">&nbsp;&nbsp;${link.linkName}</a></li>
            </#list>
            </@commonTag>
            </ul>
        </div>

        <div class="uk-width-1-4@m">
        <#include "sidebar.ftl"/>
        </div>
    </div>
</div>
<!-- End Wrapper -->

<#include "common/footer.ftl"/>
<#include "common/js.ftl"/>
<script type="text/javascript" src="/${themeName}/source/js/sidebar.js"></script>
</body>
</html>
