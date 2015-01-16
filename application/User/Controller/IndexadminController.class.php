<?php

/**
 * 会员
 */
namespace User\Controller;
use Common\Controller\AdminbaseController;
class IndexadminController extends AdminbaseController {

    function index(){

    	$users_model=M("Users");
    	$count=$users_model->where(array("user_type"=>2))->count();
    	$page = $this->page($count, 20);
    	$lists = $users_model
    	->where(array("user_type"=>2))
    	->order("create_time DESC")
    	->limit($page->firstRow . ',' . $page->listRows)
    	->select();
    	$this->assign('lists', $lists);
    	$this->assign("page", $page->show('Admin'));
    	$this->display(":index");

    }
    
    function ban(){
    	$id=intval($_GET['id']);
    	if ($id) {
    		$rst = M("Users")->where(array("id"=>$id,"user_type"=>2))->setField('user_status','0');
    		if ($rst) {
    			$this->success("会员拉黑成功！", U("indexadmin/index"));
    		} else {
    			$this->error('会员拉黑失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }
    
    function cancelban(){
    	$id=intval($_GET['id']);
    	if ($id) {
    		$rst = M("Users")->where(array("id"=>$id,"user_type"=>2))->setField('user_status','1');
    		if ($rst) {
    			$this->success("会员启用成功！", U("indexadmin/index"));
    		} else {
    			$this->error('会员启用失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }

    function authorize(){
        $id= intval(I("get.id"));
        $users_model=M("Users");
        $user=$users_model->where(array("id"=>$id))->find();
        $this->assign("user",$user);
        $this->display(":authorize");
    }

    function add_post(){
        if(IS_POST){
            $id= intval(I("get.id"));
            $users_model=M("Users");
            $user=$users_model->where(array("id"=>$id))->find();
            if ( $users_model->where( array("id"=>$id) )->save( array("authorize"=>$_POST['post']['post_content']) ) ){
                $this->success("添加成功！", U("Indexadmin/index"));
            }else {
                $this->error("添加失败！");
            }
        
        }
    }

}
?>
