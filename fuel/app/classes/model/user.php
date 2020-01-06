<?php

use Fuel\Core\DB;
use Lib\Util;

/**
 * Any query in Model User.
 *
 * @package Model
 * @version 1.0
 * @author AnhMH
 * @copyright Oceanize INC
 */
class Model_User extends Model_Abstract {

    protected static $_properties = array(
        'id',
        'name',
        'email',
        'password',
        'is_donate',
        'created',
        'updated'
    );
    
    protected static $_observers = array(
        'Orm\Observer_CreatedAt' => array(
            'events' => array('before_insert'),
            'mysql_timestamp' => false,
        ),
        'Orm\Observer_UpdatedAt' => array(
            'events' => array('before_update'),
            'mysql_timestamp' => false,
        ),
    );
    
    protected static $_table_name = 'users';
    
    /**
     * Login for admin.
     *
     * @author AnhMH
     * @param array $param Input data.
     * @return array|bool Returns the array or the boolean.
     */
    public static function login($param) {
        $param['password'] = Util::encodePassword($param['password'], $param['email']);
        \LogLib::info('Create new token', __METHOD__, $param);
        $query = DB::select(
                self::$_table_name . '.*'
            )
            ->from(self::$_table_name)
            ->where(self::$_table_name . '.email', '=', $param['email'])
            ->where(self::$_table_name . '.password', '=', $param['password']);
        $data = $query->execute(self::$slave_db)->offsetGet(0);
        
        return $data;
    }
    
    /**
     * Update profile
     *
     * @author AnhMH
     * @param array $param Input data
     * @return array|bool Detail User or false if error
     */
    public static function update_profile($param)
    {
        $adminId = !empty($param['admin_id']) ? $param['admin_id'] : '';
        $admin = self::find($adminId);
        if (empty($admin)) {
            self::errorNotExist('admin_id', $adminId);
            return false;
        }
        
        // Upload image
        if (!empty($_FILES)) {
            $uploadResult = \Lib\Util::uploadImage(); 
            if ($uploadResult['status'] != 200) {
                self::setError($uploadResult['error']);
                return false;
            }
            $param['avatar'] = !empty($uploadResult['body']['avatar']) ? $uploadResult['body']['avatar'] : '';
        }
        
        // Set data
        if (!empty($param['email'])) {
            $admin->set('email', $param['email']);
        }
        if (!empty($param['address'])) {
            $admin->set('address', $param['address']);
        }
        if (!empty($param['tel'])) {
            $admin->set('tel', $param['tel']);
        }
        if (!empty($param['avatar'])) {
            $admin->set('avatar', $param['avatar']);
        }
        if (!empty($param['website'])) {
            $admin->set('website', $param['website']);
        }
        if (!empty($param['facebook'])) {
            $admin->set('facebook', $param['facebook']);
        }
        if (!empty($param['description'])) {
            $admin->set('description', $param['description']);
        }
        if (!empty($param['new_pass'])) {
            $admin->set('password', Util::encodePassword($param['new_pass'], $admin->get('email')));
        }
        
        // Save data
        if ($admin->save()) {
            $admin['token'] = Model_Authenticate::addupdate(array(
                'user_id' => $adminId,
                'regist_type' => 'admin'
            ));
            return $admin;
        }
        return false;
    }

    /**
     * Update profile
     *
     * @author LongDH
     * @param array $param Input data
     * @return array|bool Detail User or false if error
     */
    public static function add_update($param)
    {
        // Get company info
        $self = array();
        $isNew = false;
        $time = time();
        $id = !empty($param['id']) ? $param['id'] : 0;
        
        // Check email duplicate
        $check = self::find('first', array(
            'where' => array(
                'email' => $param['email']
            )
        ));
        if (!empty($check) && $check['id'] != $id) {
            self::errorDuplicate('email');
            return false;
        }
        
        if (!empty($id)) {
            $self = self::find($id);
            if (empty($self)) {
                self::errorNotExist('user_id');
                return false;
            }
        } else {
            $self = new self;
            $isNew = true;
        }

        // Set data
        if (isset($param['name'])) {
            $self->set('name', $param['name']);
        }
        if (!empty($param['email'])) {
            $self->set('email', $param['email']);
        }
        if (!empty($param['password'])) {
            $self->set('password', Util::encodePassword($param['password'],  $param['email']));
        }
        if (!empty($param['admin_type'])) {
            $self->set('admin_type', $param['admin_type']);
        }
        if ($isNew) {
            $self->set('is_donate', 0);
            $self->set('created', $time);
        }  elseif (isset($param['is_donate'])) {
            $self->set('is_donate', $param['is_donate']);
        }
        $self->set('updated', $time);
        // Save data
        if ($self->save()) {
            if (empty($self->id)) {
                $self->id = self::cached_object($self)->_original['id'];
            }
            if (!empty($param['get_login'])) {
                $self['token'] = Model_Authenticate::addupdate(array(
                    'user_id' => $self->id,
                    'regist_type' => 'user'
                ));
                return $self;
            }
            return $self->id;
        }
        return false;
    }
}
