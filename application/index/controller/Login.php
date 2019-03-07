<?php
namespace app\index\controller;

use think\Controller;
use think\Model;

class Login extends Base
{
    public function index(){
        return $this->fetch();
    }

    public function login(){
        if($this->request->isPost()){
            $data = input('param.');
            $condition = [
                'username' => $data['username'],
            ];
            $adminer = Model('User')->find($condition);
            if(!$adminer){
                return show(-1,'账号不存在');
            }
            if($adminer['password'] != md5($data['password'])){
                return show(-1,'密码错误');
            }
            return show(1,'登录成功',$adminer);
        }
    }
}
