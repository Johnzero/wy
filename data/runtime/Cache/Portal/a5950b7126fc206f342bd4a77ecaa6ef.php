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
    <title><?php echo ($site_seo_title); ?></title>
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
 <!--    <link rel="apple-touch-icon" href="/static/img/ico/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/static/img/ico/apple-touch-icon-72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/static/img/ico/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/static/img/ico/apple-touch-icon-144.png"> -->

    <script>// document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':8080/livereload.js?snipver=1"></' + 'script>')</script>

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
                            <!-- <a href="/static/mail%40example.html">
                                <i class="icon-envelope">
                                </i>
                                邮件 : <?php echo ($site_admin_email); ?>
                            </a> -->
                        </div>
                        <div class="pull-right">
                            <ul class="social pull-left">
                                <li class="facebook">
                                    <a href="http://weibo.com/p/1006065454998491/home?from=page_100606&mod=TAB#place">
                                        <i class="icon-weibo">
                                        </i>
                                    </a>
                                </li>
                            </ul>
                            <ul class="nav pull-right" id="main-menu-left">
                                <li class="dropdown">
                                <?php if(sp_is_user_login()): ?><a class="dropdown-toggle user" data-toggle="dropdown" href="#">
	                                    <?php if(empty($user['avatar'])): ?><i class="icon-user"></i>
	                                    <?php else: ?>
	                                    <img src="<?php echo sp_get_user_avatar_url($user['avatar']);?>" class="headicon"/><?php endif; ?>
	                                    <?php echo ($user["user_nicename"]); ?><b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                       <li><a href="<?php echo u('user/center/index');?>"><i class="fa fa-user"></i> &nbsp;个人中心</a></li>
                                       <li class="divider"></li>
                                       <li><a href="<?php echo u('user/index/logout');?>"><i class="fa fa-sign-out"></i> &nbsp;退出</a></li>
                                    </ul>
                                <?php else: ?>
                                    <a class="dropdown-toggle user" data-toggle="dropdown" href="#" style="padding: 4px 10px;">
                                        <i class="icon-user"></i>会员登录<b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                       <!-- <li><a href="<?php echo U('api/oauth/login',array('type'=>'sina'));?>"><i class="fa fa-weibo"></i> &nbsp;微博登录</a></li>
                                       <li><a href="<?php echo U('api/oauth/login',array('type'=>'qq'));?>"><i class="fa fa-qq"></i> &nbsp;QQ登录</a></li> -->
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
                <div class="container" style="width:1140px;">
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
                            <li><a id="current" href="/">&nbsp;&nbsp;首页&nbsp;&nbsp;</a></li>
                            <li>
                               <a href="#">
                                    走进微赢
                                   <span class="sf-sub-indicator">
                                   <i class="icon-angle-down "></i>
                                   </span>
                               </a>
                               <ul>
                                  <li><a href="<?php echo U('portal/article/index',array('id'=>2));?>" class="sf-with-ul" target="_blank">微赢简介</a></li>
                                  <li><a href="/index.php?g=portal&m=list&a=index&id=7" class="sf-with-ul" target="_blank">微赢动态</a></li>
                                  <li><a href="/index.php?g=portal&m=article&a=index&id=26" class="sf-with-ul" target="_blank">微赢团队</a></li>
                                  <li><a href="/index.php?g=portal&m=article&a=index&id=27" class="sf-with-ul" target="_blank">微赢风貌</a></li>
                               </ul>
                            </li>
                            <li>
                               <a href="/index.php?g=portal&m=list&a=index&id=8">
                                    媒体采访
                                   <span class="sf-sub-indicator">
                                   <i class="icon-angle-down "></i>
                                   </span>
                               </a>
                            </li>
                            <li>
                               <a href="#" class="sf-with-ul">
                               品牌动态 
                               <span class="sf-sub-indicator">
                               <i class="icon-angle-down "></i>
                               </span>
                               </a>
                               <ul>
                                  <li><a href="/index.php?g=portal&m=article&a=index&id=15" class="sf-with-ul" target="_blank">品牌简介</a></li>
                                  <li><a href="/index.php?g=portal&m=article&a=index&id=28" class="sf-with-ul" target="_blank">品牌专利</a></li>
                                  <li><a href="/index.php?g=portal&m=article&a=index&id=29" class="sf-with-ul" target="_blank">产品安全</a></li>
                               </ul>
                            </li>
                            <li>
                               <a href="#" class="sf-with-ul">
                               微赢商学院
                               <span class="sf-sub-indicator">
                               <i class="icon-angle-down "></i>
                               </span>
                               </a>
                               <ul>
                                  <li><a href="/index.php?g=portal&m=article&a=index&id=22" class="sf-with-ul" target="_blank">学院介绍</a></li>
                                  <li><a href="/index.php?g=portal&m=article&a=index&id=24" class="sf-with-ul" target="_blank">师资团队</a></li>
                                  <li><a href="/index.php?g=portal&m=article&a=index&id=25" class="sf-with-ul" target="_blank">课程大纲</a></li>
                                  <li><a href="/index.php?g=portal&m=list&a=index&id=6" class="sf-with-ul" target="_blank">创业故事</a></li>
                               </ul>
                            </li>
                            <li>
                               <a href="#" class="sf-with-ul">
                               会员中心
                               <span class="sf-sub-indicator">
                               <i class="icon-angle-down "></i>
                               </span>
                               </a>
                               <ul>
                                  <li><a href="/index.php?g=portal&m=index&a=cha&id=30" class="sf-with-ul" target="_blank">授权查询</a></li>
                                  <li><a href="/index.php?g=portal&m=article&a=index&id=31" class="sf-with-ul" target="_blank">加盟政策</a></li>
                               </ul>
                            </li>
                            <!-- <li>
                               <a href="/static/#" class="sf-with-ul">
                               会员登录
                               <span class="sf-sub-indicator">
                               <i class="icon-user"></i>
                               </span>
                               </a><ul class="display"></ul>
                            </li> -->
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
                <li data-delay="2000" data-masterspeed="300" data-transition="fade">
                    <div class="slotholder">
                        <img src="/static/img/1.jpg" data-fullwidthcentering="on" alt="Pixma">
                    </div>
                    <!-- <div class="caption modern_big_bluebg h1 lft tp-caption start" data-x="40"
                    data-y="85" data-speed="700" data-endspeed="800" data-start="1000" data-easing="easeOutQuint"
                    data-endeasing="easeOutQuint">
                        <h3>
                            我们的产品
                        </h3>
                    </div> -->
                    <!-- <div class="caption list_slide lfb tp-caption start" data-easing="easeOutExpo"
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
                        <a class="btn-special hidden-xs btn-grey" href="#">
                            详细了解
                        </a>
                    </div>
                    <div class="caption lfb caption_button_2 fadeout tp-caption start" data-x="210"
                    data-y="330" data-speed="800" data-endspeed="300" data-start="2900" data-hoffset="70"
                    data-easing="easeOutExpo">
                        <a class="btn-special hidden-xs btn-color" href="#">
                            立即购买
                        </a>
                    </div> -->
                </li>
                <li data-transition="fade" data-slotamount="1" data-masterspeed="300">
                    <img src="/static/img/2.jpg" data-fullwidthcentering="on" alt="">
                    <!-- <div class="caption large_text sft" data-x="660" data-y="54" data-speed="300"
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
                    </div> -->
                </li>
                <li data-transition="fade" data-slotamount="1" data-masterspeed="300">
                    <img src="/static/img/3.jpg" data-fullwidthcentering="on" alt="">
                </li>
                <li data-transition="fade" data-slotamount="1" data-masterspeed="300">
                    <img src="/static/img/4.jpg" data-fullwidthcentering="on" alt="">
                </li>
                <li data-transition="fade" data-slotamount="1" data-masterspeed="300">
                    <img src="/static/img/5.jpg" data-fullwidthcentering="on" alt="">
                </li>
                <li data-transition="fade" data-slotamount="1" data-masterspeed="300">
                    <img src="/static/img/6.jpg" data-fullwidthcentering="on" alt="">
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
    <div class="recentworks bottom-pad">
        <div class="container">
          <div class="row">
             <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 animate_afl d1">
                <div class="portfolio-desc">
                   <h3 class="title">公司简介</h3>
                   <p>安徽省微赢生物科技有限公司秉承“微信，让世界认识你。”的企业宗旨，紧跟时代步伐，自主创新，依托强大的互联网平台，结合顶尖产品研发团队，通过整合移动领域核心技术、微营销、互联网、顶级策划人才、运营人才、高级工程师、优质资源打破传统商业模式，实现线上线下同步推广销售，让每一位消费者以最便捷的方式最合理的价格，用上好产品。</p>
                   <div class="carousel-controls">
                      <a class="prev" href="#portfolio-carousel" data-slide="prev"><i class="icon-angle-left"></i></a>
                      <a class="next" href="#portfolio-carousel" data-slide="next"><i class="icon-angle-right"></i></a>
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
                                  <a href="/static/img/gs1.jpg" class="portfolio-item-link" data-rel="prettyPhoto" >
                                  <span class="portfolio-item-hover"></span>
                                  <span class="fullscreen"><i class="icon-search"></i></span><img src="/static/img/gs1.jpg" alt=" "/>
                                  </a>
                                  <div class="clearfix"></div>
                               </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 item animate_afc d3">
                               <div class="portfolio-item">
                                  <a href="/static/img/gs2.jpg" class="portfolio-item-link" data-rel="prettyPhoto" >
                                  <span class="portfolio-item-hover"></span><span class="fullscreen"><i class="icon-search"></i></span><img src="/static/img/gs2.jpg" alt=" "/>
                                  </a>
                                  <div class="clearfix"></div>
                               </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 item animate_afc d4">
                               <div class="portfolio-item">
                                  <a href="/static/img/gs3.jpg" class="portfolio-item-link" data-rel="prettyPhoto" >
                                  <span class="portfolio-item-hover"></span><span class="fullscreen"><i class="icon-search"></i></span><img src="/static/img/gs3.jpg" alt=" "/>
                                  </a>
                                  <div class="clearfix"></div>
                               </div>
                            </div>
                         </div>

                         <div class="item">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 item animate_afc d2">
                               <div class="portfolio-item">
                                  <a href="/static/img/gs1.jpg" class="portfolio-item-link" data-rel="prettyPhoto" >
                                  <span class="portfolio-item-hover"></span>
                                  <span class="fullscreen"><i class="icon-search"></i></span><img src="/static/img/gs1.jpg" alt=" "/>
                                  </a>
                                  <div class="clearfix"></div>
                               </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 item animate_afc d3">
                               <div class="portfolio-item">
                                  <a href="/static/img/gs2.jpg" class="portfolio-item-link" data-rel="prettyPhoto" >
                                  <span class="portfolio-item-hover"></span><span class="fullscreen"><i class="icon-search"></i></span><img src="/static/img/gs2.jpg" alt=" "/>
                                  </a>
                                  <div class="clearfix"></div>
                               </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 item animate_afc d4">
                               <div class="portfolio-item">
                                  <a href="/static/img/gs3.jpg" class="portfolio-item-link" data-rel="prettyPhoto" >
                                  <span class="portfolio-item-hover"></span><span class="fullscreen"><i class="icon-search"></i></span><img src="/static/img/gs3.jpg" alt=" "/>
                                  </a>
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

    <!-- Features start -->  
    <div class="features bottom-pad">
       <div class="container">
          <div class="row">
             <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h3  class="title">走进微赢</h3>
                <div class="row">
                   <div class="circular-nav">
                      <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 animate_afl">
                         <div id="cn-tabs">
                            <div class="service service-1">
                               <div class="cn-content">
                                  <h4>微赢商学院</h4>
                                  <div class="s-bc"><img src="/static/img/sxy.png"></div>
                                  <p>微赢微商学院是微赢生物科技有限公司联合全国工商联美容化妆品商会、安徽省教育厅大学生再就业中心，安徽省下岗再就业中心做的微营销教育培训平台。微赢微商学院拥有强大的师资力量，聚集了国内顶尖的微营销实战专家，课程内容涵盖微营销咨询、微商实用技能、移动电子商务、O2O服务为一体的移动营销服务平台及解决方案。目前学员人数已超过20万人，遍及全国31省市自治区，为中国最权威的微营销培训学院。曾经荣获中国十大微营销教育学院，中国微商十大教育学院，微赢微商学院致力于打造中国微商的黄埔军校！</p>
                                  <a href="/index.php?g=portal&m=article&a=index&id=14" target="_blank">更多<i class="icon-angle-right"></i><i class="icon-angle-right"></i></a>
                                  <div class="clearfix"></div>
                               </div>
                               <div class="clearfix"></div>
                            </div>
                            <div class="service service-2">
                               <div class="cn-content">
                                  <h4>微赢产品</h4>
                                  <div class="s-bc"><img src="/static/img/cp.jpg"></div>
                                  <p>蓝莓虾青素眼贴5大优势</p>
                                    <p>1）最新能通过血脑、视网膜屏障的健康产品；</p>
                                    <p>2）与抗炎药物有同等或超越的效果；</p>
                                    <p>3）最新被学术机构认可抗衰老产品之一；</p>
                                    <p>4）最新实现五抗（抗氧化、抗衰老、抗肿瘤、抗炎症、抗疲劳）作用的新资源天然品；</p>
                                    <p>5)至今尚无有不良反应的报道。</p>
                                  <a href="/index.php?g=portal&m=article&a=index&id=15" target="_blank">更多<i class="icon-angle-right"></i><i class="icon-angle-right"></i></a>
                                  <div class="clearfix"></div>
                               </div>
                            </div>
                            <div class="service service-3">
                               <div class="cn-content">
                                  <h4>关注我们</h4>
                                  <p><img src="/static/img/gz.jpg"></p>
                                  <!-- <a href="#" target="_blank">更多<i class="icon-angle-right"></i><i class="icon-angle-right"></i></a> -->
                               </div>
                               <div class="clearfix"></div>
                            </div>
                            <div class="service service-4">
                               <div class="cn-content">
                                  <h4>招贤纳士</h4>
                                  <p><img src="/static/img/zxns.jpg"></p>
                                  <!-- <a href="#" target="_blank">更多<i class="icon-angle-right"></i><i class="icon-angle-right"></i></a> -->
                               </div>
                               <div class="clearfix"></div>
                            </div>
                         </div>
                         <div class="clearfix"></div>
                      </div>
                      <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1 animate_afr">
                         <div class="cn-wrapper">
                            <ul>
                               <li class="circle-1 circle">
                                    <a class="active" href="#"><font style="-webkit-transform: rotate(50deg);display: block;">微赢商学院</font></a>
                               </li>
                               <li class="circle-2 circle">

                                    <a href="#"><font style="-webkit-transform: rotate(-40deg);display: block;margin-top: 10px;margin-left: 20px;">微赢产品</font></a>

                               </li>
                               <li class="circle-3 circle">
                                    <a href="#"><font style="-webkit-transform: rotate(-130deg);display: block;">关注我们</font></a>
                                </li>

                               <li class="circle-4 circle">
                                    <a href="#"><font style="-webkit-transform: rotate(-220deg);display: block;margin-top: 10px;margin-left: 20px;">招贤纳士</font></a>
                                </li>

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
    
    <div class="service-reasons">
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
                            <div class="ch-info-front ch-img-1">
                                <i class="icon-bullhorn"></i>
                            </div>
                            <div class="ch-info-back">
                               <i class="icon-bullhorn"></i>
                            </div>
                         </div>
                      </div>
                      <div class="content-box-info">
                          <h3>媒体报道</h3>
                          <img src="/static/img/cz.jpg" alt="">
                          <p><h1>《微赢CEO康咏铧受CCTV央视网采访》</h1></p>
                          <p>移动浪潮正席卷而来。用户行为变了，从电脑到手机；市场变了，移动应用浮现大量商机；商业模式变了，传统的已没落，新型的正在兴起，我们已经进入一个移动互联网时代!......
                          </p>
                          <a href="/index.php?g=portal&m=article&a=index&id=16" target="_blank">阅读全文 <i class="icon-angle-right"></i><i class="icon-angle-right"></i></a>
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
                          <img src="/static/img/portfolio/po_1.jpg" alt=" ">
                          <p><h1>微赢生物科技董事长刘兴隆 </h1></p>
                          <p>
                             半年前，微赢生物科技有限公司是谁都不知道的Nothing，甚至在招聘职员时，别人都以为是传销、是骗子。但是经过短暂的时间，微赢生物科技有限公司发生了天翻地覆的变化。
                          </p>
                          <a href="/index.php?g=portal&m=list&a=index&id=6" target="_blank">更多创业故事 <i class="icon-angle-right"></i><i class="icon-angle-right"></i></a>
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
                          <img src="/static/img/sxy.png" alt=" ">
                          <p><h1>微赢商学院掀起微商快速成长之路</h1></p>
                          <p>移动浪潮正席卷而来。用户变了，一切有趣的事情都在手机上发生；市场变了，更多商机在移动场景中浮现；商业和商业的法则也变了一些终将没落，另一些注定要崛起。
                          </p>
                          <a href="/index.php?g=portal&m=article&a=index&id=22" target="_blank">阅读全文 <i class="icon-angle-right"></i><i class="icon-angle-right"></i></a>
                       </div>
                   </div>
                </div>
             </div>
          </div>
       </div>
    </div>

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
                                <!-- <div class="carousel-controls pull-right">
                                    <a class="prev" href="#client-carousel" data-slide="prev">
                                        <i class="icon-angle-left">
                                        </i>
                                    </a>
                                    <a class="next" href="#client-carousel" data-slide="next">
                                        <i class="icon-angle-right">
                                        </i>
                                    </a>
                                    <div class="clearfix">
                                    </div>
                                </div> -->
                            </div>
                            <div class="clearfix">
                            </div>
                            <div class="row">
                                <div id="client-carousel" class="client-carousel slide">
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <?php $links=sp_getlinks(); ?>
                                            <?php if(is_array($links)): foreach($links as $key=>$vo): ?><div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 item animate_afc d1">
                                                    <div class="item-inner">
                                                        <a href="<?php echo ($vo["link_url"]); ?>" target="<?php echo ($vo["link_target"]); ?>">
                                                            <img alt="Upportdash" src="<?php echo ($vo["link_image"]); ?>">
                                                        </a>
                                                    </div>
                                                </div><?php endforeach; endif; ?>
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
                                                                <a href="#">
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
                                                                <a href="#">
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
                                                                <a href="#">
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
                               <!-- <li>
                                  <i class="icon-envelope"></i>
                                  <p><strong>Email:</strong>info@fifothemes.com</p>
                               </li> -->
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
                            Copyright &copy; 2014.微赢生物科技有限公司 All rights reserved.
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