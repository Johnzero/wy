<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<!--[if IE 8]>
<html class="ie ie8">
<![endif]-->
<!--[if IE 9]>
<html class="ie ie9">
<![endif]-->
<!--[if gt IE 9]>
<!-->
<html>
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <title><?php echo ($site_seo_title); ?> <?php echo ($site_name); ?></title>
    <meta name="keywords" content="<?php echo ($site_seo_keywords); ?>" />
    <meta name="description" content="<?php echo ($site_seo_description); ?>">
    <meta name="author" content="wangsong1233276@sina.com">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Library CSS -->
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <link rel="stylesheet" href="/static/css/fonts/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="/static/css/animations.css" media="screen">
    <link rel="stylesheet" href="/static/css/superfish.css" media="screen">
    <link rel="stylesheet" href="/static/css/revolution-slider/css/settings.css" media="screen">
    <link rel="stylesheet" href="/static/css/prettyPhoto.css" media="screen">
    <!-- Theme CSS -->
    <link rel="stylesheet" href="/static/css/style.css">
    <!-- Skin -->
    <link rel="stylesheet" href="/static/css/colors/green.css" id="colors">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="/static/css/theme-responsive.css">
    <!-- Switcher CSS -->
    <link href="/static/css/switcher.css" rel="stylesheet">
    <link href="/static/css/spectrum.css" rel="stylesheet">
    <!-- Favicons -->
    <link rel="shortcut icon" href="/static/img/ico/favicon.ico">
    <link rel="apple-touch-icon" href="/static/img/ico/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/static/img/ico/apple-touch-icon-72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/static/img/ico/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/static/img/ico/apple-touch-icon-144.png">
    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
        <script src="/static///html5shim.googlecode.com/svn/trunk/html5.js">
        </script>
        <script src="/static/js/respond.min.js">
        </script>
    <![endif]-->
    <!--[if IE]>
        <link rel="stylesheet" href="/static/css/ie.css">
    <![endif]-->
</head>

