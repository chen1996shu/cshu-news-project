<?php
/**
 * Created by PhpStorm.
 * User: kj
 * Date: 2019/3/4
 * Time: 14:41
 */
namespace app\admincshu\controller;
use think\Controller;
use think\Model;
use think\Validate;

class Category extends Base
{

    public function index(){
        $category = Model('Category')->paginate();
        $page = $category->render();
        return $this->fetch('',[
            'category' => $category,
            'page' => $page
        ]);
    }

    //新增分类
    public function add(){
        //判断是否提交
        if($this->request->isPost()){
            $data = input('post.');
            //判断用户输入是否合法
            $validate = \validate('Category');
            if(!$validate->check($data)){
                $this->error($validate->getError());
            }
            //判断该是否已经存在
            $condition = [
                'cat_name' => $data['cat_name'],
            ];
            $ret = Model('Category')->find($condition);
            if($ret){
                return $this->error('栏目已存在');
            }
            $data['create_time'] = time();
            $result = Model('Category')->add($data);
            if($result){
                $this->success('新增成功',url('category/index'));
            }
        }else{
            $category = Model('Category')->select();
            return $this->fetch('',[
                'category' => $category,
            ]);
        }
    }
}
