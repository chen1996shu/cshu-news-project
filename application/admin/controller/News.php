<?php
/**
 * Created by PhpStorm.
 * User: kj
 * Date: 2019/3/4
 * Time: 14:41
 */
namespace app\admin\controller;
use think\Controller;
use think\Model;
use think\Validate;

class News extends Base
{
    //新闻列表
    public function index(){
        $data = input('param.');
        $condition = [];
        if(!empty($data['catid'])){
            $condition['catid'] = $data['catid'];
        }
        if(!empty($data['start_time']) && !empty($data['end_time']) && $data['end_time'] > $data['start_time']) {
            $condition['create_time'] = [
                ['gt', strtotime($data['start_time'])],
                ['lt', strtotime($data['end_time'])],
            ];
        }
        if(!empty($data['title'])){
            $condition['title'] = $data['title'];
        }
        $news = Model('News')->paginate($condition);
        $category = Model('Category')->select();
        $page = $news->render();
        return $this->fetch('',[
            'category' => $category,
            'news' => $news,
            'page' => $page,
            'title' => !empty($data['title']) ? $data['title'] : '',
            'catid' => !empty($data['catid']) ? $data['catid'] : '',
            'start_time' => !empty($data['start_time']) ? $data['start_time'] : '',
            'end_time' => !empty($data['end_time']) ? $data['end_time'] : '',
        ]);
    }
    //新增新闻
    public function add(){
        //判断是否提交
        if($this->request->isPost()){
            $data = input('post.');
            //判断用户输入是否合法
            $validate = \validate('News');
            if(!$validate->check($data)){
                return show(-1,$validate->getError());
            }
            if(!empty($data['id'])){
                return $this->update($data['id'],$data);
            }
            $data['create_time'] = time();
            $data['update_time'] = time();
            $result = Model('News')->add($data);
            if($result){
                return show(1,'新增成功');
            }
        }else{
            $category = Model('Category')->select();
            return $this->fetch('',[
                'category' => $category,
            ]);
        }
    }
    //修改审核状态
    public function status($id, $status){
        $condition = [
            'id'=> $id
        ];
        $update = [
            'status' => $status,
            'update_time' => time(),
        ];
        $result = Model('News')->updateNews($condition, $update);
        if($result){
            return show(1, '更改状态成功',['jump_url' => $_SERVER['HTTP_REFERER']]);
        }else{
            return show(-1, '更改状态失败');
        }
    }
    //删除新闻
    public function delete($id){
        $condition = [
            'id'=> $id
        ];
        $result = Model('News')->deleteNews($condition);
        if($result){
            return show(1, '删除新闻成功',['jump_url' => $_SERVER['HTTP_REFERER']]);
        }else{
            return show(-1, '删除新闻失败');
        }
    }
    //编辑页面
    public function edit($id){
        $news = Model('News')->find(['id'=>$id]);
        $category = Model('Category')->select();
        return $this->fetch('',[
           'news' => $news,
            'category' =>$category,
        ]);
    }
    //更改文章内容
    public function update($id, $data){
        unset($data['id']);
        $condition = [
            'id'=> $id
        ];
        $result = Model('News')->updateNews($condition, $data);
        if($result){
            return show(1, '修改新闻成功');
        }else{
            return show(-1, '修改新闻失败');
        }
    }
    //更改文章排列顺序
    public function listorder($id){
        $data = input('param.');
        unset($data['id']);
        $condition = [
            'id'=> $id,
        ];
        $result = Model('News')->updateNews($condition, $data);
        if($result){
            return show(1, '修改排序成功',['jump_url' => $_SERVER['HTTP_REFERER']]);
        }else{
            return show(-1, '修改排序失败');
        }
    }
}
