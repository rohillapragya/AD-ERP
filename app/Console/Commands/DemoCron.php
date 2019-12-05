<?php

namespace App\Console\Commands;   

use Illuminate\Console\Command;

// use Illuminate\Support\Facades\Mail;

use Mail;

use App\Http\Requests;

class DemoCron extends Command

{
    protected $signature = 'demo:cron';

    protected $description = 'Command description';
    
    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        //Log::info("Cron is working fine!");
        //$this->info('Demo:Cron Cummand Run successfully!');

            // Mail::raw("Pragya", function ($mail) use () {
            //     $mail->from('noreply@naturabiotechnol.com');
            //     $mail->to('rohillapragya@gmail.com')
            //         ->subject('Word of the Day');
            // });
        $data = array('name'=>"Pragya Rohilla");

        Mail::send(['text'=>'emails.mail'], $data, function($message) {

                $message->to('rohillapragya@gmail.com', 'Pragya Rohilla')->subject('Laravel Basic Testing Mail');
                $message->cc('pragyad@appodeepo.com', 'Pragya Devi')->subject('Laravel Basic Testing Mail');
                $message->from('noreply@naturabiotechnol.com','Natura Biotechnol Pvt Ltd');
        });

         
        $this->info('Word of the Day sent to All Users');
    }

}