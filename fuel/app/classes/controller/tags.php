<?php

/**
 * Controller for actions on articles
 *
 * @package Controller
 * @created 2018-03-02
 * @version 1.0
 * @author AnhMH
 * @copyright Oceanize INC
 */
class Controller_Tags extends \Controller_App {

    /**
     * Get list
     */
    public function action_list() {
        return \Bus\Tags_List::getInstance()->execute();
    }
    
    /**
     * Get list
     */
    public function action_addupdate() {
        return \Bus\Tags_AddUpdate::getInstance()->execute();
    }
    
    /**
     * Get list
     */
    public function action_detail() {
        return \Bus\Tags_Detail::getInstance()->execute();
    }
    
    /**
     * Get all
     */
    public function action_all() {
        return \Bus\Tags_All::getInstance()->execute();
    }
    
    /**
     * Disable
     */
    public function action_disable() {
        return \Bus\Tags_Disable::getInstance()->execute();
    }
}
