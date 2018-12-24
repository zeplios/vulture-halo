<div class="uk-position-top">
    <nav class="uk-navbar-container uk-container uk-navbar-transparent" uk-navbar>
        <div class="uk-navbar-left">
            <ul class="uk-navbar-nav">
                <a class="navbar-brand uk-visible@s" href="/">
                <#if options.theme_vulture_nav_logo??>
                    <img class="site-logo" src="${options.theme_vulture_nav_logo}" alt="${options.blog_title}" />
                <#elseif options.blog_logo??>
                    <img class="site-logo" src="${options.blog_logo}" alt="${options.blog_title}" />
                <#else>
                    ${options.blog_title}
                </#if>
                </a>
                <a class="navbar-bars uk-hidden@s" uk-toggle="target: #nav-offcanvas">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </a>
                <div id="nav-offcanvas" uk-offcanvas="overlay: true" class="uk-offcanvas uk-hidden@s">
                    <div class="uk-offcanvas-bar">
                        <button class="uk-offcanvas-close" type="button"><i class="fa fa-times"></i></button>
                        <ul class="uk-nav uk-nav-primary uk-nav-center uk-margin-auto-vertical uk-padding">
                            <@commonTag method="menus">
                            <#list menus as menu>
                            <li ><a href="${menu.menuUrl}">${menu.menuName}</a></li>
                            </#list>
                            </@commonTag>
                        </ul>
                    </div>
                </div>
            </ul>
        </div>
        <div class="uk-navbar-right uk-visible@s">
            <ul class="uk-navbar-nav">
                <@commonTag method="menus">
                <#list menus as menu>
                <li ><a href="${menu.menuUrl}">${menu.menuName}</a></li>
                </#list>
                </@commonTag>
            </ul>
        </div>
    </nav>
</div>