<body class="home">
    <div class="wrap">
        <!-- Header Start -->
        <header id="header">
            <!-- Header Top Bar Start -->
            <div class="top-bar">
                <div class="slidedown collapse">
                    <div class="container">
                        <div class="phone-email pull-left">
                            <a>
                                <i class="icon-phone">
                                </i>
                                电话 : <?php echo ($site_admin_tel); ?>
                            </a>
                            <a href="/static/mail%40example.html">
                                <i class="icon-envelope">
                                </i>
                                邮件 : <?php echo ($site_admin_email); ?>
                            </a>
                        </div>
                        <div class="pull-right">
                            <ul class="social pull-left">
                                <li class="facebook">
                                    <a href="/static/#">
                                        <i class="icon-facebook">
                                        </i>
                                    </a>
                                </li>
                                <li class="twitter">
                                    <a href="/static/#">
                                        <i class="icon-twitter">
                                        </i>
                                    </a>
                                </li>
                                <li class="dribbble">
                                    <a href="/static/#">
                                        <i class="icon-dribbble">
                                        </i>
                                    </a>
                                </li>
                                <li class="linkedin">
                                    <a href="/static/#">
                                        <i class="icon-linkedin">
                                        </i>
                                    </a>
                                </li>
                                <li class="rss">
                                    <a href="/static/#">
                                        <i class="icon-rss">
                                        </i>
                                    </a>
                                </li>
                            </ul>
                            <ul class="nav pull-right" id="main-menu-left">
                                <li class="dropdown">
                                <?php if(sp_is_user_login()): ?><a class="dropdown-toggle user" data-toggle="dropdown" href="#">
                                    <?php if(empty($user['avatar'])): ?><img src="/tpl/simplebootx//Public/images/headicon.png" class="headicon"/>
                                    <?php else: ?>
                                    <img src="<?php echo sp_get_user_avatar_url($user['avatar']);?>" class="headicon"/><?php endif; ?>
                                    <?php echo ($user["user_nicename"]); ?><b class="caret"></b></a>
                                    <ul class="dropdown-menu pull-right">
                                       <li><a href="<?php echo u('user/center/index');?>"><i class="fa fa-user"></i> &nbsp;个人中心</a></li>
                                       <li class="divider"></li>
                                       <li><a href="<?php echo u('user/index/logout');?>"><i class="fa fa-sign-out"></i> &nbsp;退出</a></li>
                                    </ul>
                                <?php else: ?>
                                    <a class="dropdown-toggle user" data-toggle="dropdown" href="#">
                                        <img src="/tpl/simplebootx//Public/images/headicon.png" class="headicon"/>登录<b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                       <li><a href="<?php echo U('api/oauth/login',array('type'=>'sina'));?>"><i class="fa fa-weibo"></i> &nbsp;微博登录</a></li>
                                       <li><a href="<?php echo U('api/oauth/login',array('type'=>'qq'));?>"><i class="fa fa-qq"></i> &nbsp;QQ登录</a></li>
                                       <li><a href="<?php echo u('user/login/index');?>"><i class="fa fa-sign-in"></i> &nbsp;登录</a></li>
                                       <li class="divider"></li>
                                       <li><a href="<?php echo u('user/register/index');?>"><i class="fa fa-user"></i> &nbsp;注册</a></li>
                                    </ul><?php endif; ?>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header Top Bar End -->
            <!-- Main Header Start -->
            <div class="main-header">
                <div class="container">
                    <!-- TopNav Start -->
                    <div class="topnav navbar-header">
                        <a class="navbar-toggle down-button" data-toggle="collapse" data-target=".slidedown">
                            <i class="icon-angle-down icon-current">
                            </i>
                        </a>
                    </div>
                    <!-- TopNav End -->
                    <!-- Logo Start -->
                    <div class="logo pull-left">
                        <h1>
                            <a href="/">
                                <img src="/static/img/logo.jpg" alt="pixma" width="340" height="70">
                            </a>
                        </h1>
                    </div>
                    <!-- Logo End -->
                    <!-- Mobile Menu Start -->
                    <div class="mobile navbar-header">
                        <a class="navbar-toggle" data-toggle="collapse" href="/static/.html">
                            <i class="icon-reorder icon-2x">
                            </i>
                        </a>
                    </div>
                    <!-- Mobile Menu End -->
                    <!-- Menu Start -->
                    <nav class="collapse navbar-collapse menu">
                        <ul class="nav navbar-nav sf-menu">
                            <li><a id="current" href="/static/contact.html">首页</a></li>
                            <li>
                               <a>
                                    走进微赢
                                   <span class="sf-sub-indicator">
                                   <i class="icon-angle-down "></i>
                                   </span>
                               </a>
                               <ul>
                                  <li><a href="<?php echo U('portal/article/index',array('id'=>2));?>" class="sf-with-ul" target="_blank">微赢简介</a></li>
                                  <li><a href="/static/index-4.html" class="sf-with-ul" target="_blank">微赢动态</a></li>
                                  <li><a href="/static/index-nivo.html" class="sf-with-ul" target="_blank">微赢团队</a></li>
                                  <li><a href="/static/index-nivo.html" class="sf-with-ul" target="_blank">微赢风貌</a></li>
                               </ul>
                            </li>
                            <li>
                               <a class="sf-with-ul">
                               品牌动态 
                               <span class="sf-sub-indicator">
                               <i class="icon-angle-down "></i>
                               </span>
                               </a>
                               <ul>
                                  <li><a href="/static/shortcodes.html" class="sf-with-ul" target="_blank">品牌简介</a></li>
                                  <li><a href="/static/icons.html" class="sf-with-ul" target="_blank">品牌专利</a></li>
                                  <li><a href="/static/pricing-table.html" class="sf-with-ul" target="_blank">产品安全</a></li>
                                  <li style="display:none;">
                                     <a href="/static/#" class="sf-with-ul"> 
                                     Third Level Menu 
                                     <span class="sf-sub-indicator pull-right">
                                     <i class="icon-angle-right "></i>
                                     </span>
                                     </a>
                                     <ul>
                                        <li><a href="/static/#" class="sf-with-ul" target="_blank">Menu Item</a></li>
                                        <li><a href="/static/#" class="sf-with-ul" target="_blank">Menu Item</a></li>
                                        <li><a href="/static/#" class="sf-with-ul" target="_blank">Menu Item</a></li>
                                     </ul>
                                  </li>
                               </ul>
                            </li>
                            <li>
                               <a class="sf-with-ul">
                               微赢商学院
                               <span class="sf-sub-indicator">
                               <i class="icon-angle-down "></i>
                               </span>
                               </a>
                               <ul>
                                  <li><a href="/static/about.html" class="sf-with-ul" target="_blank">学院介绍</a></li>
                                  <li><a href="/static/services.html" class="sf-with-ul" target="_blank">师资团队</a></li>
                                  <li><a href="/static/testimonials.html" class="sf-with-ul" target="_blank">课程大纲</a></li>
                               </ul>
                            </li>
                            <li>
                               <a class="sf-with-ul">
                               会员中心
                               <span class="sf-sub-indicator">
                               <i class="icon-angle-down "></i>
                               </span>
                               </a>
                               <ul>
                                  <li><a href="/static/portfolio-two.html" class="sf-with-ul" target="_blank">授权查询</a></li>
                                  <li><a href="/static/portfolio-three.html" class="sf-with-ul" target="_blank">加盟政策</a></li>
                               </ul>
                            </li>

                            <li>
                               <a href="/static/#" class="sf-with-ul">
                               会员登录
                               <span class="sf-sub-indicator">
                               <i class="icon-user"></i>
                               </span>
                               </a><ul class="display"></ul>
                            </li>
                           
                        </ul>
                        </nav>
                    <!-- Menu End -->
                </div>
            </div>
            <!-- Main Header End -->
        </header>
        <!-- Header End -->


