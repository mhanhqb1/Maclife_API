<?php

/**
 * Controller for actions on admin
 *
 * @package Controller
 * @created 2018-03-02
 * @version 1.0
 * @author AnhMH
 * @copyright Oceanize INC
 */
class Controller_Users extends \Controller_App {

    /**
     * Login for admin
     */
    public function action_login() {
        return \Bus\Users_Login::getInstance()->execute();
    }

    /**
     * Login for admin
     */
    public function action_addupdate() {
        return \Bus\Users_AddUpdate::getInstance()->execute();
    }
    
    /**
     * Get list
     */
    public function action_list() {
        return \Bus\Users_List::getInstance()->execute();
    }
    
    /**
     * Disable
     */
    public function action_disable() {
        return \Bus\Users_Disable::getInstance()->execute();
    }
    
    /**
     * Get list
     */
    public function action_detail() {
        return \Bus\Users_Detail::getInstance()->execute();
    }
}
