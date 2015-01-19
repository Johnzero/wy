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

    <script>document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':8080/livereload.js?snipver=1"></' + 'script>')</script>

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
                            <li><a id="current" href="/">&nbsp;&nbsp;首页&nbsp;&nbsp;</a></li>
                            <li>
                               <a href="/index.php?g=portal&m=list&a=index&id=1">
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
                               <a  href="/index.php?g=portal&m=list&a=index&id=3" class="sf-with-ul">
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
                               <a href="/index.php?g=portal&m=list&a=index&id=4" class="sf-with-ul">
                               微赢商学院
                               <span class="sf-sub-indicator">
                               <i class="icon-angle-down "></i>
                               </span>
                               </a>
                               <ul>
                                  <li><a href="/static/about.html" class="sf-with-ul" target="_blank">学院介绍</a></li>
                                  <li><a href="/static/services.html" class="sf-with-ul" target="_blank">师资团队</a></li>
                                  <li><a href="/static/testimonials.html" class="sf-with-ul" target="_blank">课程大纲</a></li>
                                  <li><a href="/index.php?g=portal&m=list&a=index&id=6" class="sf-with-ul" target="_blank">创业故事</a></li>
                               </ul>
                            </li>
                            <li>
                               <a href="/index.php?g=portal&m=list&a=index&id=5" class="sf-with-ul">
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

<style type="text/css">
	.tc-main {
		margin-top: 50px;
	}
	.control-group {
		width: 30%;
		margin: 0 auto;
		margin-bottom: 20px;
	}
	.controls {
		display: inline-block;
	}
	form {
		margin: 0 0 50px;
	}
</style>
	<div class="container tc-main">
		<div class="row">
			<div class="span6 offset3">
				<h2 class="text-center">用户登录</h2>
				<form class="form-horizontal J_ajaxForms" action="<?php echo U('user/login/dologin');?>" method="post">
					<div class="control-group">
						<label class="control-label" for="input_username">账&nbsp;&nbsp;&nbsp;&nbsp;号：</label>
						<div class="controls">
							<input type="text" id="input_username" name="username" placeholder="请输入用户名或者邮箱" class="span3">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="input_password">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
						<div class="controls">
							<input type="password" id="input_password" name="password" placeholder="请输入密码" class="span3">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="input_verify">验证码：</label>
						<div class="controls">
							<input type="text" id="input_verify" name="verify"  placeholder="请输入验证码" class="span3">
							<?php echo sp_verifycode_img('code_len=4&font_size=15&width=100&height=35&charset=1234567890');?>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input_repassword"></label>
						<div class="controls">
							<label class="checkbox persistent"><input type="checkbox" name="terms" value="1">我同意
								<a href="#">网站内容服务条款</a></label>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="input_repassword"></label>
						<div class="controls">
							<button class="btn btn-primary J_ajax_submit_btn" type="submit">确定</button>
						</div>
					</div>
					<div class="control-group">

					</div>

					<!-- <div class="control-group">
						<label class="control-label" for="input_repassword"></label>
						<div class="controls">
							<ul class="inline">
								<li><a href="<?php echo U('user/register/index');?>">现在注册</a></li>
								<li><a href="<?php echo U('user/login/forgot_password');?>">忘记密码</a></li>
							</ul>
						</div>
					</div> -->
				</form>
			</div>
		</div>
	</div>
	<!-- /container -->

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