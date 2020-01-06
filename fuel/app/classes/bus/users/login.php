<?php

namespace Bus;

/**
 * Login for admin
 *
 * @package Bus
 * @created 2018-03-02
 * @version 1.0
 * @author AnhMH
 * @copyright Oceanize INC
 */
class Users_Login extends BusAbstract {

    // check require
    protected $_required = array(
        'email',
        'password'
    );
    
    // check length
    protected $_length = array(
        'email' => array(0, 40),
        'password' => array(0, 40)
    );
    
    /**
     * Login action
     */
    public function operateDB($data) {
        try {
            $result = \Model_User::login($data);
            if (!empty($result)) {
                $result['token'] = \Model_Authenticate::addupdate(array(
                        'user_id' => $result['id'],
                        'regist_type' => 'user'
                ));
                $this->_response = $result;
            } else {
                \Model_User::errorNotExist('user_infomation', 'information_of_user');
                $this->_response = false;
            }
            return $this->result(\Model_User::error());
        } catch (\Exception $e) {
            $this->_exception = $e;
        }
        return false;
    }

}
