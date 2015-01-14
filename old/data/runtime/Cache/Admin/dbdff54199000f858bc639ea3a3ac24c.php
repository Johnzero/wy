<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
<body class="J_scroll_fixed">
<div class="wrap jj">
  <div class="common-form">
    <form method="post" class="form-horizontal J_ajaxForm" action="<?php echo U('nav/edit_post');?>">
      <input type="hidden" class="input" name="id" value="<?php echo ($id); ?>">
      <div class="table_list">
        <table cellpadding="2" cellspacing="2" class="table_form" width="100%">
          <tbody>
          	<tr>
              <td width="180">菜单分类:</td>
              <td>
              	<select name="cid" id="navcid_select" class="normal_select">
              		<?php if(is_array($navcats)): foreach($navcats as $key=>$vo): $navcid_selected=$navcid==$vo['navcid']?"selected":""; ?>
		             	<option value="<?php echo ($vo["navcid"]); ?>" <?php echo ($navcid_selected); ?>><?php echo ($vo["name"]); ?></option><?php endforeach; endif; ?>
              	</select>
			  </td>
            </tr>
            <tr>
              <td>上级:</td>
              <td>
              	<select name="parentid" class="normal_select">
              		<option value="0">/</option>
              		<?php echo ($nav_trees); ?>
              	</select>
			  </td>
            </tr>
            <tr>
              <td>标签:</td>
              <td><input type="text" class="input" name="label" value="<?php echo ($label); ?>"><span class="must_red">*</span></td>
            </tr>
            <tr>
              <td>地址:</td>
              <td>
              	<input type="radio" name="nav" id="outlink">
              	<input type="text" class="input" name="href" id="outlink_input" value="http://" />
              	
				<input type="radio" name="nav" id="selecturl">
              	<select name="href" id="selecthref" class="normal_select">
                  <option disabled="disabled">默认</option>
                  <option value="home">&nbsp;&nbsp;&nbsp;&nbsp;首页</option>
                  <?php if(is_array($navs)): foreach($navs as $key=>$vo): ?><option disabled="disabled"><?php echo ($vo["name"]); ?></option>
	            	<?php if(is_array($vo['items'])): foreach($vo['items'] as $key=>$voo): ?><option value='<?php echo ($voo["rule"]); ?>'>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo ($voo["label"]); ?></option><?php endforeach; endif; endforeach; endif; ?>
                </select>
                <!-- 
              	<textarea readonly="readonly" rows="5" cols="57" id="href_input"><?php echo ($href); ?></textarea>
              	<input type="hidden" name="href" id="u_input" value='<?php echo ($hrefold); ?>' />
              	 -->
              </td>
            </tr>
            <tr>
              <td>打开方式:</td>
              <td>
              	<select name="target">
              		<option value="">默认方式</option>
              		<option value="_blank">新窗口打开</option>
              	</select>
			  </td>
            </tr>
            <tr>
              <td>图标:</td>
              <td><input type="text" class="input" name="icon" value="<?php echo ($icon); ?>"></td>
            </tr>
            <tr>
              <td>显示:</td>
              <td>
              	<select name="status" class="normal_select">
              		<option value="1">显示</option>
              		<option value="0">隐藏</option>
              	</select>
			  </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="form-actions">
            <button type="submit" class="btn btn-primary btn_submit J_ajax_submit_btn">更新</button>
            <a class="btn" href="/index.php/Admin/Nav">返回</a>
      </div>
    </form>
  </div>
</div>
<script src="/statics/js/common.js"></script>
<script>
$(function(){
	$("#navcid_select").change(function(){
		location.href=location.href+"&cid="+$(this).val();
	});
	
	$("#selecthref").click(function(){
		checkChange(2);
	});
	$("input[name='href']").click(function(){
		checkChange(1);
	});
	
	var opt = $("#selecthref option[value='"+'<?php echo ($hrefold); ?>'+"']");
	if(opt.length > 0){
		opt.attr('selected','selected');
		checkChange(2);
	}else{
		checkChange(1);
		$('#outlink_input').val('<?php echo ($hrefold); ?>');
	}
	
	function checkChange(i){
		if(i==1){
			//自动输入url
			$('#outlink_input').attr('name','href');
			$('#selecthref').removeAttr('name');
			$('#outlink').attr({'checked':'checked', 'name':'nav'});
		}else{
			//选择链接url
			$('#selecthref').attr('name','href');
			$('#outlink_input').removeAttr('name');
			$('#selecturl').attr({'checked':'checked', 'name':'nav'});
		}
	}
	/*
 	Wind.use('ajaxForm','artDialog','iframeTools', function () {
	 	$("#href_input").click(function(){
	 		art.dialog.data('menu_url', $("#href_input").val());
	 		art.dialog.open("<?php echo u('nav/select');?>", {
                title: "选择链接地址",
                close: function () {
        			var checked_v = art.dialog.data('checked_v');
        			var checked_u = art.dialog.data('checked_u');
        			if (checked_v !== undefined) $('#href_input').val(checked_v);
        			if (checked_u !== undefined) $('#u_input').val(checked_u);
        		}
            },false);
		});
    });
	*/
});


</script>
</body>
</html>