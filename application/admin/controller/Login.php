<?php
namespace app\admin\controller;
use think\Controller;
class Login extends Base
{
    public function _initialize() {

    }
    public function index(){
        if($this->isLogin()){
            return $this->redirect('index/index');
        }
        return $this->fetch();
    }
    //用戶登录
    public function login(){
        if($this->request->isPost()){
            $data = input('param.');
            if(!captcha_check($data['code'])){
                return show(-1,'验证码错误');
            }
            $condition = [
            	//字符串替换,防止sql注入
                'username' => str_replace(' ','',$data['username']),
            ];
            $adminer = Model('Adminer')->find($condition);
            if(!$adminer){
                return show(-1,'管理员账号不存在');
            }
            if($adminer['password'] != md5($data['password'])){
                return show(-1,'密码错误');
            }
            //更新用户的登录信息
            $udata = [
                'last_login_time' => time(),
                'last_login_ip' => request()->ip(),
            ];
            $updateCondition = [
                'id' => $adminer['id'],
            ];
            Model('Adminer')->updateAdminer($updateCondition,$udata);
            //将用户信息保存到session当中
            session(config('admin.session_admin'),$adminer);
            return show(1,'登录成功');
        }
    }
    //用户退出登录
    public function loginout(){
        session(config('admin.session_admin'),null);
        return $this->redirect('login/index');
    }
}
