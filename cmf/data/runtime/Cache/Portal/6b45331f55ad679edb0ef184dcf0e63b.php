<?php if (!defined('THINK_PATH')) exit();?>﻿
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />   
<meta name="viewport" content="width=1024" />
<meta name="author" content="<?php echo ($post_author); ?>" />
<meta name="keywords"  content="<?php echo ($post_keywords); ?>" />
<meta name="description" content="<?php echo ($post_excerpt); ?>" />
<script type="text/javascript" src="/cmf/tpl/bs/Public/Js/domassistantcompressed-2.8.1.js"></script>
<script type="text/javascript" src="/cmf/tpl/bs/Public/Js/ie-css3.js"></script>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="/cmf/tpl/bs/Public/Css/style.css" />
<!--[if lt IE 9]>
	<script type="text/javascript" src="Js/html5.js"></script>
	<![endif]-->
<title><?php echo ($post_title); ?></title>
</head>
    <body>
<div class="theblankblock"></div>
 <header >
 <!--导航开始-->
	<div class="headtop">
		<div class="wp clearfix">
	<!-- 		<div class="share fl">
				<a href=""></a>
				<a href=""></a>
				<a href=""></a>
			</div> -->
			<div class="fr notmsg">
				<a href="#">联系我们</a>
				<a href="#">经销加盟</a>
			</div>
		</div>
	</div>
		<div class="headmain">
		<div class="wp clearfix">
			<div class="fl logo"><a href="/cmf/"></a></div>
			<nav class="fr">

         <?php $effected_id="1"; $filetpl="<a href='\$href' >\$label</a>"; $foldertpl=""; $ul_class="" ; $li_class="" ; $style="clearfix"; $showlevel=6; $dropdown=''; ?>

<?php echo sp_get_menu("main",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown);?>
                
				                 			</nav>
		</div>
	</div>
	<!--导航结束-->
</header>
<section id="caseinsmap">
<div class="pivt"></div>
  <div class="caemap">
		<div class="close">
		</div>
		<style type="text/css">
    
	</style>


	</div>
</section>
<section id="caseCont">
	<article class="caseshow wp" style="height:auto;">
		<div class="tit">
			<h3><?php echo ($post_title); ?></h3>
			<div class="guimo">时间：<?php echo ($post_date); ?></div>
			<div class="dizhi">点击：<script src="/cmf/tpl/bs/Public/Js/count.js" type='text/javascript' language="javascript"></script> 次</div>
			<div class="ico"></div>
		</div>
		<div class="imgwrapper" style="padding-bottom:20px;">
			<?php echo ($post_content); ?>
<script charset="UTF-8" id="huaban_inject_script" type="text/javascript">
window.HUABAN_PRESETTINGS = { autoInitialize: false };</script><script charset="UTF-8" id="huaban_script" src="/cmf/tpl/bs/Public/Js/widgets.min.js" type="text/javascript">
</script><script charset="UTF-8" id="huaban_inject_script" type="text/javascript">
window.HUABAN_PRESETTINGS = { autoInitialize: false };</script><script charset="UTF-8" id="huaban_script" src="/cmf/tpl/bs/Public/Js/widgets.min.js" type="text/javascript">
</script>
<script charset="UTF-8" id="huaban_inject_script" type="text/javascript">
window.HUABAN_PRESETTINGS = { autoInitialize: false };</script>
<script charset="UTF-8" id="huaban_script" src="/cmf/tpl/bs/Public/Js/widgets.min.js" type="text/javascript">
</script>

		</div>

			
	</article>
	<div class="wp returnpage">
