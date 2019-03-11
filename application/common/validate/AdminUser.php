<?php
namespace app\common\validate;
use think\Validate;

class AdminUser extends Validate{

    protected $rule = [
        'username' => 'require|max:10',
        'password' => 'require'
    ];

    protected $message = [
        'username.require' => '管理员账号不能为空',
		'username.max' => '账号长度不能大于10',
        'password.require' => '密码不能为空',
    ];


}
