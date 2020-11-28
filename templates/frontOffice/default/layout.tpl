<!DOCTYPE html>
<!--
 ______   __  __     ______     __         __     ______
/\__  _\ /\ \_\ \   /\  ___\   /\ \       /\ \   /\  __ \
\/_/\ \/ \ \  __ \  \ \  __\   \ \ \____  \ \ \  \ \  __ \
   \ \_\  \ \_\ \_\  \ \_____\  \ \_____\  \ \_\  \ \_\ \_\
    \/_/   \/_/\/_/   \/_____/   \/_____/   \/_/   \/_/\/_/


Copyright (c) OpenStudio
email : info@thelia.net
web : http://www.thelia.net

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the
GNU General Public License : http://www.gnu.org/licenses/
-->

{* Declare assets directory, relative to template base directory *}
{declare_assets directory='assets/dist'}
{* Set the default translation domain, that will be used by {intl} when the 'd' parameter is not set *}
{default_translation_domain domain='fo.default'}

{* -- Define some stuff for Smarty ------------------------------------------ *}
{config_load file='variables.conf'}
{block name="init"}{/block}
{block name="no-return-functions"}{/block}
{assign var="store_name" value={config key="store_name"}}
{assign var="store_description" value={config key="store_description"}}
{assign var="lang_code" value={lang attr="code"}}
{assign var="lang_locale" value={lang attr="locale"}}
{if not $store_name}{assign var="store_name" value={intl l='Thelia V2'}}{/if}
{if not $store_description}{assign var="store_description" value={$store_name}}{/if}

{* paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither *}
<!--[if lt IE 7 ]><html class="no-js oldie ie6" lang="{$lang_code}"> <![endif]-->
<!--[if IE 7 ]><html class="no-js oldie ie7" lang="{$lang_code}"> <![endif]-->
<!--[if IE 8 ]><html class="no-js oldie ie8" lang="{$lang_code}"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="{$lang_code}" class="no-js"> <!--<![endif]-->
<head>
    {hook name="main.head-top"}
    {* Test if javascript is enabled *}
    <script>(function(H) { H.className=H.className.replace(/\bno-js\b/,'js') } )(document.documentElement);</script>

    <meta charset="UTF-8">

    {* Page Title *}
    <title>{block name="page-title"}{strip}{if $page_title}{$page_title}{elseif $breadcrumbs}{foreach from=$breadcrumbs|array_reverse item=breadcrumb}{$breadcrumb.title|unescape} - {/foreach}{$store_name}{else}{$store_name}{/if}{/strip}{/block}</title>

    {* Meta Tags *}
    <meta name="generator" content="{intl l='Thelia V2'}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    {block name="meta"}
        <meta name="description" content="{if $page_description}{$page_description}{else}{$store_description|strip|truncate:120}{/if}">
    {/block}

    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
{*

    <!-- Core Stylesheet -->
    {stylesheets file='assets/dist/css/thelia.min.css'}
        <link rel="stylesheet" href="{$asset_url}">
    {/stylesheets}
*}
    {stylesheets file='assets/src/style.css'}
        <link rel="stylesheet" href="{$asset_url}">
    {/stylesheets}
    {*
     If you want to generate the CSS assets on the fly, just replace the stylesheet inclusion above by the following.
     Then, in your back-office, go to Configuration -> System Variables and set process_assets to 1.
     Now, when you're accessing the front office in developpement mode (index_dev.php)  the CSS is recompiled when a
     change in the source files is detected.

     See http://doc.thelia.net/en/documentation/templates/assets.html#activate-automatic-assets-generation for details.

    {stylesheets file='assets/src/less/thelia.less' filters='less'}
        <link rel="stylesheet" href="{$asset_url}">
    {/stylesheets}

    *}

    {hook name="main.stylesheet"}

    {block name="stylesheet"}{/block}

    {* Favicon *}
    {* PNG file favicons are not supported by IE 10 and lower. In this case, we use the default .ico file in the template. *}

    <!--[if lt IE 11]>
    <link rel="shortcut icon" type="image/x-icon" href="{image file='assets/src/img/core-img/favicon.ico'}" />
    <![endif]-->

    {local_media type="favicon" width=32 height=32}
        <link rel="icon" type="{$MEDIA_MIME_TYPE}" href="{$MEDIA_URL}" />
    {/local_media}

    {* Feeds *}
    <link rel="alternate" type="application/rss+xml" title="{intl l='All products'}" href="{url path="/feed/catalog/%lang" lang=$lang_locale}" />
    <link rel="alternate" type="application/rss+xml" title="{intl l='All contents'}" href="{url path="/feed/content/%lang" lang=$lang_locale}" />
    <link rel="alternate" type="application/rss+xml" title="{intl l='All brands'}"   href="{url path="/feed/brand/%lang" lang=$lang_locale}" />
    {block name="feeds"}{/block}

    {* HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries *}
    <!--[if lt IE 9]>
    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
    {javascripts file="assets/dist/js/vendors/html5shiv.min.js"}
        <script>window.html5 || document.write('<script src="{$asset_url}"><\/script>');</script>
    {/javascripts}

    <script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.js"></script>
    {javascripts file="assets/dist/js/vendors/respond.min.js"}
        <script>window.respond || document.write('<script src="{$asset_url}"><\/script>');</script>
    {/javascripts}
    <![endif]-->

    {hook name="main.head-bottom"}
