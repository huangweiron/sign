<?php
namespace app\controller;

use app\BaseController;
use think\View;
use think\facade\Db;
use app\model\Sktime;
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
    public function banday(View $view,Sktime $sktime)
    {
        $classId=$_GET['classId'];
        $res=$sktime->distinct(true)->field(['zhouzi','week'])->where('classId',$classId)->select();
        $view->assign('time',$res);
        return $view->fetch();
    }
}