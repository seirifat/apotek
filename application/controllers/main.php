<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Main extends MY_Controller
{


    public function __construct()
    {
        parent :: __construct();
    }

    public function index()
    {
        $this->data['mainview'] = 'home/home';
        $this->data['title'] = 'Homes';
        $this->load->view('main',$this->data);
    }


}