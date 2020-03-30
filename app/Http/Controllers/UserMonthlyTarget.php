<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Session;

use App\lib\UserMonthlyTarget_class;

use App\lib\user_registration;

class UserMonthlyTarget extends Controller
{

    public function __construct(UserMonthlyTarget_class $user_monthly_target,User_Registration $user_registration) 
    {
        $this->user_monthly_target = $user_monthly_target;

        $this->user_registration = $user_registration;
    }

    public function index()
    {
        $userId = Session::get('UID');

        $output = $this->user_registration->getUserInfoByUserId($userId);

        $session = $this->user_monthly_target->getSessionList();

        $getUserWiseMonthlyDetails = $this->user_monthly_target->getUserWiseMonthlyDetails($userId);

        return view('userMonthlyTarget.index',compact('output','session','getUserWiseMonthlyDetails'));
    }

    public function add(Request $request)
    {
        $user_id = Session::get('UID');

        $session = request('session');

        $monthlyTargetDay = request('monthlyTargetDay');

        $monthlyTargetMonth = request('monthlyTargetMonth');

        $monthlyTargetYear = request('monthlyTargetYear');

        $amount = request('amount');

        $remark = request('remark');

        $output = $this->user_monthly_target->add($user_id,$session,$monthlyTargetDay,$monthlyTargetMonth,$monthlyTargetYear,$amount,$remark);

        $data['message'] ='Monthly Target Added. Go to  Dashboard using button';
        $data['text'] = '';

        return view('dashboard_return.success',$data);
    }


    public function reportInit()
    {
        $getActiveSalesExecutiveList = $this->user_registration->getActiveSalesExecutiveList();

        $getSessionList = $this->user_monthly_target->getSessionList();

        // dd($getSessionList);

        return view('userMonthlyTarget.reportInit',compact('getActiveSalesExecutiveList','getSessionList'));
    }

    public function getReport(Request $request)
    {
        $se_value = $request->input('se_value');
        $session_value = $request->input('session_value');
        $fromDay_value = $request->input('fromDay_value');
        $fromMonth_value = $request->input('fromMonth_value');
        $fromYear_value = $request->input('fromYear_value');
        $toDay_value = $request->input('toDay_value');
        $toMonth_value = $request->input('toMonth_value');
        $toYear_value = $request->input('toYear_value');

        $output = $this->user_monthly_target->getReport($se_value,$session_value,$fromDay_value,$fromMonth_value,$fromYear_value,$toDay_value,$toMonth_value,$toYear_value);

        return $output;
    }


}