<?php
namespace app\index\controller;

use think\Controller;
use think\Model;

class Index extends Base
{
    public function index()
    {
        $condition = [
            'is_position' => 1, //推荐的文章
            'status' => 1, //审核通过的
        ];
        $order['listorder'] = 'desc';
        $positionNews = Model('News')->paginate($condition,$order);
        $page = $positionNews->render();
        return $this->fetch('',[
            'positionNews' => $positionNews,
            'page' =>$page,
        ]);
    }
}
