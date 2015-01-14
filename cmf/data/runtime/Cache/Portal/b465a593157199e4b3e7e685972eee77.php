<?php if (!defined('THINK_PATH')) exit();?>﻿
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />   
<meta name="viewport" content="width=1024" />
<meta name="keywords"  content="<?php echo ($post_keywords); ?>" />
<meta name="description" content="<?php echo ($post_excerpt); ?>" />
<script type="text/javascript" src="/cmf/tpl/bs/Public/Js/domassistantcompressed-2.8.1.js"></script>
<script type="text/javascript" src="/cmf/tpl/bs/Public/Js/ie-css3.js"></script>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="/cmf/tpl/bs/Public/Css/style.css" />
<!--[if lt IE 9]>
	<script type="text/javascript" src="Js/html5.js"></script>
	<![endif]-->
<title><?php echo ($post_title); echo ($site_name); ?></title>
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
</header><section id="submen" class="nofix">
	<div class="wp">
		<ul class="clearfix">
				  		      		
            <?php $term_id=4; $terms=sp_get_child_terms($term_id ); ?>
<?php if(is_array($terms)): foreach($terms as $key=>$vo): ?><li><a href='/cmf/list/index/id/<?php echo ($vo["term_id"]); ?>'><?php echo ($vo["name"]); ?></a> </li><?php endforeach; endif; ?>
            
                  		</ul>
	</div>
</section>
<section id="prinsCont" class="wp">
	 <div class="prshow">
		<div class="prshowbox clearfix">
			<div class="fl">
				<div class="casewrapper">
					<ul><?php $thumb=$smeta['thumb']; ?>

           <li class="current"><img data-original="/cmf/data/upload/<?php echo ($thumb); ?>" alt="<?php echo ($post_title); ?>" src="/cmf/tpl/bs/Public/Pic/about_blank.png"  /></li>
            </ul>
				</div>
				<div class="contro">
					<ul class="clearfix">
            <!-- <li class="current"><img src="Pic/1-140q11403100-l.jpg" alt="<?php echo ($post_title); ?>" /></li>-->
                	</ul>
				</div>
			</div>
			<div class="fr">
            <div class="tit"><?php echo ($post_title); ?></div>
            <div class="name"><span class="type">时间:</span> <div class="cont"><?php echo ($post_date); ?></div></div>
            <div class="name"><span class="type">点击:</span> <div class="cont"><?php echo ($post_hits); ?></div></div>
            <div class="name clearfix"><span class="type fl">描述:</span> <div class="cont fl">
            
            <?php echo ($post_excerpet); ?>
            
            </div></div>


				 
			</div>
		</div>
	 </div>
</section>
	<div class="wp returnpage">
     <a class="" href="/cmf/list/index/id/<?php echo ($term_id); ?>">返回上级</a></div>

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
//展示图片切换
	var tindex;
	$(".contro li").click(function(){
		if($(this).attr("class")=="current"){
			return false;
		}else{
		tindex=$(this).index();
		$(".contro li").removeClass("current");
		$(this).addClass("current");
	
		$(".casewrapper ul li").fadeOut(500);
		$(".casewrapper ul li").eq(tindex).fadeIn(500);
		}
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
//lazyload
$(".casewrapper img").lazyload({effect:"fadeIn",failurelimit:10});	
	
</script>
</body>
</html>