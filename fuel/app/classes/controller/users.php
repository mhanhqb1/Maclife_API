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
}