<a class="" href="/cmf/list/index/id/<?php echo ($term_id); ?>">返回上级</a></div>
</section>
<footer >

		<div class="wp top clearfix">
    <div class="left fl">
      <h3>联系我们<i></i></h3>
      <ul>
        <li class="phn"><i></i>4000-00-00</li>
        <li class="fix"><i></i>4000-00-00</li>
        <li class="mal"><i></i>aaaaaa@163.com</li>
        <li class="ars"><i></i>中华人民共和国95号</li>
        <li class="freephone"><i></i>全国免费报务热线: <em>4000-00-00</em></li>
      </ul>
    </div>
    <div class="mid fl">
      <h3>关于我们<i></i></h3>
        <div class="data">某某某公司建设工程有限公司是唯一家规模化、集团化、综合性极强的现代建筑材料生产、销售、施工企业。公司地址位于中华人民共和国内，占地面积100亩，1900年投资1.8亿元，并在成都、上海、呼和浩特、深圳、广州等城市设有办事处</div>
      <h3 class="lis"><i></i></h3>
      <div class="share">
        <a href="http://weixin.qq.com" target="_blank"></a>
        <a href="tencent://message/?uin=51664300&Menu=yes" target="_blank"></a>
        <a href="http://www.weibo.com" target="_blank"></a>
      </div>
    </div>

    <div class="right fl">
        <h3>导航<i></i></h3>
        <ul>
          
<li><a href='/cmf/list/index/id/3'>关于我们</a> </li>
                
<li><a href='/cmf/list/index/id/4'>产品中心</a> </li>
                
<li><a href='/cmf/list/index/id/10'>应用领域</a> </li>
                
<li><a href='/cmf/list/index/id/17'>工程案例</a> </li>
                
<li><a href='/cmf/list/index/id/18'>咨讯中心</a> </li>
                       
        </ul>
    </div>
</div>
<div class="bot">
  <div class="wp clearfix">
  <span class="fl">CopyrightCopyright &copy; 2014 ThinkCmf 版权所有</span>


    <span class="fr" style="padding-left:40px;"><a href="#" target="_blank" title="网站建设">网站建设</a>：<a href="#" target="_blank" title="某某某公司">某某某公司</a></span>
    <span class="fr">友情链接：<a href='http://www.thinkcmf.com' target='_blank'>ThinkCmf官方</a> &nbsp;&nbsp;<a href='#' target='_blank'>ThinkCmf帮助手册</a> &nbsp;&nbsp;<a href='http://bbs.thinkcmf.com' target='_blank'>ThinkCmf技术论坛</a> &nbsp;&nbsp;
      </span>
  </div>
</div>

</footer>
<script type="text/javascript" src="/cmf/tpl/bs/Public/Js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/cmf/tpl/bs/Public/Js/easing.js"></script>
<script type="text/javascript" src="/cmf/tpl/bs/Public/Js/lazyload.js"></script>
<script type="text/javascript">
//导航
$("nav li").hover(function(){
	$("i",this).addClass("hover");
	
},function(){
	$("i",this).removeClass("hover");
})
	
   
	$(window).scroll(function(){
	
		  var stp=$(window).scrollTop();
			if(stp==0){
				$(".theblankblock").height(0);
				$("#submen").addClass("nofix").css({"top":401})
					$("header").stop(true,false).css({"top":0})
					$("header").removeClass("fix").removeClass("aboutheader")
			}
			else if(stp>0){
				$(".theblankblock").height(145);
				$("#submen").removeClass("nofix").css({"top":64})
				$("header").stop(true,false).css({"top":-55})
				$("header").addClass("fix").addClass("aboutheader")
			}
		})
		
 	
	
	
	
	

</script><script type="text/javascript">

$("#newslist li").hover(function(){
	$(this).addClass("hover");
},function(){
	$(this).removeClass("hover");
})

$(".relevantcase li").hover(function(){
	$("a",this).show();
},function(){
	$("a",this).hide();
})
$(".relevantprod li .more").hover(function(){
	$(this).addClass("hover");
},function(){
	$(this).removeClass("hover");
})
		
	
</script>
</body>
</html>
<!-- 2014-5-11 -->