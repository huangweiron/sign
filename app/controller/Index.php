<?php
namespace app\controller;

use app\BaseController;
use think\View;
use think\facade\Db;
use think\facade\Session;
class Index extends BaseController
{
    public function index(View $view)
    {
        //登录界面
        return $view->fetch();
    }
    public function login()
    {
        //登录功能
        if(isset($_POST['submit']))
        {
            $username=$_POST['username'];
            $password=$_POST['password'];
            $radio=$_POST['radio'];
            if($username =='' && $password == '')
            {
                echo '<script>alert("账号或密码为空");history.go(-1)</script>';
            }else{
                $res = Db::table($radio)->where('username',$username)->where('password',$password)->find();
                if($res=='')
                {
                    echo '<script>alert("账号或密码错误！请重新登录");history.go(-1);</script>';
                }else{
                    Session::set('user',$res);
                    if($radio=='student'){
                        return redirect('../student');
                    }else if($radio=='teacher')
                    {
                        return redirect('../teacher');
                    }else if($radio=='instructor')
                    {
                        return redirect('../instructor');
                    }
                }
            }
        }
    }

  
}
