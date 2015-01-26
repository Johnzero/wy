<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
    <title>微赢生物科技有限公司</title>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--<script>document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':8080/livereload.js?snipver=1"></' + 'script>')</script> -->

    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->

	<link href="/statics/simpleboot/themes/<?php echo C('SP_ADMIN_STYLE');?>/theme.min.css" rel="stylesheet">
    <link href="/statics/simpleboot/css/simplebootadmin.css" rel="stylesheet">
    <link href="/statics/js/artDialog/skins/default.css" rel="stylesheet" />
    <link href="/statics/simpleboot/font-awesome/4.2.0/css/font-awesome.min.css"  rel="stylesheet" type="text/css">
    <style>
		.length_3{width: 180px;}
	</style>
	<!--[if IE 7]>
	<link rel="stylesheet" href="/statics/simpleboot/font-awesome/4.2.0/css/font-awesome-ie7.min.css">
	<![endif]-->
<script type="text/javascript">
//全局变量
var GV = {
    DIMAUB: "/",
    JS_ROOT: "statics/js/",
    TOKEN: ""
};
</script>
<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/statics/js/jquery.js"></script>
    <script src="/statics/js/wind.js"></script>
    <script src="/statics/simpleboot/bootstrap/js/bootstrap.min.js"></script>
<?php if(APP_DEBUG): ?><style>
		#think_page_trace_open{
			z-index:9999;
		}
	</style><?php endif; ?>
<head/>
<body>
<div class="wrap J_check_wrap">
  <ul class="nav nav-tabs">
     <li class="active"><a href="<?php echo U('authorize/index');?>">授权列表</a></li>
     <li><a href="<?php echo U('authorize/add');?>">添加授权</a></li>
  </ul>
  <div class="table_list">
  <form name="myform" action="" method="post">
    <table width="100%" cellspacing="0" class="table table-hover">
      <thead>
        <tr>
          <th width="30">ID</th>
          <th align="left" >姓名</th>
          <th align="left" >授权号</th>
          <th align="left" >微信号</th>
          <th width="300">管理操作</th>
        </tr>
      </thead>
      <tbody>
        <?php if(is_array($lists)): foreach($lists as $key=>$vo): ?><tr>
          <td><?php echo ($vo["id"]); ?></td>
          <td><?php echo ($vo["username"]); ?></td>
          <td><?php echo ($vo["uid"]); ?></td>
          <td>
            <?php echo ($vo["wechat_name"]); ?>
          </td>
          <td class="text-c">

            <a href="<?php echo U('authorize/edit',array('id'=>$vo['id']));?>">修改</a> | <a class="J_ajax_del" href="<?php echo U('authorize/delete',array('id'=>$vo['id']));?>">删除</a>

          </td>
        </tr><?php endforeach; endif; ?>
      </tbody>
    </table>
  </form>
  </div>
</div>
<script src="/statics/js/common.js"></script>
</body>
</html>