<?php
namespace app\controller;
use app\BaseController;
use think\facade\Session;
class Comm extends BaseController
{
    public function index()
    {
        //退出按钮
        Session::clear();
        return redirect('../Index');
    }
    public function nowtime()
    {
        //开学时间9月1日 3/1
        $monDay ='09/01'; //第一学期开学时间
        $todate ='03/01'; //第二学期开学时间
        $todaytime=strtotime("today"); //现在的时间
        if(strtotime($monDay)<$todaytime){
            $start=strtotime($monDay);
            $live=$todaytime-$start;
            $day=60*60*24; 
            $num=$live/$day;  //天数
            $week=ceil($num%7);    //星期几
            $zhou=number_format(ceil($num/7)+1); //第几周
            switch($week)
            {
                case 1:
                    $weeknum="星期一";
                break;
                case 2:
                    $weeknum="星期二";
                break;
                case 3:
                    $weeknum="星期三";
                break;
                case 4:
                    $weeknum="星期四";
                break;
                case 5:
                    $weeknum="星期五";
                break;
                case 6:
                    $weeknum="星期六";
                break;
                case 0:
                    $weeknum="星期日";
                break;
            }
            $date=date("H:i");
            $now=['week'=>$zhou,'zhou'=>$weeknum,'time'=>$date];
            return $now;
        }else if(strtotime($todate)<$todaytime&&strtotime($monDay)<$todaytime){
            $start=strtotime($todate);
            $live=$todaytime-$start;
            $day=60*60*24; 
            $num=$live/$day;  //天数
            $week=$num%7;    //星期几
            $zhou=$num/7+1; //第几周
            switch($week)
            {
                case 1:
                    $weeknum="星期一";
                break;
                case 2:
                    $weeknum="星期二";
                break;
                case 3:
                    $weeknum="星期三";
                break;
                case 4:
                    $weeknum="星期四";
                break;
                case 5:
                    $weeknum="星期五";
                break;
                case 6:
                    $weeknum="星期六";
                break;
                case 0:
                    $weeknum="星期日";
                break;
            }
            $now=['week'=>'第'.$zhou.'周','zhou'=>$weeknum];
            return $now;
        }
    }
}