<?php
namespace app\index\controller;

use think\Controller;
use think\Model;

class Comment extends Base
{
    public function addComment(){
        //1、评论id 2、评论用户id 3、评论时间 4、回复内容 5、新闻id
        $data = input('param.');
        if(empty($data['user_id'])){
            return show(-1, '登录后才能评论',['jump_url'=>url('index/login/index')]);
        }
        if(empty($data['news_id'])){
            return show(-1, '非法操作');
        }
        $data['content'] = htmlspecialchars($data['content']);
        $data['create_time'] = time();
        $ret= Model('Comment')->add($data);
        if($ret){
            return show(1,'评论成功');
        }
        return show(-1, '评论失败');
    }
}
