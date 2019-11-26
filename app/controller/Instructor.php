<?php
namespace app\controller;

use app\BaseController;
use think\View;
use think\facade\Db;
class Instructor extends BaseController
{
    public function index(View $view)
    {
        return $view->fetch();
    }
    public function ban(View $view)
    {
        $res=Db::table('class')->select();
        // dump($res);
        $view->assign('ban',$res);
        return $view->fetch();
    }
    public function banday()
    {
        $res=$student->nowtime();
    }
}