</head>

<body class="{block name="body-class"}{/block}"  itemscope itemtype="http://schema.org/WebPage">
{hook name="main.body-top"}

<!-- Preloader -->
<div class="preloader d-flex align-items-center justify-content-center">
    <div class="preloader-circle"></div>
    <div class="preloader-img">
        <img src="{image file='assets/src/img/core-img/leaf.png'}" alt="">
    </div>
</div>


<!-- ##### Header Area Start ##### -->
<header class="header-area"  itemscope itemtype="http://schema.org/WPHeader">
    {hook name="main.header-top"}

    <!-- ***** Top Header Area ***** -->
    <div class="top-header-area"  itemscope itemtype="http://schema.org/SiteNavigationElement">
        <div class="container">
            <div class="row">
                <div class="col-12">

                    {ifhook rel="main.navbar-secondary"}
                        {* Place everything within .nav-collapse to hide it until above 768px *}
                        <nav class="top-header-content d-flex align-items-center justify-content-between" role="navigation" aria-label="{intl l="Secondary Navigation"}">
                            <!-- Top Header Content -->
                            <div class="top-header-meta">
                                <a href="#" data-toggle="tooltip" data-placement="bottom" title="infodeercreative@gmail.com"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span>Email: infodeercreative@gmail.com</span></a>
                                <a href="#" data-toggle="tooltip" data-placement="bottom" title="+1 234 122 122"><i class="fa fa-phone" aria-hidden="true"></i> <span>Call Us: +1 234 122 122</span></a>
                            </div>
                            <div class="top-header-meta d-flex">
                            {hook name="main.navbar-secondary"}
                            </div>
                        </nav>
                    {/ifhook}
                </div>
            </div>
        </div>
    </div>

    <!-- ***** Navbar Area ***** -->
    <div class="alazea-main-menu">
        <div class="classy-nav-container breakpoint-off">
            <div class="container">
                <!-- Menu -->
                <nav class="classy-navbar justify-content-between" id="alazeaNav">

                    <!-- Nav Brand -->
                    <a href="{navigate to="index"}" title="{$store_name}"  class="nav-brand">
                        {local_media type="logo"}
                            <img src="{$MEDIA_URL}" alt="{$store_name}" width="133">
                        {/local_media}
                    </a>
                    <!-- Navbar Toggler -->
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>

                    <!-- Menu -->
                    <div class="classy-menu">

                        <!-- Close Button -->
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>

                        <!-- Navbar Start -->
                        <nav class="classynav" role="navigation" itemscope itemtype="http://schema.org/SiteNavigationElement">
                        {hook name="main.navbar-primary"}
                        </nav>
                        <!-- Navbar End -->
                    </div>
                </nav>
                <!-- Search Form -->
                <div class="search-form">
                    <form action="{url path="/search"} method="get" role="search">
                        <input type="search" name="search" id="search" placeholder="{intl l="Search..." d="hooksearch.fo.default"}"  search="hooksearch.fo.default"}">
                        <button type="{intl l="Search" d="hooksearch.fo.default"}" class="d-none"></button>
                    </form>
                    <!-- Close Icon -->
                    <div class="closeIcon"><i class="fa fa-times" aria-hidden="true"></i></div>
                </div>
                {hook name="main.header-bottom"}
            </div>
        </div>
    </div>
</header>
<!-- ##### Header Area End ##### -->
{hook name="main.content-top"}
{block name="breadcrumb"}{include file="misc/breadcrumb.tpl"}{/block}
{block name="main-content"}{/block}
{hook name="main.content-bottom"}
<!-- ##### Footer Area Start ##### -->
    {ifhook rel="main.footer-top"}
<footer class="footer-area bg-img" style="background-image: url({image file='assets/src/img/bg-img/3.jpg'});" itemscope itemtype="http://schema.org/WPFooter">
        <!-- Main Footer Area -->
        <div class="main-footer-area">
            <div class="container">
                <div class="row">
                    {hook name="main.footer-top"}
                </div>
            </div>
        </div>
</footer>
    {/ifhook}
    {elsehook rel="main.footer-top"}
<section class="footer-container" itemscope itemtype="http://schema.org/WPFooter">
    <section class="footer-banner">
        <div class="container">
            <div class="banner row banner-col-3">
                <div class="col col-sm-4">
                    <span class="fa fa-truck fa-flip-horizontal"></span>
                    {intl l="Free shipping"} <small>{intl l="Orders over $50"}</small>
                </div>
                <div class="col col-sm-4">
                    <span class="fa fa-credit-card"></span>
                    {intl l="Secure payment"} <small>{intl l="Multi-payment platform"}</small>
                </div>
                <div class="col col-sm-4">
                    <span class="fa fa-info"></span>
                    {intl l="Need help ?"} <small>{intl l="Questions ? See our F.A.Q."}</small>
                </div>
            </div>
        </div>
    </section><!-- /.footer-banner -->
