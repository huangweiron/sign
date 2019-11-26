<?php
namespace app\controller;

use app\BaseController;
use think\facade\Session;
use think\View;
use app\model\Sktime;
use app\model\Kaoqin;
use app\controller\Comm;
class  Student extends BaseController
{
    public function index(View $view)
    {   
        //学生进入界面
        $user=Session::get('user');
        echo '<script>alert("欢迎'.$user['name'].'同学")</script>';
        $view->assign('user',$user);
        return $view->fetch();
    }
    public function sign(Sktime $sktime,Kaoqin $kaoqin,Comm $comm)
    {
        //签到功能
        $res=$comm->nowtime();
        $user=Session::get('user');
        $zhouzi=$res['week'];
        $week=$res['zhou'];
        $time=$res['time'];//现在的时间
        $sk=[
            ['num'=>'1','start'=>'8:10','end'=>'8:55'],
            ['num'=>'2','start'=>'9:05','end'=>'9:50'],
            ['num'=>'3','start'=>'10:10','end'=>'10:55'],
            ['num'=>'4','start'=>'11:05','end'=>'11:50'],
            ['num'=>'5','start'=>'14:30','end'=>'15:15'],
            ['num'=>'6','start'=>'15:25','end'=>'16:10'],
            ['num'=>'7','start'=>'16:20','end'=>'17:05'],
            ['num'=>'8','start'=>'17:05','end'=>'18:00'],
            ['num'=>'9','start'=>'19:30','end'=>'21:10'],
        ];
        $num=0;
        for($i=0;$i<=count($sk)-1;$i++)
        {
            // dump($sk[$i]);
            if($sk[$i]['start']<=$time && $sk[$i]['end']>=$time)
            {
                $timer=$sk[$i];
                $num=$sk[$i]['num'];
            }
        }
        if($num=='0')
        {
            echo "<script>alert('当前时间没课！');history.go(-1);</script>";
        }else{
            $as=$sktime->where('zhouzi',$zhouzi)->where('week',$week)->where('jieci',$num)->find();
            // $as=$sktime->where('zhouzi',"13")->where('week',"星期一")->where('jieci',"1")->find();
            if($as=='')
            {
                echo '<script>alert("当前没课！");history.go(-1);</script>';
            }else{
                if(strtotime($timer['start'])+60*10 >strtotime($time))   
                {
                    $state="准时";
                }else{
                    $state="迟到";
                }
            }
            $kq=$kaoqin->where('studentId',$user["Id"])->where('sktimeId',$as['Id'])->find();
            if($kq==' ')
            {
                $kq->save([
                    'studentId'=>$user['Id'],
                    'sktimeId'=>$as['Id'],
                    'state'=>$state
                ]);
                
                echo '签到';
            }else{
                $kaoqin->save([
                    'studentId'=>$user['Id'],
                    'sktimeId'=>$as['Id'],
                    'state'=>$state
                ]);
                echo '更新更改';
            }
            
        }
        
    }
    
}