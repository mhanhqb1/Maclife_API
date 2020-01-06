<?php

namespace Bus;

/**
 * Login User
 *
 * @package Bus
 * @created 2017-10-28
 * @version 1.0
 * @author LongDH
 */
class Users_AddUpdate extends BusAbstract
{
    /** @var array $_required field require */
    protected $_required = array(
        'email',
        'password',
        'name'
    );

    /** @var array $_length Length of fields */
    protected $_length = array();

    /** @var array $_email_format field email */
    protected $_email_format = array(
        'email'
    );

    /**
     * Call function get_login() from model User
     *
     * @author AnhMH
     * @param array $data Input data
     * @return bool Success or otherwise
     */
    public function operateDB($data)
    {
        try {
            $this->_response = \Model_User::add_update($data);
            return $this->result(\Model_User::error());
        } catch (\Exception $e) {
            $this->_exception = $e;
        }
        return false;
    }
}
