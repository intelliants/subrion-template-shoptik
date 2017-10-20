<!DOCTYPE html>
<html lang="{$core.language.iso}" dir="{$core.language.direction}">
    <head>
        {ia_hooker name='smartyFrontBeforeHeadSection'}

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <title>{ia_print_title}</title>
        <meta name="description" content="{$core.page['meta-description']}">
        <meta name="keywords" content="{$core.page['meta-keywords']}">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="generator" content="Subrion CMS - Open Source Content Management System">
        <meta name="robots" content="index">
        <meta name="robots" content="follow">
        <meta name="revisit-after" content="1 day">
        <base href="{$smarty.const.IA_URL}">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <link rel="shortcut icon" href="{if !empty($core.config.site_favicon)}{$core.page.nonProtocolUrl}uploads/{$core.config.site_favicon}{else}{$core.page.nonProtocolUrl}favicon.ico{/if}">

        {ia_add_media files='jquery, subrion, bootstrap' order=0}
        {ia_print_js files='_IA_TPL_app' order=999}

        {ia_hooker name='smartyFrontAfterHeadSection'}

        {ia_print_css display='on'}

        {ia_add_js}
            intelli.pageName = '{$core.page.name}';

            {foreach $core.customConfig as $key => $value}
                intelli.config.{$key} = '{$value}';
            {/foreach}
        {/ia_add_js}

        {if $core.config.custom_colors}
            <style type="text/css">
                body { background-color: {$core.config.custom_color_body_bg}; color: {$core.config.custom_color_text}; }
                h1, h2, h3, h4, h5, h6,
                .box__caption { color: {$core.config.custom_color_headings}; }
                a,
                a:focus { color: {$core.config.custom_color_link}; }
                a:hover { color: {$core.config.custom_color_link_hover}; }

                .inventory { background-color: {$core.config.custom_color_inventory_bg}; }
                .nav-inventory > li > a,
                .nav-inventory > li > a:focus { color: {$core.config.custom_color_inventory_link}; }
                .nav-inventory > li > a:hover { color: {$core.config.custom_color_inventory_link_hover}; }
                .nav-inventory > li.active > a,
                .nav-inventory > li.active > a:focus,
                .nav-inventory > li.active > a:hover { color: {$core.config.custom_color_inventory_link_active}; }

                .navbar-default { background-color: {$core.config.custom_color_navbar_bg}; }
                .navbar-default .navbar-nav > li > a,
                .navbar-default .navbar-nav > li > a:focus { color: {$core.config.custom_color_navbar_link}; }
                .navbar-default .navbar-nav > li > a:hover { color: {$core.config.custom_color_navbar_link_hover}; }
                .navbar-default .navbar-nav > li.active > a,
                .navbar-default .navbar-nav > li.active > a:focus,
                .navbar-default .navbar-nav > li.active > a:hover { color: {$core.config.custom_color_navbar_link_active}; }

                .header {
                    {if $core.config.bg_header_use_color}
                        background: {$core.config.bg_header_color};
                    {elseif $core.config.bg_header}
                        background-image: url('{$core.page.nonProtocolUrl}uploads/{$core.config.bg_header}');
                    {/if}
                }

                .footer-blocks { background: {$core.config.footer_blocks_bg}; }
                .footer { background: {$core.config.footer_bg}; }
                .nav-footer > li > a,
                .nav-footer > li > a:focus { color: {$core.config.footer_link}; }
                .nav-footer > li > a:hover { color: {$core.config.footer_link_hover}; }
                .nav-footer > li.active > a,
                .nav-footer > li.active > a:focus,
                .nav-footer > li.active > a:hover { color: {$core.config.footer_link_active}; }
            </style>
        {/if}
    </head>

    <body class="page-{$core.page.name}">
        <div class="inventory">
            <div class="container">
                <div class="text-inventory">{lang key='inventory_text'}</div>
                {ia_blocks block='inventory'}
                {ia_blocks block='account'}
                {include 'language-selector.tpl'}
            </div>
        </div>

        <nav class="navbar navbar-default {if $core.config.navbar_sticky}navbar-sticky{/if}">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand{if !$core.config.enable_text_logo} navbar-brand--img{/if}" href="{$smarty.const.IA_URL}">
                        {if $core.config.enable_text_logo}
                            {$core.config.logo_text}
                        {else}
                            {if !empty($core.config.site_logo)}
                                <img src="{$core.page.nonProtocolUrl}uploads/{$core.config.site_logo}" alt="{$core.config.site}">
                            {else}
                                <img src="{$img}logo.png" alt="{$core.config.site}">
                            {/if}
                        {/if}
                    </a>
                </div>

                <div class="collapse navbar-collapse" id="navbar-collapse">
                    <form action="{$commerce.search.url}" class="search-navbar">
                        <div class="row">
                            <div class="col-sm-5">
                                <div class="form-control-select">
                                    <select class="form-control" name="category">
                                        <option value="">{lang key='any_category'}</option>
                                        {foreach $commerce.search.categories as $category}
                                            <option value="{$category.id}">{$category.title|escape}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-7">
                                <div class="input-group">
                                    <input type="text" name="text" class="form-control" value="{$commerce.search.text|escape}" placeholder="{lang key='i_am_shopping_for'}">
                                    <div class="input-group-btn">
                                        <button class="btn" type="submit" title="{lang key='search'}"><span class="fa fa-search"></span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    {ia_blocks block='cart'}
                    {if $member}
                        <a href="{$smarty.const.IA_URL}profile/wishlist/" class="wishlist-link">
                            <span class="fa fa-heart"></span> {lang key='wishlist'} (0)
                        </a>
                    {/if}
                    {ia_blocks block='mainmenu'}
                </div>
            </div>
        </nav>

        {ia_hooker name='smartyFrontBeforeBreadcrumb'}

        {include 'breadcrumb.tpl'}

        {if isset($iaBlocks.verytop)}
            <div class="verytop">
                <div class="container">{ia_blocks block='verytop'}</div>
            </div>
        {/if}

        <div class="content">
            <div class="container">
                {if in_array($core.page.name, array('login', 'registration'))}
                    <div class="page-system">
                        <div class="content__header">
                            <h1>{$core.page.title}</h1>
                            <ul class="content__actions">
                                {foreach $core.actions as $name => $action}
                                    <li>
                                        {if 'action-favorites' == $name}
                                            {printFavorites item=$item itemtype=$item.item guests=true}
                                        {else}
                                            <a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
                                                <span class="fa fa-{$name}"></span>
                                            </a>
                                        {/if}
                                    </li>
                                {/foreach}
                            </ul>
                        </div>

                        {ia_hooker name='smartyFrontBeforeNotifications'}
                        {include 'notification.tpl'}

                        {ia_hooker name='smartyFrontBeforeMainContent'}

                        <div class="content__body">
                            {$_content_}
                        </div>

                        {ia_hooker name='smartyFrontAfterMainContent'}
                    </div>
                {else}
                    <div class="row">
                        <div class="{width section='content' position='left' tag='col-md-'} aside">
                            {ia_blocks block='left'}
                        </div>
                        <div class="{width section='content' position='center' tag='col-md-'}">
                            <div class="content__wrap">

                                {ia_blocks block='top'}

                                <div class="content__header">
                                    <h1>{$core.page.title}</h1>
                                    <ul class="content__actions">
                                        {foreach $core.actions as $name => $action}
                                            <li>
                                                {if 'action-favorites' == $name}
                                                    {printFavorites item=$item itemtype=$item.item guests=true}
                                                {else}
                                                    <a data-toggle="tooltip" title="{$action.title}" {foreach $action.attributes as $key => $value}{$key}="{$value}" {/foreach}>
                                                        <span class="fa fa-{$name}"></span>
                                                    </a>
                                                {/if}
                                            </li>
                                        {/foreach}
                                    </ul>
                                </div>

                                {ia_hooker name='smartyFrontBeforeNotifications'}
                                {include 'notification.tpl'}

                                {ia_hooker name='smartyFrontBeforeMainContent'}

                                <div class="content__body">
                                    {$_content_}
                                </div>

                                {ia_hooker name='smartyFrontAfterMainContent'}

                                {ia_blocks block='bottom'}
                            </div>
                        </div>
                    </div>
                {/if}
            </div>
        </div>

        {if isset($iaBlocks.verybottom)}
            <div class="verybottom">
                <div class="container">{ia_blocks block='verybottom'}</div>
            </div>
        {/if}

        {if isset($iaBlocks.prefooter)}
            <div class="prefooter">
                {ia_blocks block='prefooter'}
            </div>
        {/if}

        <div class="footer-blocks">
            <div class="container">
                <div class="row">
                    <div class="{width section='footer-blocks' position='footer1' tag='col-md-'}">{ia_blocks block='footer1'}</div>
                    <div class="{width section='footer-blocks' position='footer2' tag='col-md-'}">{ia_blocks block='footer2'}</div>
                    <div class="{width section='footer-blocks' position='footer3' tag='col-md-'}">{ia_blocks block='footer3'}</div>
                    <div class="{width section='footer-blocks' position='footer4' tag='col-md-'}">{ia_blocks block='footer4'}</div>
                </div>

                <footer class="footer">
                    {ia_hooker name='smartyFrontBeforeFooterLinks'}

                    <div class="row">
                        <div class="col-md-6">
                            {ia_blocks block='copyright'}

                            <p>{lang key='footer_text'}</p>

                            {if $core.config.website_social}
                                <ul class="nav-footer nav-footer-social">
                                    {if $core.config.website_social_t}<li><a href="{$core.config.website_social_t}" class="twitter"><span class="fa fa-twitter"></span></a></li>{/if}
                                    {if $core.config.website_social_f}<li><a href="{$core.config.website_social_f}" class="facebook"><span class="fa fa-facebook"></span></a></li>{/if}
                                    {if $core.config.website_social_g}<li><a href="{$core.config.website_social_g}" class="google-plus"><span class="fa fa-google-plus"></span></a></li>{/if}
                                    {if $core.config.website_social_i}<li><a href="{$core.config.website_social_i}" class="linkedin"><span class="fa fa-linkedin"></span></a></li>{/if}
                                </ul>
                            {/if}


                        </div>
                        <div class="col-md-6">
                            <div class="payment-systems">
                                <img src="{if $core.config.payment_gateways_img}{$core.page.nonProtocolUrl}uploads/{$core.config.payment_gateways_img}{else}{$img}payment.png{/if}" alt="">
                            </div>
                            <p class="copyright">&copy; {$smarty.server.REQUEST_TIME|date_format:'%Y'} {lang key='powered_by_subrion'}</p>
                        </div>
                    </div>

                    {ia_hooker name='smartyFrontAfterFooterLinks'}
                </footer>
            </div>
        </div>

        <button class="back-to-top js-back-to-top"><span class="fa fa-angle-double-up"></span></button>

        <!-- SYSTEM STUFF -->

        {if $core.config.cron}
            <div style="display: none;">
                <img src="{$core.page.nonProtocolUrl}cron/?{randnum}" width="1" height="1" alt="">
            </div>
        {/if}

        {if isset($manageMode)}
            {include 'visual-mode.tpl'}
        {/if}

        {if isset($previewMode)}
            <p>{lang key='youre_in_preview_mode'}</p>
        {/if}

        {ia_print_js display='on'}

        {ia_hooker name='smartyFrontFinalize'}
    </body>
</html>