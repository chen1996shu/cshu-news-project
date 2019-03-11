<?php
namespace app\index\controller;

use think\cache\driver\Redis;
use think\Controller;
use think\Model;

class News extends Base
{
    public function index($catid)
    {
        $condition = [
            'catid' => $catid, //栏目下的文章
            'status' => 1, //审核通过的
        ];
        $order['listorder'] = 'desc';
        $news = Model('News')->paginate($condition,$order);
        $page = $news->render();
        return $this->fetch('',[
            'news' => $news,
            'page' => $page
        ]);
    }

    //文章详情
    public function detail($id){
        $news = Model('News')->find(['id'=>intval($id)]);
        //redis zSet当中的该成员阅读数+1
        $redis = new Redis();
        $redis->zincrby('hotNews',1, $news['id']);
        Model('News')->addReadCount(['id'=>$id]);
        //获取评论详情
        $commentCondition = [
            'c.news_id' => intval($id),
            'c.to_user_id' => 0,
        ];
        $field = "c.*,u.username,u.image";
        $comment = Model('Comment')->selectComment($commentCondition,'create_time asc',$field);
        $comments = [];
        foreach ($comment as $key=>$value){
            $treeCommentCondition = [
                'c.news_id' => $id,
                'c.to_user_id' => $value['user_id'],
                'c.parent_id' => $value['id'],
            ];
            $treeComment =  Model('Comment')->selectComment($treeCommentCondition,'create_time asc',$field);
            if(!empty($treeComment)){
                $value['treeComment'] = $treeComment;
            }
            $comments[$key] = $value;
        }
        return $this->fetch('',[
            'news' => $news,
            'comments' => $comments,
        ]);
    }
}
