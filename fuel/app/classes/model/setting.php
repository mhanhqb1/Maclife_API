<?php

use Fuel\Core\DB;

/**
 * Any query in Model Version
 *
 * @package Model
 * @created 2017-10-29
 * @version 1.0
 * @author AnhMH
 */
class Model_Setting extends Model_Abstract {
    
    /** @var array $_properties field of table */
    protected static $_properties = array(
        'id',
        'cate_id',
        'name',
        'description',
        'content',
        'image',
        'is_default',
        'is_home_slide',
        'is_hot',
        'type',
        'created',
        'updated',
        'disable'
    );

    protected static $_observers = array(
        'Orm\Observer_CreatedAt' => array(
            'events'          => array('before_insert'),
            'mysql_timestamp' => false,
        ),
        'Orm\Observer_UpdatedAt' => array(
            'events'          => array('before_update'),
            'mysql_timestamp' => false,
        ),
    );

    /** @var array $_table_name name of table */
    protected static $_table_name = 'settings';

    /**
     * Get general
     *
     * @author AnhMH
     * @param array $param Input data
     * @return int|bool User ID or false if error
     */
    public static function get_general($param)
    {
        // Init
        $result = array();
        
        // Get company info
        $result['company'] = Model_Company::find('first');
        
        // Get cates
        $result['cates'] = Model_Cate::get_all(array());
        
        // Get top like
        $result['top_like_posts'] = Model_Post::get_all(array(
            'limit' => 4,
            'sort' => 'total_like-desc'
        ));
                
        // Return
        return $result;
    }
    
    /**
     * Get homedata
     *
     * @author AnhMH
     * @param array $param Input data
     * @return int|bool User ID or false if error
     */
    public static function get_homedata($param)
    {
        // Init
        $result = array();
        $result['home_posts'] = Model_Post::get_list($param);
        $result['home_tags'] = Model_Tag::get_all(array(
            'limit' => 10,
            'sort' => 'total_post-desc'
        ));
                
        // Return
        return $result;
    }
    
    /**
     * Get general
     *
     * @author AnhMH
     * @param array $param Input data
     * @return int|bool User ID or false if error
     */
    public static function get_admin_general($param)
    {
        // Init
        $result = array();
        
        $posts = DB::select('*')->from('posts')->where('disable', 0)->execute();
        $result['post_count'] = count($posts);
        
        $products = DB::select('*')->from('cates')->where('disable', 0)->execute();
        $result['cate_count'] = count($products);
        
//        $orders = DB::select('*')->from('tags')->where('disable', 0)->execute();
//        $result['tag_count'] = count($orders);
        
        // Return
        return $result;
    }
}
