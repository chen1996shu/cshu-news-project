<?php
namespace app\common\validate;
use think\Validate;

class News extends Validate{

    protected $rule = [
        'title' => 'require',
        'description' => 'require',
        'content' => 'require',
        'image' => 'require',
        'catid' => 'require'
    ];

    protected $message = [
        'title.require' => '新闻标题不能为空',
        'description.require' => '新闻摘要不能为空',
        'content.require' => '新闻内容不能为空',
        'image.require' => '缩略图不能为空',
        'catid.require' => '所属栏目不能为空',
    ];


}
