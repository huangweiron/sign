<?php
namespace app\controller;
use app\BaseController;
use think\facade\Session;
use think\View;
use app\model\Sktime;
use think\facade\Db;
use app\model\Kaoqin;
use app\controller\Student;
use app\controller\Comm;
class Teacher extends BaseController
{
    public function index(View $view)
    {
        return $view->fetch();
    }
    public function sker(View $view)
    {
        //上课课程
        $kc=Db::query("select *,sktime.Id as Id from sktime,curriculumplan,curriculum,class where sktime.curriculumplanId=curriculumplan.Id and curriculumplan.curriculumId=curriculum.Id and sktime.classId=class.Id");
        // dump($kc);
        $view->assign('kc',$kc);
        return $view->fetch();
    }
    public function state(View $view)
    {
        //考勤
        $sktimeId=$_GET['sktimeId'];
        $jk=Db::query("select * from kaoqin,student where kaoqin.studentId=student.Id and kaoqin.sktimeId=$sktimeId");
        // dump($jk);
        $view->assign('jk',$jk);
        return $view->fetch();
    }
    public function statemove(Kaoqin $kaoqin)
    {
        //修改学生考勤
        $sktimeId=$_POST['sktimeId'];
        $studentId=$_POST['studentId'];
        $state=$_POST['state'];
        // echo $sktimeId;
        $stud=$kaoqin->where('studentId',$studentId)->where('sktimeId',$sktimeId)->find();
        $stud->state=$state;
        $stud->save();
        echo '<script>alert("修改成功");history.go(-1);</script>';
    }
    public function live(View $view,Comm $comm)
    {
        //判断有无上课
        $res=$comm->nowtime();
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
            if($sk[$i]['start']<=$time && $sk[$i]['end']>=$time)
            {
                $timer=$sk[$i];
                $num=$sk[$i]['num'];
            }
        }
        $res='';
        if($num!='0')
        {
            $res=Db::query("select * from sktime,kaoqin,student where kaoqin.sktimeId=sktime.Id and kaoqin.studentId=student.Id and sktime.zhouzi=$zhouzi and sktime.week='$week' and sktime.jieci=$num");
        }else{
            echo '<script>alert("当前时间没课!");history.go(-1);</script>';
        }
        if(count($res)==0)
        {
            echo '<script>alert("当前时间没课!");history.go(-1);</script>';
        }else{
            dump($res);
            $view->assign('dq',$res);
            return $view->fetch();
        }
        
    }
}