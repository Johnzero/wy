<?php if (!defined('THINK_PATH')) exit();?>
<!DOCTYPE html>
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


<div id="main">

	<div class="row">
        <img src="/static/img/dh.jpg" width="100%">
    </div>

	<div class="breadcrumb-wrapper">
       <div class="container">
          <div class="row">
             <div class="col-lg-6 col-md-6 col-xs-12 col-sm-6">
                <h2 class="title"><?php echo ($term["name"]); ?></h2>
             </div>
             <div class="col-lg-6 col-md-6 col-xs-12 col-sm-6">
                <div class="breadcrumbs pull-right">
                   <ul>
                      <li>您的位置 : </li>
                      <li><a href="/">首页</a></li>
                      <li><a href="<?php echo leuu('list/index',array('id'=>$term['term_id']));?>"><?php echo ($term["name"]); ?></a></li>
                      <li><a><?php echo ($post_title); ?></a></li>
                   </ul>
                </div>
             </div>
          </div>
       </div>
    </div>

    <!-- Main Content start-->
    <div class="content">
       <div class="container">
          	<div class="row">

            <div class="sidebar col-lg-2 col-md-2 col-sm-6 col-xs-12">

    <!-- Search Widget Start -->
    <div class="widget search-form" style="display:none;">
        <form method="post" class="form-inline" action="<?php echo U('portal/search/index');?>">
        <div class="input-group">
            <input type="text" name="keyword" value="<?php echo I('get.keyword');?>" onfocus="if(this.value=='搜索...')this.value='';" onblur="if(this.value=='')this.value='搜索...';" class="search-input form-control">
            <span class="input-group-btn">
            <button type="submit" class="subscribe-btn btn"><i class="icon-search"></i></button>
            </span>
        </div>
        </form>
       <!-- /input-group -->
    </div>
    <!-- Search Widget End -->
    <!-- Tab Start -->
    <!-- <div class="widget tabs">
       <div id="horizontal-tabs">
          <ul class="tabs">
             <li id="tab1" class="current">热门文章</li>
             <li id="tab2">最新文章</li>
             <li id="tab3">经销商</li>
          </ul>
          <div class="contents">
             <div class="tabscontent" id="content1" style="display: block;">
                <ul class="posts">
                    <?php $hot_articles=sp_sql_posts("smeta;order:post_hits desc;limit:5;"); ?>
                    <?php if(is_array($hot_articles)): foreach($hot_articles as $key=>$vo): $smeta=json_decode($vo['smeta'],true); ?>
                        <li>
                            <a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>">
                                <img class="img-thumbnail recent-post-img" alt="" src="/data/upload/<?php echo ($smeta["thumb"]); ?>">
                            </a>
                            <p><a href="#"><?php echo ($vo["post_title"]); ?></a></p>
                            <?php $n_d = explode(" ", $vo['post_date']); ?>
                            <span class="color"><?php echo ($n_d[0]); ?></span>
                        </li><?php endforeach; endif; ?>
                </ul>
             </div>
             <div class="tabscontent" id="content2">
                <ul class="posts">
                    <?php $new_articles=sp_sql_posts("smeta;order:post_date desc;limit:5;"); ?>
                    <?php if(is_array($new_articles)): foreach($new_articles as $key=>$vo): $smeta=json_decode($vo['smeta'],true); ?>
                        <li>
                            <a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>">
                                <img class="img-thumbnail recent-post-img" alt="" src="/data/upload/<?php echo ($smeta["thumb"]); ?>">
                            </a>
                            <p><a href="#"><?php echo ($vo["post_title"]); ?></a></p>
                            <?php $n_d = explode(" ", $vo['post_date']); ?>
                            <span class="color"><?php echo ($n_d[0]); ?></span>
                        </li><?php endforeach; endif; ?>
                </ul>
             </div>
             <div class="tabscontent" id="content3">
                <ul class="posts">
                    <?php $last_users = sp_get_users("field:*;limit:0,8;order:create_time desc;"); ?>
                    <?php if(is_array($last_users)): foreach($last_users as $key=>$vo): ?><li>
                            <a href="<?php echo U('user/index/index',array('id'=>$vo['id']));?>"><img class="img-thumbnail recent-post-img" alt="" src="<?php echo U('user/public/avatar',array('id'=>$vo['id']));?>"></a>
                            <p><a href="#"><?php echo ($vo["user_nicename"]); ?></a></p>
                        </li><?php endforeach; endif; ?>
                </ul>
             </div>
          </div>
       </div>
    </div> -->
    <!-- Tab End -->
    
    <!-- Category Widget Start -->
    <div class="widget category">
       <!-- <h3 class="title">分类</h3> -->
       <ul class="category-list slide">

        <?php if ( in_array( $_GET['id'], array(1,2,7,26,27) ) ) { ?>
        
            <a href="<?php echo U('portal/article/index',array('id'=>2));?>"><li>微赢简介</li></a>
            <a href="/index.php?g=portal&m=list&a=index&id=7"><li>微赢动态</li></a>
            <a href="/index.php?g=portal&m=article&a=index&id=26"><li>微赢团队</li></a>
            <a href="/index.php?g=portal&m=article&a=index&id=27"><li>微赢风貌</li></a>
        <?php } else if ( in_array( $_GET['id'], array(8) )) { ?>

            <a href="/index.php?g=portal&m=list&a=index&id=8"><li>媒体采访</li></a>
          
        <?php } else if ( in_array( $_GET['id'], array(3,15,28,29) )) { ?>

            <a href="/index.php?g=portal&m=article&a=index&id=15"><li>品牌简介</li></a>
            <a href="/index.php?g=portal&m=article&a=index&id=28"><li>品牌专利</li></a>
            <a href="/index.php?g=portal&m=article&a=index&id=29"><li>产品安全</li></a>

        <?php } else if ( in_array( $_GET['id'], array(4,6,22,24,25) ) ) { ?>

            <a href="/index.php?g=portal&m=article&a=index&id=22"><li>学院介绍</li></a>
            <a href="/index.php?g=portal&m=article&a=index&id=24"><li>师资团队</li></a>
            <a href="/index.php?g=portal&m=article&a=index&id=25"><li>课程大纲</li></a>
            <a href="/index.php?g=portal&m=list&a=index&id=6"><li>创业故事</li></a>

        <?php } else if ( in_array( $_GET['id'], array(5,30,31) ) ) { ?>
            
            <a href="/index.php?g=portal&m=index&a=cha&id=30"><li>授权查询</li></a>
            <a href="/index.php?g=portal&m=article&a=index&id=31"><li>加盟政策</li></a>

        <?php } else { ?>
            <a href="/"><li>首页</li></a>
            <a href="/index.php?g=portal&m=list&a=index&id=1"><li>走进微赢</li></a>
            <a href="/index.php?g=portal&m=list&a=index&id=3"><li>品牌动态</li></a>
            <a href="/index.php?g=portal&m=list&a=index&id=4"><li>微赢商学院</li></a>
            <a href="/index.php?g=portal&m=list&a=index&id=5"><li>会员中心</li></a>
        <?php } ?>
       </ul>
    </div>
    <!-- Category Widget End -->
    <!-- Ads Widget Start -->
    <!-- <div class="widget ads">
       <h3 class="title">广告</h3>
       <div class="ads-img row">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
             <img class="img-thumbnail" alt="" src="/static/img/ads-small.jpg">
          </div>
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
             <img class="img-thumbnail" alt="" src="/static/img/ads-small.jpg">
          </div>
       </div>
       <div class="ads-img row">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
             <img class="img-thumbnail" alt="" src="/static/img/ads-small.jpg">
          </div>
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
             <img class="img-thumbnail" alt="" src="/static/img/ads-small.jpg">
          </div>
       </div>
    </div> -->
    <!-- Ads Widget End -->
