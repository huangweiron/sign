<?php
namespace app\controller;
use app\BaseController;
use think\facade\Session;
class Comm extends BaseController
{
    public function index()
    {
        Session::clear();
        return redirect('../Index');
    }
    
}