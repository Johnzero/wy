<?php
class MenuAction extends CommAction {
	
    public function index(){ 
        $condition = $this->_param('query');
        if(!empty($condition)){
            $condition = queryFilter($condition);
        }

        $M =  M(MODULE_NAME);
        $condition['is_deleted']='0';
        $select = $M->where()->join()->order();
        $this->page($select,$condition,'menu'); 
    }
    public function save(){ 
        layout(!$this->isAjax()); 
            
        $M  = M(MODULE_NAME);
        if(!$M->create()){
            $this->error($M->getError());
        }

        $pid=$this->_param('pid');
        if($pid!=0){
            $level = $M->where('id='.$pid)->getField('level');
            ++$level;
        }
        else{
            $level=0;
        }
        $data=$M->data();
        $data['level']=$level;
        $id = $M->getPk();
        if(empty($M->$id)){
            $result = $M->data($data)->add();
            $data = $M->find($id);
            log($data,$result);
        }
        else{
            $result = $M->save($data);
            $data = $M->find($M->$id);
            log($data,$result);
        }
        if($this->isAjax())
            $this->ajaxReturn($result?'Success':'Fail');
        else 
            if($result){ 
                $this->success('Success');
            }
            else{
                $this->error('Fail');
            }                     
    }
    public function tree(){
        $this->display("Comm:Index:tree");
    }
    public function treeedit(){
        $this->display("Comm:Index:treeedit");
    }
    public function sidebar(){
        $M=M(MODULE_NAME);
        $data=$M->field("id,level,pid,name,title")->select();

        //转换成数组，同级节点的索引值相同

        foreach ($data as $key => $value) {
        	$ary[$value['level']][$value['id']]=array();
        	$index[$value['id']]=$key;
        }
        $i=0;
        $n=count($ary);
        //倒序将下一级节点添加到当前节点的子节点
    	foreach (array_reverse($ary) as $key => $value) {
    		if(++$i==$n)break;
    		foreach ($value as $k => $val) {
    			$ary[$data[$k-1]['level']-1][$data[$k-1]['pid']][$k]=$ary[$key][$k];		
    		}
    	}
    	foreach ($ary as $key => $value) {
    		$i=1;$j=1;
    		$content='';
    		$this->show($data,$ary[$key],$index,$i,$j,$content);
    		break;
    	}
        layout(!$this->isAjax());
    	$this->display('Index:sidebar');
    }

    public function get_level_nodes(){
        $M=M(MODULE_NAME);
        $condition=array('is_deleted'=>'0','status' =>'1');
        $result=$M->field("id,level,pid,name,title")->where($condition)->order('level')->select();

        //转换成数组，同级节点的索引值相同
        $index[0]=0;
        foreach ($result as $key => $value) {
            $data[$value['level']][$key]=null;
            $index[$value['id']]=$key;
        }
        $level=count($data);
        foreach (array_reverse($data,true) as $key => $value) {
            if(++$i===$level)break;
            foreach ($value as $k => $v) {
                $data[$key-1][$index[$result[$k]['pid']]][$k]=$data[$key][$k]; 
            }          
            unset($data[$key]);
        }
        $i=0;
        $content[0]="顶级菜单";
        $this->node_level($result,$data[0],$i,$content);
        
        return $content;
    }
    protected function node_level(&$result,&$ary,$i,&$content){
        foreach ($ary as $k => $v) {
            $content[$result[$k]['id']]= str_repeat('&nbsp;&nbsp;&nbsp;&nbsp;',$i).'└─'.$result[$k]['title'];
            if(is_array($v)){
                $this->node_level($result,$v,$i+1,$content);
            }
        }
    }
    public function allnodes($ids=null){
        if(!empty($ids)){
            $M= M();
            $n=count(explode(',', $ids));
            $result=$M->query("
            SELECT id,name,title,pid
            FROM menu
            ");
        }
        else{
            $M= M(MODULE_NAME);
            $map=array('status'=>'1','is_deleted'=>0);
            $result=$M->field("id,name,pId")->where($map)->select();
        }
        $this->ajaxReturn($result,'JSON');
     }
    public function nodes(){
        $id=$this->_param('id');
        $type=$this->_param('type');
        $data['name']=$this->_param('name');
        $data['pid']=$this->_param('pid');
        $M=M(MODULE_NAME);
        if(empty($type)){
            if(empty($id))$id=0;
            $result=$M->field("id,name,pid")->where('pid='.$id)->select();
        }else if($type=="all"){
            $result=$M->field("id,name,pid")->select();
        }else if($type=="edit"){
            $result=$M->where('id='.$id)->save($data);
        }else if($type=='add'){
            $data['isnode']=($data['pid']==0?'0':'1');
            $result=$M->add($data);
        }else if($type=='del'){
            $result=$M->where('id='.$id)->delete();
        }
        $this->ajaxReturn($result!==false?'Success':'Fail');
        
    }
}