</div>


            <div class="posts-block col-lg-9 col-md-9 col-sm-8 col-xs-12 bottom-pad">
                <article class="post hentry">
                   <header class="post-header bottom-pad" style="border-bottom: 1px dashed #CCCCCC;">
                      <h3 class="content-title" style="font-size: 28px;color: #59ab02;"><?php echo ($post_title); ?></h3>
                      <div class="blog-entry-meta">
                         <div class="blog-entry-meta-date">
                            <i class="icon-time"></i>
                            <span class="blog-entry-meta-date-month"><?php echo ($post_date); ?></span>
                         </div>
                         <!-- <div class="blog-entry-meta-author">
                            <i class="icon-user"></i>
                            <a href="javascript:;"><i class="fa fa-eye"></i><span><?php echo ($post_hits); ?></span></a> 人
							
                         </div>
                         <div class="blog-entry-meta-tags">
                            <i class="icon-tags"></i>
                            <?php echo ($post_keywords); ?>
                         </div>
                         <div class="blog-entry-meta-comments">
                         	<i class="icon-heart"></i>
                         	<a href="<?php echo U('article/do_like',array('id'=>$object_id));?>" class="J_count_btn">
                         		<span class="count"><?php echo ($post_like); ?></span>
                         	</a>
                         </div> -->
                      </div>
                   </header>
                   <div class="post-content">
						<?php echo ($post_content); ?>
                   </div>
                </article>
                <div class="blog-divider"></div>
                <!-- <ul class="pager">
                   <li class="previous"><a href="<?php echo U('article/index',array('id'=>$object_id-1));?>">&larr; 前一篇</a></li>
                   <li class="next"><a href="<?php echo U('article/index',array('id'=>$object_id+1));?>">后一篇 &rarr;</a></li>
                </ul> -->
                
            </div>
             
            <!-- Sidebar End --> 
            </div>
       </div>
    </div>
    <!-- Main Content end-->
</div>

<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"2","bdSize":"32"},"share":{},"image":{"viewList":["weixin","tsina","qzone","tqq","renren"],"viewText":"分享到：","viewSize":"32"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["weixin","tsina","qzone","tqq","renren"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>  

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