<?php
/**
 * Created by PhpStorm.
 * User: kj
 * Date: 2019/3/4
 * Time: 15:27
 */
namespace app\common\model;
use think\Db;
use think\Model;

class Comment extends Model{

    //新增评论
    public function add($data){
        if(!is_array($data)){
            $this->except('参数错误');
        }
        $this->allowField(true)->save($data);
        return $this->id;
    }

    //查询
    public function selectComment($condition=[], $order='', $field='', $limit=0)
    {
        $result = Db::name('comment')->alias('c')->join('gz_user u','c.user_id=u.id')->where($condition)->order($order)->field($field)->limit($limit)->select();
        return $result;
    }

    //单个查询
    public function findComment($condition=[], $order='', $field='', $limit=0)
    {
        $result = Db::name('comment')->alias('c')->join('gz_user u','c.user_id=u.id')->where($condition)->order($order)->field($field)->limit($limit)->find();
        return $result;
    }


}