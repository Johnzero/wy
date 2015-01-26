<?php
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class AuthorizeController extends AdminbaseController {

    function _initialize() {
        parent::_initialize();
    }

    function index(){

    	$count = M("Authorize")->count();
    	$page = $this->page($count, 20);
    	$lists = M("Authorize")
    	->order("create_time DESC")
    	->limit($page->firstRow . ',' . $page->listRows)
    	->select();
    	$this->assign('lists', $lists);
    	$this->assign("page", $page->show('Admin'));
    	$this->display();

    }
    
        /**
     * 添加角色
     */
    public function add() {
        $this->display();
    }
    
    /**
     * 添加角色
     */
    public function add_post() {
        if ( !trim($_POST['username']) ) {
            $this->error("请填写姓名！");
        }
        if ( !trim($_POST['uid']) ) {
            $this->error("请填写授权号！");
        }
        if ( !trim($_POST['wechat_name']) ) {
            $this->error("请填写微信账号！");
        }
        if ( !trim($_POST['authorize']) ) {
            $this->error("请填写授权内容！");
        }
        if (IS_POST) {
            $_POST["create_time"] = time();
            if (M("Authorize")->create()) {
                if (M("Authorize")->add()!==false) {
                    $this->assign("jumpUrl", U("Authorize/index"));
                    $this->success("添加授权成功",U("Authorize/index"));
                } else {
                    $this->error("添加失败！");
                }
            } else {
                $this->error(M("Authorize")->getError());
            }
        }
    }

    /**
     * 删除角色
     */
    public function delete() {
        $id = intval(I("get.id"));
        $status = M("Authorize")->delete($id);
        if ($status!==false) {
            $this->success("删除成功！", U('Authorize/index'));
        } else {
            $this->error("删除失败！");
        }
    }

    /**
     * 编辑角色
     */
    public function edit() {
        $id = intval(I("get.id"));
        if ($id == 0) {
            $id = intval(I("post.id"));
        }
        $data = M("Authorize")->where(array("id" => $id))->find();
        if (!$data) {
            $this->error("该授权书不存在！");
        }
        $data['authorize'] = htmlspecialchars_decode($data['authorize']);
        $this->assign("data", $data);
        $this->display();
    }
    
    /**
     * 编辑角色
     */
    public function edit_post() {
        $id = intval(I("get.id"));

        if (IS_POST) {
            $data = M("Authorize")->create();
            if ($data) {
                if (M("Authorize")->save($data)!==false) {
                    $this->success("修改成功！", U('Authorize/index'));
                } else {
                    $this->error("修改失败！");
                }
            } else {
                $this->error(M("Authorize")->getError());
            }
        }
    }


}
?>
