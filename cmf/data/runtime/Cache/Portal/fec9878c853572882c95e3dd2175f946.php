<?php if (!defined('THINK_PATH')) exit();?>﻿
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />   
<meta name="viewport" content="width=1024" />
<meta name="keywords"  content="" />
<meta name="description" content="全面替代瓷砖和其他材料，安装方便，使用寿命长、不生锈、抗撞击，而且采用特殊工艺涂覆高性能抗菌涂层具有杀菌、除臭、自净、防霉、抗紫外线、抗风沙、防潮湿等卓越特性。" />
<script type="text/javascript" src="/cmf/tpl/bs/Public/Js/domassistantcompressed-2.8.1.js"></script>
<script type="text/javascript" src="/cmf/tpl/bs/Public/Js/ie-css3.js"></script>
<link rel="shortcut icon" href="/cmf/tpl/bs/Public/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="/cmf/tpl/bs/Public/Css/style.css" />
<!--[if lt IE 9]>
	<script type="text/javascript" src="Js/html5.js"></script>
	<![endif]-->
<title><?php echo ($name); ?>-<?php echo ($site_name); ?></title>
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
</header><section id="insbanner" ><img src="/cmf/tpl/bs/Public/Pic/insbanner.jpg" alt="" />
<div class="wp"><h2>应用领域</h2>
	<div class="ent">SOLUTION</div>
</div>
</section><section id="submen" class="nofix">
	<div class="wp">
		<ul class="clearfix">
				  		          		<?php $term_id=10; $terms=sp_get_child_terms($term_id ); ?>		
       <?php if(is_array($terms)): foreach($terms as $key=>$vo): ?><li><a href='/cmf/list/index/id/<?php echo ($vo["term_id"]); ?>'><?php echo ($vo["name"]); ?></a> </li><?php endforeach; endif; ?>
            
                  		</ul>
	</div>
</section><section id="applitit">
		<div class="wp">
			<div class="tit clearfix">
				<img class="titico fl" src="/cmf/tpl/bs/Public/Pic/20140513030427493.png" alt="" />
				<h4 class="fl"><?php echo ($name); ?><p class="ent"></p></h4></div>
			<div class="appdesp">
				<h5>介绍</h5>
<p class="deta">全面替代瓷砖和其他材料，安装方便，使用寿命长、不生锈、抗撞击，而且采用特殊工艺涂覆高性能抗菌涂层具有杀菌、除臭、自净、防霉、抗紫外线、抗风沙、防潮湿等卓越特性。</p>							</div>
		</div>
</section>
	<section class="appdetas wp"><h5>优势</h5><ul class="appul clearfix">
	<li>
		<p>
			<img border="0" data-pinit="registered" hspace="0" src="/cmf/tpl/bs/Public/Pic/20140514015800380.png" style="float:none;" title="取代.png" vspace="0" /></p>
		<p class="tit">
			取代性强</p>
		<p class="detals">
			产品适用于酒店、家居、办公室、商场及医院、生化实验室等无尘房场所及水蒸汽较严重的场所，如卫生间、浴室、厨房等；相当于大块的&quot;陶瓷板&quot;安装容易，是目前常用外墙板的理想更新换代产品</p>
		<p>
			&nbsp;</p>
	</li>
	<li>
		<p>
			<img border="0" data-pinit="registered" hspace="0" src="/cmf/tpl/bs/Public/Pic/20140514015834678.png" style="float:none;" title="杀菌.png" vspace="0" /></p>
		<p class="tit">
			杀菌防霉</p>
		<p class="detals">
			耐湿性优良，是霉菌的非营养素，表面特殊聚酯有硬度，耐磨性好所以不会起尘，表面光洁灰尘也不易附着，细菌不易繁殖。表面履涂抗菌涂料的产品，抗菌性能更加优异；耐候耐酸碱耐药品类侵蚀，耐污染性优越</p>
		<p>
			&nbsp;</p>
	</li>
	<li>
		<p>
			<img border="0" data-pinit="registered" hspace="0" src="/cmf/tpl/bs/Public/Pic/20140514015904870.png" style="float:none;" title="可靠性.png" vspace="0" /></p>
		<p class="tit">
			可靠性强</p>
		<p class="detals">
			彻底解决了因墙体面开裂、脱落而造成保温性下降的问题。</p>
		<p>
			&nbsp;</p>
	</li>
	<li>
		<p>
			<img border="0" data-pinit="registered" hspace="0" src="/cmf/tpl/bs/Public/Pic/20140514015933392.png" style="float:none;" title="装饰性.png" vspace="0" /></p>
		<p class="tit">
			装饰性强</p>
		<p>
			奥菲板的颜色可在建筑色卡中任意选取，而且有金属、珠光、花岗石、大理石等质感效果，施工方便。</p>
		<p class="detals">
			&nbsp;</p>
		<p>
			&nbsp;</p>
	</li>
</ul>
<script charset="UTF-8" id="huaban_inject_script" type="text/javascript">
window.HUABAN_PRESETTINGS = { autoInitialize: false };</script>
<script charset="UTF-8" id="huaban_script" src="/cmf/tpl/bs/Public/Js/widgets.min.js" type="text/javascript">
</script>
</section>								
              <section class="relevantcase wp">
 <h4 class="inside">相关案例</h4>
 <?php $lists=sp_sql_posts_paged("cid:17;order:post_date DESC;",4); ?>
  <ul class="clearfix">
   <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
   	<?php $smeta=json_decode($vo['smeta'], true); ?>
			<img src="/cmf/data/upload/<?php echo ($smeta["thumb"]); ?>" alt="" />
			<a class="hover" href="<?php echo U('article/index',array('id'=>$vo['tid']));?>"><span class="dest"><span><?php echo ($vo["post_title"]); ?></span><span class="more">more<i></i></span></span></a>
		</li><?php endforeach; endif; else: echo "" ;endif; ?>

  </ul>
 
</section>
<br /><br />
		<footer>
		
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