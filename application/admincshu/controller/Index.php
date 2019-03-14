<?php
namespace app\admincshu\controller;
use think\Controller;
class Index extends Base
{
    public function index()
    {
        return $this->fetch();
    }

    public function welcome()
    {
        return "新闻资讯管理后台";
    }


}
