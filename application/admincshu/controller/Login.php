<?php
namespace app\admincshu\controller;
use think\cache\driver\Redis;
use think\Controller;
use think\Model;

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
			$ip = request()->ip();
			//如果用户重复登录失败三次,冻结用户或者该ip地址5分钟
			$logDate = [
				'create_time' => time(),
				'ip' => $ip,
				'username' => $data['username'],
			];
			$redis = new Redis();
			if($redis->get($ip) >= 3 || $redis->get($data['username']) >= 3){
				$logDate['error'] = '重复登录失败三次';
				Model('LoginLog')->add($logDate);
				$redis->set($ip, 3, 5*60);
				$redis->set($data['username'], 3, 5*60);
				return show(-1,'重复登录失败超过三次,请五分钟后再登录');
			}
            $condition = [
            	//字符串替换,防止sql注入
                'username' => sqlReplace($data['username']),
            ];
            $adminer = Model('Adminer')->find($condition);
            if(!$adminer){
            	$logDate['error'] = '账号不存在';
            	Model('LoginLog')->add($logDate);
            	$redis->inc($ip, 1);
				$redis->inc($data['username'], 1);
                return show(-1,'管理员账号或者密码错误');
            }
            if($adminer['password'] != md5($data['password'])){
				$logDate['error'] = '密码错误';
				Model('LoginLog')->add($logDate);
				$redis->inc($ip, 1);
				$redis->inc($data['username'], 1);
                return show(-1,'管理员账号或者密码错误');
            }
            //更新用户的登录信息
            $udata = [
                'last_login_time' => time(),
                'last_login_ip' => $ip,
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
