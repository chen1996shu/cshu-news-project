<?php
/**
 * Created by PhpStorm.
 * User: kj
 * Date: 2019/3/4
 * Time: 15:27
 */
namespace app\common\model;
use think\Model;

class Category extends Model{

    //新增管理员
    public function add($data){
        if(!is_array($data)){
            $this->except('参数错误');
        }
        $this->allowField(true)->save($data);
        return $this->id;
    }

    //查询
    public function select($condition=[], $order=[], $field='', $limit=0)
    {
        $order = [
            'id' => 'desc',
        ];
        return $this->where($condition)->order($order)->field($field)->limit($limit)->select();
    }

    //分页
    public function paginate($condition=[], $order=[], $field='', $limit=0, $paginate = 10)
    {
        $order = [
            'id' => 'desc',
        ];
        return $this->where($condition)->order($order)->field($field)->limit($limit)->paginate($paginate);
    }

    //单个查询
    public function find($condition=[], $order='', $field='', $limit=0)
    {
        return $this->where($condition)->order($order)->field($field)->limit($limit)->find();
    }

    //修改
    public function updateCategory($condition, $update){
        return $this->where($condition)->update($update);
    }

}