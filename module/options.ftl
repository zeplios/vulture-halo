<#import "/common/macro/theme_option_marco.ftl" as option>
<@option.head />
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6 themeImg">
            <img src="/${themeDir}/screenshot.png" style="width: 100%;">
        </div>
        <div class="col-lg-6 themeSetting">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#general" data-toggle="tab">基础设置</a>
                    </li>
                    <li>
                        <a href="#style" data-toggle="tab">样式设置</a>
                    </li>
                    <li>
                        <a href="#sns" data-toggle="tab">社交资料</a>
                    </li>
                    <li>
                        <a href="#sns-share" data-toggle="tab">分享设置</a>
                    </li>
                    <li>
                        <a href="#other" data-toggle="tab">其他设置</a>
                    </li>
                    <li>
                        <a href="#about" data-toggle="tab">关于</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <!-- 基础设置 -->
                    <div class="tab-pane active" id="general">
                        <form method="post" class="form-horizontal" id="vultureGeneralOptions">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="vultureScheme" class="col-sm-4 control-label">Scheme：</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" id="vultureScheme" name="theme_vulture_scheme">
                                            <option value="Paradox" ${((options.theme_vulture_scheme?default('Paradox'))=='Paradox')?string('selected','')}>Paradox</option>
                                            <option value="Isolation" ${((options.theme_vulture_scheme?default('Paradox'))=='Isolation')?string('selected','')}>Isolation</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureFavicon" class="col-sm-4 control-label">Favicon：</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="vultureFavicon" name="theme_vulture_favicon" value="${options.theme_vulture_favicon?if_exists}" >
                                            <span class="input-group-btn">
                                                <button class="btn btn-default btn-flat" type="button" onclick="openAttach('vultureFavicon')">选择</button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureHighFavicon" class="col-sm-4 control-label">高清Favicon：</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="vultureHighFavicon" name="theme_vulture_high_favicon" value="${options.theme_vulture_high_favicon?if_exists}" >
                                            <span class="input-group-btn">
                                                <button class="btn btn-default btn-flat" type="button" onclick="openAttach('vultureHighFavicon')">选择</button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureFooterImage" class="col-sm-4 control-label">顶部导航的Logo</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="vultureNavLogo" name="theme_vulture_nav_logo" value="${options.theme_vulture_nav_logo?if_exists}" >
                                            <span class="input-group-btn">
                                                <button class="btn btn-default btn-flat" type="button" onclick="openAttach('vultureNavLogo')">选择</button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureFavicon" class="col-sm-4 control-label">首页欢迎用的名字：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureWelcomeName" name="theme_vulture_welcome_name" value="${options.theme_vulture_welcome_name?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureFavicon" class="col-sm-4 control-label">首页欢迎展示邮箱：</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input type="radio" name="theme_vulture_welcome_email" value="true" ${((options.theme_vulture_welcome_email?default('false'))=='true')?string('checked','')}> 是
                                            <input type="radio" name="theme_vulture_welcome_email" value="false" ${((options.theme_vulture_welcome_email?default('false'))=='false')?string('checked','')}> 否
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureRecordNumber" class="col-sm-4 control-label">备案号：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureRecordNumber" name="theme_vulture_record_number" value="${options.theme_vulture_record_number?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureCopyrightSince" class="col-sm-4 control-label">站点授权时间</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="vultureCopyrightSince" class="form-control" name="theme_vulture_copyright_since" value="${options.theme_vulture_copyright_since?if_exists}" >
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-primary btn-sm pull-right" onclick="saveThemeOptions('vultureGeneralOptions')">保存设置</button>
                            </div>
                        </form>
                    </div>

                    <!-- 样式设置 -->
                    <div class="tab-pane" id="style">
                        <form method="post" class="form-horizontal" id="vultureStyleOptions">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="vultureUiuxSlogan" class="col-sm-4 control-label">Slogan：</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control" rows="3" id="vultureUiuxSlogan" name="theme_vulture_uiux_slogan" style="resize: none">${options.theme_vulture_uiux_slogan?default("Hi, nice to meet you")}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureUiuxCardElevation" class="col-sm-4 control-label">卡片深度：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureUiuxCardElevation" name="theme_vulture_uiux_card_elevation" value="${options.theme_vulture_uiux_card_elevation?default("2")}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureUiuxThemeColor" class="col-sm-4 control-label">主题颜色：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureUiuxThemeColor" name="theme_vulture_uiux_theme_color" value="${options.theme_vulture_uiux_theme_color?default("#0097A7")}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureUiuxThemeSubColor" class="col-sm-4 control-label">辅助颜色：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureUiuxThemeSubColor" name="theme_vulture_uiux_theme_sub_color" value="${options.theme_vulture_uiux_theme_sub_color?default("#00838F")}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureHyperLinkColor" class="col-sm-4 control-label">超链接颜色：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureHyperLinkColor" name="theme_vulture_uiux_hyperlink_color" value="${options.theme_vulture_uiux_hyperlink_color?default("#00838F")}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureButtonColor" class="col-sm-4 control-label">按钮颜色：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureButtonColor" name="theme_vulture_uiux_button_color" value="${options.theme_vulture_uiux_button_color?default("#757575")}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureGoogleColor" class="col-sm-4 control-label">安卓Chrome颜色：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureGoogleColor" name="theme_vulture_footer_uiux_android_chrome_color" value="${options.theme_vulture_footer_uiux_android_chrome_color?default("#0097A7")}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureNprogressColor" class="col-sm-4 control-label">NProgress颜色：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureNprogressColor" name="theme_vulture_uiux_nprogress_color" value="${options.theme_vulture_uiux_nprogress_color?default("#29d")}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureNProgressBuffer" class="col-sm-4 control-label">NProgressBuffer：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureNProgressBuffer" name="theme_vulture_uiux_nprogress_buffer" value="${options.theme_vulture_uiux_nprogress_buffer?default("800")}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureBackgroundColor" class="col-sm-4 control-label">背景颜色：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureBackgroundColor" name="theme_vulture_background_purecolor" value="${options.theme_vulture_background_purecolor?default("#F5F5F5")}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureBackgroundImage" class="col-sm-4 control-label">背景图片：</label>
                                    <div class="col-sm-8">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="vultureBackgroundImage" name="theme_vulture_background_bgimg" value="${options.theme_vulture_background_bgimg?if_exists}" >
                                            <span class="input-group-btn">
                                                <button class="btn btn-default btn-flat" type="button" onclick="openAttach('vultureBackgroundImage')">选择</button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureBackgroundBing" class="col-sm-4 control-label">Bing背景：</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" id="vultureBackgroundBing" name="theme_vulture_background_bing">
                                            <option value="false" ${((options.theme_vulture_background_bing?if_exists)=='false')?string('selected','')}>关闭</option>
                                            <option value="true" ${((options.theme_vulture_background_bing?if_exists)=='true')?string('selected','')}>开启</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-primary btn-sm pull-right" onclick="saveThemeOptions('vultureStyleOptions')">保存设置</button>
                            </div>
                        </form>
                    </div>

                    <!-- 社交资料 -->
                    <div class="tab-pane" id="sns">
                        <form method="post" class="form-horizontal" id="vultureSnsOptions">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="vultureSnsEmail" class="col-sm-4 control-label">Email：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureSnsEmail" name="theme_vulture_sns_email" value="${options.theme_vulture_sns_email?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureSnsFaceBook" class="col-sm-4 control-label">Facebook：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureSnsFaceBook" name="theme_vulture_sns_facebook" value="${options.theme_vulture_sns_facebook?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureSnsTwitter" class="col-sm-4 control-label">Twitter：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureSnsTwitter" name="theme_vulture_sns_twitter" value="${options.theme_vulture_sns_twitter?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureSnsGoogleplus" class="col-sm-4 control-label">GooglePlus：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureSnsGoogleplus" name="theme_vulture_sns_googleplus" value="${options.theme_vulture_sns_googleplus?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureSnsWeibo" class="col-sm-4 control-label">Weibo：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureSnsWeibo" name="theme_vulture_sns_weibo" value="${options.theme_vulture_sns_weibo?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureSnsInstagram" class="col-sm-4 control-label">Instagram：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureSnsInstagram" name="theme_vulture_sns_instagram" value="${options.theme_vulture_sns_instagram?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureSnsTumblr" class="col-sm-4 control-label">Tumblr：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureSnsTumblr" name="theme_vulture_sns_tumblr" value="${options.theme_vulture_sns_tumblr?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureSnsGithub" class="col-sm-4 control-label">Github：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureSnsGithub" name="theme_vulture_sns_github" value="${options.theme_vulture_sns_github?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureSnsGithub" class="col-sm-4 control-label">博客园：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureSnsGithub" name="theme_vulture_sns_cnblogs" value="${options.theme_vulture_sns_cnblogs?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureSnsLinkedin" class="col-sm-4 control-label">Linkedin：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureSnsLinkedin" name="theme_vulture_sns_linkedin" value="${options.theme_vulture_sns_linkedin?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureSnsZhihu" class="col-sm-4 control-label">Zhihu：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureSnsZhihu" name="theme_vulture_sns_zhihu" value="${options.theme_vulture_sns_zhihu?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureSnsBiliBili" class="col-sm-4 control-label">BiliBili：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureSnsBiliBili" name="theme_vulture_sns_bilibili" value="${options.theme_vulture_sns_bilibili?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureSnsTelegram" class="col-sm-4 control-label">Telegram：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureSnsTelegram" name="theme_vulture_sns_telegram" value="${options.theme_vulture_sns_telegram?if_exists}" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureSnsV2ex" class="col-sm-4 control-label">V2ex：</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="vultureSnsV2ex" name="theme_vulture_sns_v2ex" value="${options.theme_vulture_sns_v2ex?if_exists}" >
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-primary btn-sm pull-right" onclick="saveThemeOptions('vultureSnsOptions')">保存设置</button>
                            </div>
                        </form>
                    </div>

                    <!-- 分享设置 -->
                    <div class="tab-pane" id="sns-share">
                        <form method="post" class="form-horizontal" id="vultureSnsShareOptions">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="vultureSnsShareTwitter" class="col-sm-4 control-label">分享到Twitter：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_sns_share_twitter" id="vultureSnsShareTwitter" value="true" ${((options.theme_vulture_sns_share_twitter?default('true'))=='true')?string('checked','')}> 开启
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_sns_share_twitter" id="vultureSnsShareTwitter" value="false" ${((options.theme_vulture_sns_share_twitter?if_exists)=='false')?string('checked','')}> 关闭
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureSnsShareFaceBook" class="col-sm-4 control-label">分享到Facebook：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_sns_share_facebook" id="vultureSnsShareFaceBook" value="true" ${((options.theme_vulture_sns_share_facebook?default('true'))=='true')?string('checked','')}> 开启
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_sns_share_facebook" id="vultureSnsShareFaceBook" value="false" ${((options.theme_vulture_sns_share_facebook?if_exists)=='false')?string('checked','')}> 关闭
                                        </label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="vultureSnsShareGoogleplus" class="col-sm-4 control-label">分享到GooglePlus：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_sns_share_googleplus" id="vultureSnsShareGoogleplus" value="true" ${((options.theme_vulture_sns_share_googleplus?default('true'))=='true')?string('checked','')}> 开启
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_sns_share_googleplus" id="vultureSnsShareGoogleplus" value="false" ${((options.theme_vulture_sns_share_googleplus?if_exists)=='false')?string('checked','')}> 关闭
                                        </label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="vultureSnsShareWeibo" class="col-sm-4 control-label">分享到Weibo：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_sns_share_weibo" id="vultureSnsShareWeibo" value="true" ${((options.theme_vulture_sns_share_weibo?default('true'))=='true')?string('checked','')}> 开启
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_sns_share_weibo" id="vultureSnsShareWeibo" value="false" ${((options.theme_vulture_sns_share_weibo?if_exists)=='false')?string('checked','')}> 关闭
                                        </label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="vultureSnsShareLinkedin" class="col-sm-4 control-label">分享到Linkedin：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_sns_share_linkedin" id="vultureSnsShareLinkedin" value="true" ${((options.theme_vulture_sns_share_linkedin?default('true'))=='true')?string('checked','')}> 开启
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_sns_share_linkedin" id="vultureSnsShareLinkedin" value="false" ${((options.theme_vulture_sns_share_linkedin?if_exists)=='false')?string('checked','')}> 关闭
                                        </label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="vultureSnsShareqq" class="col-sm-4 control-label">分享到QQ：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_sns_share_qq" id="vultureSnsShareqq" value="true" ${((options.theme_vulture_sns_share_qq?default('true'))=='true')?string('checked','')}> 开启
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_sns_share_qq" id="vultureSnsShareqq" value="false" ${((options.theme_vulture_sns_share_qq?if_exists)=='false')?string('checked','')}> 关闭
                                        </label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="vultureSnsShareelegram" class="col-sm-4 control-label">分享到Telegram：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_sns_share_telegram" id="vultureSnsShareTelegram" value="true" ${((options.theme_vulture_sns_share_telegram?default('true'))=='true')?string('checked','')}> 开启
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_sns_share_telegram" id="vultureSnsShareTelegram" value="false" ${((options.theme_vulture_sns_share_telegram?if_exists)=='false')?string('checked','')}> 关闭
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-primary btn-sm pull-right" onclick="saveThemeOptions('vultureSnsShareOptions')">保存设置</button>
                            </div>
                        </form>
                    </div>

                    <!-- 其他设置 -->
                    <div class="tab-pane" id="other">
                        <form method="post" class="form-horizontal" id="vultureOtherOptions">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="vultureOtherJsFade" class="col-sm-4 control-label">渐显效果：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_other_js_fade" id="vultureOtherJsFade" value="true" ${((options.theme_vulture_other_js_fade?default('true'))=='true')?string('checked','')}> 开启
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_other_js_fade" id="vultureOtherJsFade" value="false" ${((options.theme_vulture_other_js_fade?default('true'))=='false')?string('checked','')}> 关闭
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureOtherJsSmoothScroll" class="col-sm-4 control-label">平滑滚动效果：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_other_js_smoothscroll" id="vultureOtherJsSmoothScroll" value="true" ${((options.theme_vulture_other_js_smoothscroll?default('true'))=='true')?string('checked','')}> 开启
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_other_js_smoothscroll" id="vultureOtherJsSmoothScroll" value="false" ${((options.theme_vulture_other_js_smoothscroll?default('true'))=='false')?string('checked','')}> 关闭
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureOtherSidebarArchives" class="col-sm-4 control-label">侧边栏归档：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_other_sidebar_archives" id="vultureOtherSidebarArchives" value="true" ${((options.theme_vulture_other_sidebar_archives?default('true'))=='true')?string('checked','')}> 显示
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_other_sidebar_archives" id="vultureOtherSidebarArchives" value="false" ${((options.theme_vulture_other_sidebar_archives?default('true'))=='false')?string('checked','')}> 隐藏
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureOtherSidebarCates" class="col-sm-4 control-label">侧边栏分类：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_other_sidebar_cates" id="vultureOtherSidebarCates" value="true" ${((options.theme_vulture_other_sidebar_cates?default('true'))=='true')?string('checked','')}> 显示
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_other_sidebar_cates" id="vultureOtherSidebarCates" value="false" ${((options.theme_vulture_other_sidebar_cates?default('true'))=='false')?string('checked','')}> 隐藏
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureOtherSidebarPostCount" class="col-sm-4 control-label">侧边栏文章总数：</label>
                                    <div class="col-sm-8">
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_other_sidebar_postcount" id="vultureOtherSidebarPostCount" value="true" ${((options.theme_vulture_other_sidebar_postcount?default('true'))=='true')?string('checked','')}> 显示
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="theme_vulture_other_sidebar_postcount" id="vultureOtherSidebarPostCount" value="false" ${((options.theme_vulture_other_sidebar_postcount?default('true'))=='false')?string('checked','')}> 隐藏
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vultureOtherPostLicense" class="col-sm-4 control-label">文章License：</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control" rows="3" id="vultureOtherPostLicense" name="theme_vulture_other_post_license" style="resize: none">${options.theme_vulture_other_post_license?if_exists}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-primary btn-sm pull-right" onclick="saveThemeOptions('vultureOtherOptions')">保存设置</button>
                            </div>
                        </form>
                    </div>

                    <!-- 关于该主题 -->
                    <div class="tab-pane" id="about">
                        <div class="box box-widget widget-user-2">
                            <div class="widget-user-header bg-blue">
                                <div class="widget-user-image">
                                    <img class="img-circle" src="https://cdn.viosey.com/img/avatar/blog_avatar.png" alt="User Avatar">
                                </div>
                                <h3 class="widget-user-username">Viosey</h3>
                                <h5 class="widget-user-desc">深自缄默，如云漂泊</h5>
                            </div>
                            <div class="box-footer no-padding">
                                <ul class="nav nav-stacked">
                                    <li><a target="_blank" href="https://viosey.com">作者主页</a></li>
                                    <li><a target="_blank" href="https://github.com/viosey/hexo-theme-vulture">原主题地址</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<@option.import_js />
