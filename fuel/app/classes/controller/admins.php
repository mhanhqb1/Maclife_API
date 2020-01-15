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
class Controller_Admins extends \Controller_App {

    /**
     * Login for admin
     */
    public function action_login() {
        return \Bus\Admins_Login::getInstance()->execute();
    }

    /**
     * Login for admin
     */
    public function action_add() {
        return \Bus\Admins_Add::getInstance()->execute();
    }

    /**
     * Admin update profile
     */
    public function action_updateprofile() {
        return \Bus\Admins_UpdateProfile::getInstance()->execute();
    }
    
    /**
     * Get list
     */
    public function action_list() {
        return \Bus\Admins_List::getInstance()->execute();
    }
    
    /**
     * Get list
     */
    public function action_addupdate() {
        return \Bus\Admins_AddUpdate::getInstance()->execute();
    }
    
    /**
     * Get list
     */
    public function action_detail() {
        return \Bus\Admins_Detail::getInstance()->execute();
    }
    
    /**
     * Disable
     */
    public function action_disable() {
        return \Bus\Admins_Disable::getInstance()->execute();
    }
    
    /**
     * Disable
     */
    public function action_all() {
        return \Bus\Admins_All::getInstance()->execute();
    }
}