<!-- Content Start -->
<div id="main">
    <!-- Slider Start-->
    <div class="fullwidthbanner-container">
        <div class="fullwidthbanner rslider">
            <ul>
                <!-- THE FIRST SLIDE -->
                <li data-delay="6000" data-masterspeed="300" data-transition="fade">
                    <div class="slotholder">
                        <img src="/static/img/slider/slider-bg-1.jpg" data-fullwidthcentering="on" alt="Pixma">
                    </div>
                    <div class="caption modern_big_bluebg h1 lft tp-caption start" data-x="40"
                    data-y="85" data-speed="700" data-endspeed="800" data-start="1000" data-easing="easeOutQuint"
                    data-endeasing="easeOutQuint">
                        <h3>
                            我们的产品
                        </h3>
                    </div>
                    <div class="caption list_slide lfb tp-caption start" data-easing="easeOutExpo"
                    data-start="1400" data-speed="1050" data-y="180" data-x="40">
                        <div class="list-slide">
                            <i class="icon-camera slide-icon">
                            </i>
                            <h5 class="dblue">
                                10 predefined color skins
                            </h5>
                        </div>
                    </div>
                    <div class="caption list_slide lfb tp-caption start" data-easing="easeOutExpo"
                    data-start="1800" data-speed="1200" data-y="220" data-x="40">
                        <div class="list-slide">
                            <i class="icon-search slide-icon">
                            </i>
                            <h5 class="dblue">
                                SEO optimized template files
                            </h5>
                        </div>
                    </div>
                    <div class="caption list_slide lfb tp-caption start" data-easing="easeOutExpo"
                    data-start="2200" data-speed="1350" data-y="260" data-x="40">
                        <div class="list-slide">
                            <i class="icon-code slide-icon">
                            </i>
                            <h5 class="dblue">
                                Working Ajax Contact Form
                            </h5>
                        </div>
                    </div>
                    <div class="caption lfb caption_button_1 fadeout tp-caption start" data-x="40"
                    data-y="330" data-speed="900" data-endspeed="300" data-start="2700" data-hoffset="-70"
                    data-easing="easeOutExpo">
                        <a class="btn-special hidden-xs btn-grey" href="/static/#">
                            详细了解
                        </a>
                    </div>
                    <div class="caption lfb caption_button_2 fadeout tp-caption start" data-x="210"
                    data-y="330" data-speed="800" data-endspeed="300" data-start="2900" data-hoffset="70"
                    data-easing="easeOutExpo">
                        <a class="btn-special hidden-xs btn-color" href="/static/#">
                            立即购买
                        </a>
                    </div>
                </li>
                <!-- THE RESPONSIVE SLIDE -->
                <li data-transition="fade" data-slotamount="1" data-masterspeed="300">
                    <img src="/static/img/slider/slider-bg-2.jpg" data-fullwidthcentering="on" alt="">
                    <div class="caption large_text sft" data-x="660" data-y="54" data-speed="300"
                    data-start="800" data-easing="easeOutExpo">
                        TOUCH ENABLED
                    </div>
                    <div class="caption medium_text sfl" data-x="689" data-y="92" data-speed="300"
                    data-start="1100" data-easing="easeOutExpo">
                        AND
                    </div>
                    <div class="caption large_text sfr" data-x="738" data-y="88" data-speed="300"
                    data-start="1100" data-easing="easeOutExpo">
                        <span class="dblue">
                            RESPONSIVE
                        </span>
                    </div>
                    <div class="caption list_slide lfb tp-caption start" data-easing="easeOutExpo"
                    data-start="1400" data-speed="1050" data-y="180" data-x="660">
                        <div class="list-slide">
                            <i class="icon-eye-open slide-icon">
                            </i>
                            <h5>
                                Retina Ready
                            </h5>
                        </div>
                    </div>
                    <div class="caption list_slide lfb tp-caption start" data-easing="easeOutExpo"
                    data-start="1800" data-speed="1200" data-y="220" data-x="660">
                        <div class="list-slide">
                            <i class="icon-table slide-icon">
                            </i>
                            <h5>
                                Responsive pricing tables
                            </h5>
                        </div>
                    </div>
                    <div class="caption list_slide lfb tp-caption start" data-easing="easeOutExpo"
                    data-start="2200" data-speed="1350" data-y="260" data-x="660">
                        <div class="list-slide">
                            <i class="icon-ok slide-icon">
                            </i>
                            <h5>
                                Crossbrowser Compatible
                            </h5>
                        </div>
                    </div>
                    <div class="caption list_slide lfb tp-caption start" data-easing="easeOutExpo"
                    data-start="2600" data-speed="1350" data-y="300" data-x="660">
                        <div class="list-slide">
                            <i class="icon-twitter slide-icon">
                            </i>
                            <h5>
                                Twitter 1.1 API Support
                            </h5>
                        </div>
                    </div>
                    <div class="caption list_slide lfb tp-caption start" data-easing="easeOutExpo"
                    data-start="3000" data-speed="1350" data-y="340" data-x="660">
                        <div class="list-slide">
                            <i class="icon-th slide-icon">
                            </i>
                            <h5>
                                Bootstrap Framework
                            </h5>
                        </div>
                    </div>
                    <div class="caption lfl" data-x="53" data-y="30" data-speed="300" data-start="1400"
                    data-easing="easeOutExpo">
                        <img src="/static/img/slider/responsive-imac.png" alt="iMac Responsive">
                    </div>
                    <div class="caption lfl" data-x="323" data-y="145" data-speed="300" data-start="1500"
                    data-easing="easeOutExpo">
                        <img src="/static/img/slider/responsive-ipad.png" alt="iPad Responsive">
                    </div>
                    <div class="caption lfl" data-x="472" data-y="253" data-speed="300" data-start="1600"
                    data-easing="easeOutExpo">
                        <img src="/static/img/slider/responsive-iphone.png" alt="iPhone Responsive">
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!-- Slider End-->
    <!-- Slogan Start-->
    <!-- <div class="slogan">
        <div class="container">
            <div class="row">
                <div class="slogan-content">
                    <div class="col-lg-9 col-md-9">
                        <h2 class="slogan-title">
                            帮助微赢所有经销商客户，帮助80后90后实现创业梦想！
                        </h2>
                    </div>
                    <div class="col-lg-3 col-md-3">
                        <div class="get-started">
                            <button class="btn btn-special btn-color pull-right">
                                经销商登陆
                            </button>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    <!-- Slogan End-->
    <!-- Main Content start-->
    
    <!-- Main Content end-->
    <!-- Recent works start-->
    <div class="recentworks">
        <div class="container">
          <div class="row">
             <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 animate_afl d1">
                <div class="portfolio-desc">
                   <h3 class="title">公司简介</h3>
                   <p>公司秉承“微信，让世界认识你。”的企业宗旨，紧跟时代步伐，自主创新，依托强大的互联网平台，结合顶尖产品研发团队，通过整合移动领域核心技术、微营销、互联网、顶级策划人才、运营人才、高级工程师、优质资源打破传统商业模式，实现线上线下同步推广销售，让每一位消费者以最便捷的方式最合理的价格，用上好产品。</p>
                   <div class="carousel-controls">
                      <a class="prev" href="/static/#portfolio-carousel" data-slide="prev"><i class="icon-angle-left"></i></a>
                      <a class="next" href="/static/#portfolio-carousel" data-slide="next"><i class="icon-angle-right"></i></a>
                      <div class="clearfix"></div>
                   </div>
                </div>
             </div>
             <div class="col-lg-8 col-md-8 col-xs-12">
                <div class="row">
                   <div id="portfolio-carousel" class="portfolio-carousel slide">
                      <div class="carousel-inner">
                         <div class="item active">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 item animate_afc d2">
                               <div class="portfolio-item">
                                  <a href="/static/img/portfolio/po_1.jpg" class="portfolio-item-link" data-rel="prettyPhoto" >
                                  <span class="portfolio-item-hover"></span>
                                  <span class="fullscreen"><i class="icon-search"></i></span><img src="/static/img/portfolio/po_1.jpg" alt=" "/>
                                  </a>
                                  <div class="portfolio-item-title">
                                     <a href="/static/single-project.html">刘总</a>
                                     <p>
                                        刘兴隆
                                     </p>
                                  </div>
                                  <div class="clearfix"></div>
                               </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 item animate_afc d3">
                               <div class="portfolio-item">
                                  <a href="/static/img/portfolio/po_2.jpg" class="portfolio-item-link" data-rel="prettyPhoto" >
                                  <span class="portfolio-item-hover"></span><span class="fullscreen"><i class="icon-search"></i></span><img src="/static/img/portfolio/po_2_1.jpg" alt=" "/>
                                  </a>
                                  <div class="portfolio-item-title">
                                     <a href="/static/single-project.html">康总</a>
                                     <p>
                                        康咏铧
                                     </p>
                                  </div>
                                  <div class="clearfix"></div>
                               </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 item animate_afc d4">
                               <div class="portfolio-item">
                                  <a href="/static/img/portfolio/po_3.jpg" class="portfolio-item-link" data-rel="prettyPhoto" >
                                  <span class="portfolio-item-hover"></span><span class="fullscreen"><i class="icon-search"></i></span><img src="/static/img/portfolio/po_3_1.jpg" alt=" "/>
                                  </a>
                                  <div class="portfolio-item-title">
                                     <a href="/static/single-project.html">营销策划师</a>
                                     <p>
                                        特聘讲师
                                     </p>
                                  </div>
                                  <div class="clearfix"></div>
                               </div>
                            </div>
                         </div>
                         <div class="item">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 item">
                               <div class="portfolio-item">
                                  <a href="/static/img/portfolio/portfolio-4.jpg" class="portfolio-item-link" data-rel="prettyPhoto" >
                                  <span class="portfolio-item-hover"></span><span class="fullscreen"><i class="icon-search"></i></span><img src="/static/img/portfolio/portfolio-4.jpg" alt=" "/>
                                  </a>
                                  <div class="portfolio-item-title">
                                     <a href="/static/single-project.html">Camera Icon</a>
                                     <p>
                                        Icon / Device
                                     </p>
                                  </div>
                                  <div class="clearfix"></div>
                               </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 item">
                               <div class="portfolio-item">
                                  <a href="/static/img/portfolio/portfolio-5.jpg" class="portfolio-item-link" data-rel="prettyPhoto" >
                                  <span class="portfolio-item-hover"></span><span class="fullscreen"><i class="icon-search"></i></span><img src="/static/img/portfolio/portfolio-5.jpg" alt=" "/>
                                  </a>
                                  <div class="portfolio-item-title">
                                     <a href="/static/single-project.html">Penguin</a>
                                     <p>
                                        Animal / Nature
                                     </p>
                                  </div>
                                  <div class="clearfix"></div>
                               </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 item">
                               <div class="portfolio-item">
                                  <a href="/static/images/portfolio/portfolio-6.html" class="portfolio-item-link" data-rel="prettyPhoto" >
                                  <span class="portfolio-item-hover"></span><span class="fullscreen"><i class="icon-search"></i></span><img src="/static/img/portfolio/portfolio-6.jpg" alt=" "/>
                                  </a>
                                  <div class="portfolio-item-title">
                                     <a href="/static/single-project.html">Sound Box</a>
                                     <p>
                                        Audio / Sound
                                     </p>
                                  </div>
                                  <div class="clearfix"></div>
                               </div>
                            </div>
                         </div>
                      </div>
                   </div>
                   <div class="clearfix"></div>
                </div>
             </div>
          </div>
       </div>
    </div>
    <!-- Recent work end-->

    <div class="service-reasons bottom-pad">
       <div class="container">
          <div class="row">
             <!-- <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h3 class="title">我们的特点</h3>
             </div> -->
             <div class="divider"></div>
             <div class="reasons">
                <div class="col-lg-4 col-md-4 col-sm-4 animate_afc d1">
                   <div class="content-box big ch-item bottom-pad-small">
                      <div class="ch-info-wrap">
                         <div class="ch-info">
                            <div class="ch-info-front ch-img-1"><i class="icon-bullhorn"></i></div>
                            <div class="ch-info-back">
                               <i class="icon-bullhorn"></i>
                            </div>
                         </div>
                      </div>
                      <div class="content-box-info">
                          <h3>媒体报道</h3>
                          <p>错过了十年前的淘宝， 你还要错过今天的微商吗？ 2015“首届中国微商博览会·暨微商&O2O行业发展趋势论坛”，由中国微商联盟和沸点天下（中国）联合主办。  中国微商博览会对微商行业的发展意义深远，将行业……
                          </p>
                          <a href="/static/#">阅读全文 <i class="icon-angle-right"></i><i class="icon-angle-right"></i></a>
                       </div>
                   </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 animate_afc d2">
                   <div class="content-box big ch-item bottom-pad-small">
                      <div class="ch-info-wrap">
                         <div class="ch-info">
                            <div class="ch-info-front ch-img-1"><i class="icon-group"></i></div>
                            <div class="ch-info-back">
                               <i class="icon-group"></i>
                            </div>
                         </div>
                      </div>
                      <div class="content-box-info">
                          <h3>创业故事</h3>
                          <p>
                            12月27日，由微赢生物科技有限公司举办的“微赢商学院第三届微商交流会”圆满结束。此次交流会共21微商大咖出席，由中国著名实战微营销培训顾问Jordan主持，微赢CEO康咏铧先生担任主讲嘉宾。
                          </p>
                          <a href="/static/#">阅读全文 <i class="icon-angle-right"></i><i class="icon-angle-right"></i></a>
                       </div>
                   </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 animate_afc d3">
                   <div class="content-box big ch-item">
                      <div class="ch-info-wrap">
                         <div class="ch-info">
                            <div class="ch-info-front ch-img-1"><i class="icon-book"></i></div>
                            <div class="ch-info-back">
                               <i class="icon-book"></i>
                            </div>
                         </div>
                      </div>
                      <div class="content-box-info">
                          <h3>微赢商学院</h3>
                          <p>
                             半年前，微赢生物科技有限公司是谁都不知道的Nothing，甚至在招聘职员时，别人都以为是传销、是骗子。但是经过短暂的时间，微赢生物科技有限公司发生了天翻地覆的变化。目前微赢生物已经成为中国发展最快的微商企业之一。
                          </p>
                          <a href="/static/#">阅读全文 <i class="icon-angle-right"></i><i class="icon-angle-right"></i></a>
                       </div>
                   </div>
                </div>
             </div>
          </div>
       </div>
    </div>

    <!-- Features start -->  
    <div class="features bottom-pad">
       <div class="container">
          <div class="row">
             <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h3  class="title">我们的服务</h3>
                <div class="row">
                   <div class="circular-nav">
                      <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 animate_afl">
                         <div id="cn-tabs">
                            <div class="service service-1">
                               <div class="cn-content">
                                  <h4>Premium Sliders</h4>
                                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                  <a href="/static/#">Read More <i class="icon-angle-right"></i><i class="icon-angle-right"></i></a>
                                  <div class="clearfix"></div>
                               </div>
                               <div class="clearfix"></div>
                            </div>
                            <div class="service service-2">
                               <div class="cn-content">
                                  <h4>Unlimited Colors</h4>
                                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                  <a href="/static/#">Read More <i class="icon-angle-right"></i><i class="icon-angle-right"></i></a>
                                  <div class="clearfix"></div>
                               </div>
                            </div>
                            <div class="service service-3">
                               <div class="cn-content">
                                  <h4>Shortcodes</h4>
                                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                  <a href="/static/#">Read More <i class="icon-angle-right"></i><i class="icon-angle-right"></i></a>
                               </div>
                               <div class="clearfix"></div>
                            </div>
                            <div class="service service-4">
                               <div class="cn-content">
                                  <h4>300+ Icons</h4>
                                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                  <a href="/static/#">Read More <i class="icon-angle-right"></i><i class="icon-angle-right"></i></a>
                               </div>
                               <div class="clearfix"></div>
                            </div>
                         </div>
                         <div class="clearfix"></div>
                      </div>
                      <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1 animate_afr">
                         <div class="cn-wrapper">
                            <ul>
                               <li class="circle-1 circle"><a class="active" href="/static/#"><span class="icon-picture"></span></a></li>
                               <li class="circle-2 circle"><a href="/static/#"><span class="icon-rocket"></span></a></li>
                               <li class="circle-3 circle"><a href="/static/#"><span class="icon-puzzle-piece"></span> </a></li>
                               <li class="circle-4 circle"><a href="/static/#"><span class="icon-thumbs-up-alt"></span></a></li>
                            </ul>
                            <div class="clearfix"></div>
                         </div>
                      </div>
                      <div class="clearfix"></div>
                   </div>
                </div>
             </div>
          </div>
       </div>
    </div>
    <!-- Features End -->


    <!-- Latest Posts start -->
    <!-- <div class="latest-posts">
       <div class="container">
          <div class="row">
             <div class="col-lg-12 col-md-12 com-sm-12 col-xs-12">
                <h3 class="title">微赢动态</h3>
             </div>
             <div class="clearfix"></div>
             <div class="blog-showcase col-lg-12 col-md-12 col-sm-12 col-xs-12 animate_afb d1">
                <ul>
                   <li class="">
                      <div class="blog-showcase-thumb col-lg-4">
                         <div class="post-body">
                            <a class="post-item-link" href="/static/img/portfolio/dt_1.jpg" data-rel="prettyPhoto"><span class="post-item-hover"></span><span class="fullscreen"><i class="icon-search"></i></span><img alt="" src="/static/img/portfolio/dt_1.jpg"></a>
                         </div>
                      </div>
                      <div class="blog-showcase-extra-info col-lg-4">
                         <span><a href="/static/#">2015-1-10</a></span>
                         <h4><a href="/static/#" class="title">微赢动态一</a></h4>
                         <p>微商作为中国新兴行业，他们没有丰富的微营销实战经验更没有接受过相关的专业培训。因此，微商在经营……</p>
                         <a href="/static/#">更多 <i class="icon-double-angle-right"></i></a>
                      </div>
                   </li>
                   <li>
                      <div class="blog-showcase-thumb col-lg-4">
                         <div class="post-body">
                            <a class="post-item-link" href="/static/img/portfolio/dt_2.jpg" data-rel="prettyPhoto"><span class="post-item-hover"></span><span class="fullscreen"><i class="icon-search"></i></span><img alt="" src="/static/img/portfolio/dt_2.jpg"></a>
                         </div>
                      </div>
                      <div class="blog-showcase-extra-info col-lg-4">
                         <span><a href="/static/#">2015-1-10</a></span>
                         <h4><a href="/static/#" class="title">微赢动态二</a></h4>
                         <p>康总以实际可行的方案及个人独到的见解实时与大家互动交流，会上就有三位微商大咖现场签约一生美蓝莓虾青素眼贴，成为微赢蓝莓虾青素眼贴的省级代理。</p>
                         <a href="/static/#">更多 <i class="icon-double-angle-right"></i></a>
                      </div>
                   </li>
                   <li class="blog-first-el">
                      <div class="blog-showcase-thumb col-lg-4">
                         <div class="post-body">
                            <a class="post-item-link" href="/static/img/portfolio/dt_3.jpg" data-rel="prettyPhoto"><span class="post-item-hover"></span><span class="fullscreen"><i class="icon-search"></i></span><img alt="" src="/static/img/portfolio/dt_3.jpg"></a>
                         </div>
                      </div>
                      <div class="blog-showcase-extra-info col-lg-4">
                         <span><a href="/static/#">2015-1-10</a></span>
                         <h4><a href="/static/#" class="title">微赢动态三</a></h4>
                         <p>对此，作为中国著名微营销专家的康总给出了自己一套独特的解决方案。康总每提出一……</p>
                         <a href="/static/#">更多 <i class="icon-double-angle-right"></i></a>
                      </div>
                   </li>
                </ul>
                <div class="clearfix"></div>
             </div>
          </div>
          <div class="divider"></div>
       </div>
    </div> -->
    <!-- Latest Posts End -->
    <!-- Our Clients Start-->
    <div class="our-clients">
        <div class="container">
            <div class="row">
                <div class="client">
                    <div class="client-logo">
                        <div class="col-lg-12 col-md-12 col-sm-8 col-xs-12">
                            <div class="clients-title">
                                <h3 class="title">
                                    友情链接
                                </h3>
                                <div class="carousel-controls pull-right">
                                    <a class="prev" href="/static/#client-carousel" data-slide="prev">
                                        <i class="icon-angle-left">
                                        </i>
                                    </a>
                                    <a class="next" href="/static/#client-carousel" data-slide="next">
                                        <i class="icon-angle-right">
                                        </i>
                                    </a>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                            <div class="row">
                                <div id="client-carousel" class="client-carousel slide">
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 item animate_afc d1">
                                                <div class="item-inner">
                                                    <a href="/static/#">
                                                        <img alt="Upportdash" src="/static/img/clientslogo/logo-1.png">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 item animate_afc d2">
                                                <div class="item-inner">
                                                    <a href="/static/#">
                                                        <img alt="Upportdash" src="/static/img/clientslogo/logo-2.png">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 item animate_afc d3">
                                                <div class="item-inner">
                                                    <a href="/static/#">
                                                        <img alt="Upportdash" src="/static/img/clientslogo/logo-3.png">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 item animate_afc d4">
                                                <div class="item-inner">
                                                    <a href="/static/#">
                                                        <img alt="Upportdash" src="/static/img/clientslogo/logo-4.png">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 item animate_afc d3">
                                                <div class="item-inner">
                                                    <a href="/static/#">
                                                        <img alt="Upportdash" src="/static/img/clientslogo/logo-3.png">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 item animate_afc d4">
                                                <div class="item-inner">
                                                    <a href="/static/#">
                                                        <img alt="Upportdash" src="/static/img/clientslogo/logo-4.png">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 item">
                                                <div class="item-inner">
                                                    <a href="/static/#">
                                                        <img alt="Upportdash" src="/static/img/clientslogo/logo-5.png">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 item">
                                                <div class="item-inner">
                                                    <a href="/static/#">
                                                        <img alt="Upportdash" src="/static/img/clientslogo/logo-4.png">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 item">
                                                <div class="item-inner">
                                                    <a href="/static/#">
                                                        <img alt="Upportdash" src="/static/img/clientslogo/logo-3.png">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 item">
                                                <div class="item-inner">
                                                    <a href="/static/#">
                                                        <img alt="Upportdash" src="/static/img/clientslogo/logo-2.png">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 item animate_afc d3">
                                                <div class="item-inner">
                                                    <a href="/static/#">
                                                        <img alt="Upportdash" src="/static/img/clientslogo/logo-3.png">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 item animate_afc d4">
                                                <div class="item-inner">
                                                    <a href="/static/#">
                                                        <img alt="Upportdash" src="/static/img/clientslogo/logo-4.png">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       <!--  <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="row ">
                                <div class="testimonials widget">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="testimonials-title">
                                            <h3 class="title">
                                                Testimonials
                                            </h3>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                    <div id="testimonials-carousel" class="testimonials-carousel slide animate_afr d5">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="testimonial item">
                                                        <p>
                                                            Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                                            Lorem Ipsum has been the industry's standard dummy text ever since the
                                                            1500s, when an unknown printer took a galley of type.
                                                        </p>
                                                        <div class="testimonials-arrow">
                                                        </div>
                                                        <div class="author">
                                                            <div class="testimonial-image ">
                                                                <img alt="" src="/static/img/testimonial/team-member-1.jpg">
                                                            </div>
                                                            <div class="testimonial-author-info">
                                                                <a href="/static/#">
                                                                    <span class="color">
                                                                        Monica Sing
                                                                    </span>
                                                                </a>
                                                                FIFO Themes
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="testimonial item">
                                                        <p>
                                                            Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                                            Lorem Ipsum has been the industry's standard dummy text ever since the
                                                            1500s, when an unknown printer took a galley of type.
                                                        </p>
                                                        <div class="testimonials-arrow">
                                                        </div>
                                                        <div class="author">
                                                            <div class="testimonial-image ">
                                                                <img alt="" src="/static/img/testimonial/team-member-2.jpg">
                                                            </div>
                                                            <div class="testimonial-author-info">
                                                                <a href="/static/#">
                                                                    <span class="color">
                                                                        Monzurul Haque
                                                                    </span>
                                                                </a>
                                                                FIFO Themes
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <div class="testimonial item">
                                                        <p>
                                                            Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                                            Lorem Ipsum has been the industry's standard dummy text ever since the
                                                            1500s, when an unknown printer took a galley of type.
                                                        </p>
                                                        <div class="testimonials-arrow">
                                                        </div>
                                                        <div class="author">
                                                            <div class="testimonial-image ">
                                                                <img alt="" src="/static/img/testimonial/team-member-3.jpg">
                                                            </div>
                                                            <div class="testimonial-author-info">
                                                                <a href="/static/#">
                                                                    <span class="color">
                                                                        Carol Johansen
                                                                    </span>
                                                                </a>
                                                                FIFO Themes
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Our Clients End -->
</div>
<!-- Content End -->

