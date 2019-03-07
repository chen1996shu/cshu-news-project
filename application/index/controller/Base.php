<?php
namespace app\index\controller;
use think\cache\driver\Redis;
use think\Controller;
//校验用户是否登录

class Base extends Controller
{
    //初始化方法

    public function _initialize(){

        parent::_initialize(); // TODO: Change the autogenerated stub
        $redis = new Redis();
        //栏目分类 变动情况不大用redis缓存
        if($redis->has('category')){
            $category = $redis->get('category');
        }else{
            $category = Model('Category')->select();
            $redis->set('category',$category,60*60);
        }
        //排行榜排名 redis set()
        //$redis->rm('hotNews');
        if(!$redis->zsize('hotNews')){
            $hotCodition = [
                'status' =>1,
            ];
            $orders['create_time'] = 'desc';
            $hotNews = Model('News')->select($hotCodition,$orders,'id,read_count');
            foreach ($hotNews as $key=>$value){
                $redis->zadd('hotNews', $value['read_count'], $value['id']);
            }
        }
        $hotNews = $redis->zrevrange('hotNews',0,2,true);
        $this->assign('category',$category);
        $this->assign('hotNews',$hotNews);
    }
























}
