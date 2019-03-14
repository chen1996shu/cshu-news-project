<?php
/**
 * Created by PhpStorm.
 * User: kj
 * Date: 2019/3/4
 * Time: 14:41
 */
namespace app\admincshu\controller;
use think\Controller;
use think\Model;
use think\Validate;

class Adminer extends Base
{

    public function index(){
        $adminer = Model('Adminer')->select();
        return $this->fetch('',[
            'adminer' => $adminer,
        ]);
    }

    //新增管理员
    public function add(){
        //判断是否提交
        if($this->request->isPost()){
            $data = input('post.');
            //判断用户输入是否合法
            $validate = \validate('AdminUser');
            if(!$validate->check($data)){
                $this->error($validate->getError());
            }
            //判断该账号是否已经存在,并做过滤防止sql注入
            $condition = [
                'username' => sqlReplace($data['username']),
            ];
            $ret = Model('Adminer')->find($condition);
            if($ret){
                return show(-1, '管理员账号已存在');
            }
            $data['password'] = md5($data['password']);
            $data['username'] = str_replace('script','',$data['username']);
            $data['create_time'] = time();
            $result = Model('Adminer')->add($data);
            if($result){
				return show(1, '新增成功');
            }
        }else{
            return $this->fetch();
        }
    }
}