<!-- Footer Start -->
        <footer id="footer">
            <!-- Footer Top Start -->
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <!-- <section class="col-lg-3 col-md-3 col-xs-12 col-sm-3 footer-one">
                            <h3>
                                关于我们
                            </h3>
                            <p>
                                微赢生物科技有限公司成立于2014年，注册资本金1000万，是华东地区专业的移动电商生物科技公司。
                            </p>
                        </section> -->

                        <section class="col-lg-4 col-md-4 col-xs-12 col-sm-4 footer-one">
                            <h3>联系我们</h3>
                            <ul class="contact-us">
                               <li>
                                  <i class="icon-map-marker"></i>
                                  <p> 
                                     <strong>地址:</strong> 合肥市庐阳区财富广场B座西楼604
                                  </p>
                               </li>
                               <li>
                                  <i class="icon-phone"></i>
                                  <p><strong>电话:</strong> 0551-68998601</p>
                               </li>
                               <li>
                                  <i class="icon-envelope"></i>
                                  <p><strong>Email:</strong>info@fifothemes.com</p>
                               </li>
                            </ul>
                        </section>

                        <section class="col-lg-4 col-md-4 col-xs-12 col-sm-4 footer-two">
                            <h3>
                                官方服务号
                            </h3>
                            <img src="/static/img/wx_1.jpg" style="width:50%">
                        </section>

                        <section class="col-lg-4 col-md-4 col-xs-12 col-sm-4 footer-three">
                            <h3>
                                官方订阅号
                            </h3>
                            <img src="/static/img/wx_2.jpg" style="width:50%">
                        </section>
                        
                    </div>
                </div>
            </div>
            <!-- Footer Top End -->
            <!-- Footer Bottom Start -->
            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12 text-center">
                            Copyright &copy; 2014.Company name All rights reserved.
                        </div>
                        <!-- <div class="col-lg-6 col-md-6 col-xs-12 col-sm-6 ">
                            <ul class="social social-icons-footer-bottom">
                                <li class="facebook">
                                    <a href="/static/#" data-toggle="tooltip" title="Facebook">
                                        <i class="icon-facebook">
                                        </i>
                                    </a>
                                </li>
                                <li class="twitter">
                                    <a href="/static/#" data-toggle="tooltip" title="Twitter">
                                        <i class="icon-twitter">
                                        </i>
                                    </a>
                                </li>
                                <li class="dribbble">
                                    <a href="/static/#" data-toggle="tooltip" title="Dribble">
                                        <i class="icon-dribbble">
                                        </i>
                                    </a>
                                </li>
                                <li class="linkedin">
                                    <a href="/static/#" data-toggle="tooltip" title="LinkedIn">
                                        <i class="icon-linkedin">
                                        </i>
                                    </a>
                                </li>
                                <li class="rss">
                                    <a href="/static/#" data-toggle="tooltip" title="Rss">
                                        <i class="icon-rss">
                                        </i>
                                    </a>
                                </li>
                            </ul>
                        </div> -->
                    </div>
                </div>
            </div>
            <!-- Footer Bottom End -->
        </footer>
        <!-- Scroll To Top -->
        <a href="/static/#" class="scrollup">
            <i class="icon-angle-up">
            </i>
        </a>
    

    </div>
    <!-- Wrap End -->
    <?php echo ($site_tongji); ?>
    <!-- The Scripts -->
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/bootstrap.js"></script>
    <script src="/static/js/jquery.parallax.js"></script>
    <script src="/static/js/modernizr-2.6.2.min.js"></script>
    <script src="/static/js/revolution-slider/js/jquery.themepunch.revolution.min.js"></script>
    <script src="/static/js/jquery.nivo.slider.pack.js"></script>
    <script src="/static/js/jquery.prettyPhoto.js"></script>
    <script src="/static/js/superfish.js"></script>
    <!-- // <script src="/static/js/tweetMachine.js"></script> -->
    <script src="/static/js/tytabs.js"></script>
    <script src="/static/js/jquery.gmap.min.js"></script>
    <script src="/static/js/circularnav.js"></script>
    <script src="/static/js/jquery.sticky.js"></script>
    <!-- // <script src="/static/js/jflickrfeed.js"></script> -->
    <script src="/static/js/imagesloaded.pkgd.min.js"></script>
    <script src="/static/js/waypoints.min.js"></script>
    <script src="/static/js/spectrum.js"></script>
    <!-- // <script src="/static/js/switcher.js"></script> -->
    <script src="/static/js/custom.js"></script>
</body>

</html>