</section>
    {/elsehook}

    {ifhook rel="main.footer-body"}
<footer class="footer-area bg-img" style="background-image: url({image file='assets/src/img/bg-img/3.jpg'});" itemscope itemtype="http://schema.org/WPFooter">
    <section class="main-footer-area">
            <div class="container">
                <div class="row">
                    {hookblock name="main.footer-body"  fields="id,class,title,content"}
                    {forhook rel="main.footer-body"}

                    <!-- Single Footer Widget -->
                    <div class="col-12 col-sm-6 col-lg-3">
                            <section {if $id} id="{$id}"{/if} class="single-footer-widget">
                                <div class="widget-title"><h5>{$title}</h5></div>
                                <div class="{if $class}{$class}{/if}">
                                    {$content nofilter}
                                </div>
                            </section>
                        </div>
                    {/forhook}
                    {/hookblock}
                </div>
            </div>
        </section>
</footer>
    {/ifhook}

    {ifhook rel="main.footer-bottom"}
<footer class="footer-area bg-img" style="background-image: url({image file='assets/src/img/bg-img/3.jpg'});" itemscope itemtype="http://schema.org/WPFooter">
<!-- Footer Bottom Area -->
        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="border-line"></div>
                    </div>
                    <!-- Copywrite Text -->
                    <div class="col-12 col-md-6">
                        <div class="copywrite-text">
                            <p>&copy; <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved {*| This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>*}
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>
                        </div>
                    </div>
                    <!-- Footer Nav -->
                    <div class="col-12 col-md-6">
                        <div class="footer-nav">
                                {hook name="main.footer-bottom"}
                        </div>
                    </div>
                </div>
            </div>
        </div>
</footer>
    {/ifhook}
    {elsehook rel="main.footer-bottom"}
<footer class="footer-area bg-img" style="background-image: url({image file='assets/src/img/bg-img/3.jpg'});" itemscope itemtype="http://schema.org/WPFooter">
<!-- Footer Bottom Area -->
        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="border-line"></div>
                    </div>
                    <!-- Copywrite Text -->
                    <div class="col-12 col-md-6">
                        <div class="copywrite-text">
                            <p>&copy; <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>
                        </div>
                    </div>
                    <!-- Footer Nav -->
                    <div class="col-12 col-md-6">
                        <div class="footer-nav">
                            <nav>
                                <ul>
                                    <li><a href="#">Home</a></li>
                                    <li><a href="#">About</a></li>
                                    <li><a href="#">Service</a></li>
                                    <li><a href="#">Portfolio</a></li>
                                    <li><a href="#">Blog</a></li>
                                    <li><a href="#">Contact</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</footer>
    {/elsehook}
<!-- ##### Footer Area End ##### -->

<!-- ##### All Javascript Files ##### -->
{block name="before-javascript-include"}{/block}
<!-- JavaScript -->

<!-- Jquery -->
<!--[if lt IE 9]><script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script><!--<![endif]-->
{*
<!-- jQuery-2.2.4 js -->
{javascripts file="assets/src/js/jquery/jquery-2.2.4.min.js"}
    <script>window.jQuery || document.write('<script src="{$asset_url}"><\/script>');</script>
{/javascripts}*}
<!-- jQuery-2.2.4 js -->
<script src="https://code.jquery.com/jquery-3.0.0.js"></script>
<script src="https://code.jquery.com/jquery-migrate-3.3.0.js"></script>

<script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
{* do no try to load messages_en, as this file does not exists *}
{if $lang_code != 'en'}
    <script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/localization/messages_{$lang_code}.js"></script>
{/if}

<!-- Popper js -->
<script src="{javascript file='assets/src/js/bootstrap/popper.min.js'}"></script>
<!-- Bootstrap js -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
{javascripts file="assets/src/js/bootstrap/bootstrap.min.js"}
    <script>if(typeof($.fn.modal) === 'undefined') { document.write('<script src="{$asset_url}"><\/script>'); }</script>
{/javascripts}

{javascripts file="assets/dist/js/vendors/bootbox.js"}
    <script src="{$asset_url}"></script>
{/javascripts}

{hook name="main.after-javascript-include"}

{block name="after-javascript-include"}{/block}

{hook name="main.javascript-initialization"}
<script>
    // fix path for addCartMessage
    // if you use '/' in your URL rewriting, the cart message is not displayed
    // addCartMessageUrl is used in thelia.js to update the mini-cart content
    var addCartMessageUrl = "{url path='ajax/addCartMessage'}";
</script>
{block name="javascript-initialization"}{/block}

<!-- Custom scripts -->
<script src="{javascript file='assets/dist/js/thelia.min.js'}"></script>
<!-- All Plugins js -->
<script src="{javascript file='assets/src/js/plugins/plugins.js'}"></script>
<!-- Active js -->
<script src="{javascript file='assets/src/js/active.js'}"></script>

{hook name="main.body-bottom"}

</body>

</html>