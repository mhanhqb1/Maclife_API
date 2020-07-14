<?php

use Fuel\Core\DB;
use Lib\Util;

/**
 * Any query in Model Admin.
 *
 * @package Model
 * @version 1.0
 * @author AnhMH
 * @copyright Oceanize INC
 */
class Model_Admin extends Model_Abstract {

    protected static $_properties = array(
        'id',
        'name',
        'email',
        'password',
        'admin_type',
        'disable',
        'created',
        'updated',
        'avatar'
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
    
    protected static $_table_name = 'admins';
    
    /**
     * Login for admin.
     *
     * @author AnhMH
     * @param array $param Input data.
     * @return array|bool Returns the array or the boolean.
     */
    public static function login($param) {
        $param['password'] = Util::encodePassword($param['password'], $param['email']);
//        \LogLib::info('Create new token', __METHOD__, $param);
        $query = DB::select(
                self::$_table_name . '.*'
            )
            ->from(self::$_table_name)
            ->where(self::$_table_name . '.disable', 0)
            ->where(self::$_table_name . '.email', '=', $param['email'])
            ->where(self::$_table_name . '.password', '=', $param['password']);
        $data = $query->execute(self::$slave_db)->offsetGet(0);
        
        if (!empty($data)) {
            $data['company'] = Model_Company::find('first');
        }
        
        return $data;
    }
    
    /**
     * Update profile
     *
     * @author AnhMH
     * @param array $param Input data
     * @return array|bool Detail Admin or false if error
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
     * @return array|bool Detail Admin or false if error
     */
    public static function add($param)
    {
        // Get company info
        $self = new self;

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
        if (!empty($param['is_donate'])) {
            $self->set('is_donate', $param['is_donate']);
        }
        // Save data
        if ($self->save()) {
            if (empty($self->id)) {
                $self->id = self::cached_object($self)->_original['id'];
            }
            return $self->id;
        }
        return false;
    }
    
    /**
     * Add update info
     *
     * @author AnhMH
     * @param array $param Input data
     * @return int|bool User ID or false if error
     */
    public static function add_update($param)
    {
        // Init
        $self = array();
        $isNew = false;
        $time = time();
        $id = !empty($param['id']) ? $param['id'] : 0;
        
        $check = self::find('first', array(
            'where' => array(
                'email' => $param['email']
            )
        ));
        if (!empty($check) && $check['id'] != $id) {
            self::errorDuplicate('admin_email');
            return false;
        }
        
        // Check if exist User
        if (!empty($param['id'])) {
            $self = self::find($param['id']);
            if (empty($self)) {
                self::errorNotExist('admin_id');
                return false;
            }
        } else {
            $self = new self;
            $isNew = true;
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
        if (!empty($param['name'])) {
            $self->set('name', $param['name']);
        }
        if (!empty($param['email'])) {
            $self->set('email', $param['email']);
        }
        if (!empty($param['password'])) {
            $self->set('password', Util::encodePassword($param['password'],  $param['email']));
        }
        if (!empty($param['avatar'])) {
            $self->set('avatar', $param['avatar']);
        }
        $self->set('updated', $time);
        $self->set('admin_type', 1);
        if ($isNew) {
            $self->set('created', $time);
        }
        
        // Save data
        if ($self->save()) {
            if (empty($self->id)) {
                $self->id = self::cached_object($self)->_original['id'];
            }
            return $self->id;
        }
        
        return false;
    }
    
    /**
     * Get list
     *
     * @author AnhMH
     * @param array $param Input data
     * @return array|bool
     */
    public static function get_list($param)
    {
        // Init
        $adminId = !empty($param['admin_id']) ? $param['admin_id'] : '';
        $tags = array();
        
        // Query
        $query = DB::select(
                self::$_table_name.'.*'
            )
            ->from(self::$_table_name)
        ;
                        
        // Filter
        if (!empty($param['name'])) {
            $query->where(self::$_table_name.'.name', 'LIKE', "%{$param['name']}%");
        }
        
        // Pagination
        if (!empty($param['page']) && $param['limit']) {
            $offset = ($param['page'] - 1) * $param['limit'];
            $query->limit($param['limit'])->offset($offset);
        }
        
        // Sort
        if (!empty($param['sort'])) {
            if (!self::checkSort($param['sort'])) {
                self::errorParamInvalid('sort');
                return false;
            }

            $sortExplode = explode('-', $param['sort']);
            if ($sortExplode[0] == 'created') {
                $sortExplode[0] = self::$_table_name . '.created';
            }
            $query->order_by($sortExplode[0], $sortExplode[1]);
        } else {
            $query->order_by(self::$_table_name . '.created', 'DESC');
        }
        
        // Get data
        $data = $query->execute()->as_array();
        $total = !empty($data) ? DB::count_last_query(self::$slave_db) : 0;
        
        return array(
            'total' => $total,
            'data' => $data
        );
    }
    
    /**
     * Get detail
     *
     * @author AnhMH
     * @param array $param Input data
     * @return array|bool
     */
    public static function get_detail($param)
    {
        $id = !empty($param['id']) ? $param['id'] : '';
        
        $data = self::find($id);
        if (empty($data)) {
            self::errorNotExist('cate_id');
            return false;
        }
        unset($data['password']);
        return $data;
    }
    
    /**
     * Delete
     *
     * @author AnhMH
     * @param array $param Input data
     * @return Int|bool
     */
    public static function del($param)
    {
        $delete = self::deleteRow(self::$_table_name, array(
            'id' => $param['id']
        ));
        if ($delete) {
            return $param['id'];
        } else {
            return 0;
        }
    }
    
    /**
     * Enable/Disable
     *
     * @author AnhMH
     * @param array $param Input data
     * @return int|bool User ID or false if error
     */
    public static function disable($param)
    {
        $ids = !empty($param['id']) ? $param['id'] : '';
        $disable = !empty($param['disable']) ? $param['disable'] : 0;
        if (!is_array($ids)) {
            $ids = explode(',', $ids);
        }
        foreach ($ids as $id) {
            $self = self::del(array('id' => $id));
        }
        return true;
    }
}
