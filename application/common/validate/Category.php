<?php
namespace app\common\validate;
use think\Validate;

class Category extends Validate{

    protected $rule = [
        'cat_name' => 'require',
        'parent_id' => 'require'
    ];

    protected $message = [
        'cat_name.require' => '栏目名称不能为空',
        'parent_id.require' => '所属栏目不能为空',
    ];


}
