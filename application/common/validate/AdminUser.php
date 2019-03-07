<?php
namespace app\common\validate;
use think\Validate;

class AdminUser extends Validate{

    protected $rule = [
        'username' => 'require',
        'password' => 'require'
    ];

    protected $message = [
        'username.require' => '管理员账号不能为空',
        'password.require' => '密码不能为空',
    ];


}
