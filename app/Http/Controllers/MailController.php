<?php


namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Mail;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class MailController extends Controller 
{
    // public function basic_email() 
    // {
    //     $data = array('name'=>"Pragya Rohilla");
   
    //     Mail::send(['text'=>'emails.mail'], $data, function($message) {

    //             $message->to('rohillapragya@gmail.com', 'Pragya Rohilla')->subject('Laravel Basic Testing Mail');
    //             $message->cc('pragyad@appodeepo.com', 'Pragya Devi')->subject('Laravel Basic Testing Mail');
    //             $message->from('noreply@naturabiotechnol.com','Natura Biotechnol Pvt Ltd');
    //     });
    //     echo "Basic Email Sent. Check your inbox.";
    // }

    public function html_email() 
    {
        $data = array('name'=>"Pragya Rohilla");
        Mail::send('emails.mail', $data, function($message) {

                $message->to('rohillapragya@gmail.com', 'Pragya Rohilla')->subject('Laravel Basic Testing Mail');
                $message->cc('pragyad@appodeepo.com', 'Pragya Devi')->subject('Laravel Basic Testing Mail');
                $message->replyTo('pragyad@appodeepo.com', 'Pragya Devi');
                $message->from('noreply@naturabiotechnol.com','Natura Biotechnol Pvt Ltd');
        });
        echo "HTML Email Sent. Check your inbox.";
    }

    // public function attachment_email() 
    // {
    //     $data = array('name'=>"Pragya Rohilla");
    //     Mail::send('emails.mail', $data, function($message) {
    //             $message->to('rohillapragya@gmail.com', 'Tutorials Point')->subject('Laravel Testing Mail with Attachment');
    //             // $message->attach('C:\laravel-master\laravel\public\uploads\image.png');
    //             // $message->attach('C:\laravel-master\laravel\public\uploads\test.txt');
    //             $message->from('noreply@naturabiotechnol.com','Natura Biotechnol Pvt Ltd');
    //     });
    //     echo "Email Sent with attachment. Check your inbox.";
    // }
}