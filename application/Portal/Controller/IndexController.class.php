<?php
namespace Portal\Controller;
use Common\Controller\HomeBaseController; 
/**
 * 首页
 */
class IndexController extends HomeBaseController {
	
    //首页
	public function index() {
    	$this->display(":index");
    }

    public function cha() {
    	$this->display(":cha");
    } 

    public function cha_answer()
    {

    	$uid = $_POST["uid"];

    	if ($uid) {

    		$data = M("Authorize")->where(array("uid"=>$uid))->find();
    		$authorize = $data['authorize'];
    		$this->assign('authorize', $authorize);
    		$this->display(":cha_answer");

        }else {
        	$this->display(":cha");
        }


    }


}

?>
