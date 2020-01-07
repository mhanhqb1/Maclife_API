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
class Model_Post extends Model_Abstract {
    
    /** @var array $_properties field of table */
    protected static $_properties = array(
        'id',
        'cate_id',
        'name',
        'slug',
        'image',
        'description',
        'detail',
        'seo_keyword',
        'seo_description',
        'total_like',
        'total_dislike',
        'total_view',
        'created',
        'updated',
        'disable',
        'is_premium',
        'premium_content'
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
    protected static $_table_name = 'posts';

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
        
        // Check if exist User
        if (!empty($param['id'])) {
            $self = self::find($param['id']);
            if (empty($self)) {
                self::errorNotExist('post_id');
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
            $param['image'] = !empty($uploadResult['body']['image']) ? $uploadResult['body']['image'] : '';
        }
        
        // Set data
        if (!empty($param['name'])) {
            $self->set('name', $param['name']);
            $self->set('slug', \Lib\Str::convertURL($param['name']));
        }
        if (!empty($param['cate_id'])) {
            $self->set('cate_id', $param['cate_id']);
        }
        if (!empty($param['description'])) {
            $self->set('description', $param['description']);
        }
        if (!empty($param['detail'])) {
            $self->set('detail', $param['detail']);
        }
        if (!empty($param['image'])) {
            $self->set('image', $param['image']);
        }
        if (!empty($param['seo_keyword'])) {
            $self->set('seo_keyword', $param['seo_keyword']);
        }
        if (!empty($param['seo_description'])) {
            $self->set('seo_description', $param['seo_description']);
        }
        if (isset($param['is_premium'])) {
            $self->set('is_premium', $param['is_premium']);
        }
        if (isset($param['premium_content'])) {
            $self->set('premium_content', $param['premium_content']);
        }
        $self->set('updated', $time);
        if ($isNew) {
            $self->set('created', $time);
        }
        
        // Save data
        if ($self->save()) {
            if (empty($self->id)) {
                $self->id = self::cached_object($self)->_original['id'];
            }
            if (!empty($param['tag'])) {
                $tags = explode(',', $param['tag']);
                foreach ($tags as $t) {
                    Model_Post_Tag::add_update(array(
                        'name' => trim($t),
                        'post_id' => $self->id
                    ));
                }
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
                self::$_table_name.'.*',
                array('cates.name', 'cate_name'),
                array('cates.slug', 'cate_slug')
            )
            ->from(self::$_table_name)
            ->join('cates', 'left')
            ->on('cates.id', '=', self::$_table_name.'.cate_id')
        ;
                        
        // Filter
        if (!empty($param['name'])) {
            $query->where(self::$_table_name.'.name', 'LIKE', "%{$param['name']}%");
        }
        if (!empty($param['s'])) {
            $query->where(self::$_table_name.'.name', 'LIKE', "%{$param['s']}%");
        }
        if (!empty($param['cate_id'])) {
            if (!is_array($param['cate_id'])) {
                $param['cate_id'] = explode(',', $param['cate_id']);
            }
            $query->where(self::$_table_name.'.cate_id', 'IN', $param['cate_id']);
        }
        if (!empty($param['tag_slug'])) {
            $query->select(array(
                'tags.name', 'tag_name'
            ));
            $query->join('post_tags')
                ->on('post_tags.post_id', '=', self::$_table_name.'.id')
                ->join('tags')
                ->on('tags.id', '=', 'post_tags.tag_id')
                ->where('tags.slug', $param['tag_slug']);
        }
        if (isset($param['is_premium'])) {
            $query->where('is_premium', $param['is_premium']);
        } elseif (empty($param['from_admin'])) {
            $query->where('is_premium', '!=', 1);
        }
        
        if (isset($param['disable']) && $param['disable'] != '') {
            $disable = !empty($param['disable']) ? 1 : 0;
            $query->where(self::$_table_name.'.disable', $disable);
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
        $newPosts = array();
        
        if (!empty($param['get_new_posts'])) {
            $newPosts = self::get_all(array(
                'limit' => 4,
                'page' => 1
            ));
        }
        
        if (!empty($param['get_tags'])) {
            $tags = Model_Tag::get_all(array(
                'limit' => 10,
                'page' => 1,
                'sort' => 'total_post-desc'
            ));
        }
        
        return array(
            'total' => $total,
            'data' => $data,
            'new_posts' => $newPosts,
            'tags' => $tags
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
        $slug = !empty($param['slug']) ? $param['slug'] : '';
        
        $query = DB::select(
                self::$_table_name.'.*',
                array('cates.name', 'cate_name'),
                array('cates.slug', 'cate_slug')
            )
            ->from(self::$_table_name)
            ->join('cates', 'LEFT')
            ->on('cates.id', '=', self::$_table_name.'.cate_id')
        ;
        if (!empty($slug)) {
            $query->where(self::$_table_name.'.slug', $slug);
        } else {
            $query->where(self::$_table_name.'.id', $id);
        }
        $data = $query->execute()->offsetGet(0);
        if (empty($data)) {
            self::errorNotExist('post_id');
            return false;
        }
        $tags = DB::select(
                'tags.name',
                'tags.slug'
            )
            ->from('post_tags')
            ->join('tags', 'LEFT')
            ->on('tags.id', '=', 'post_tags.tag_id')
            ->where('post_id', $data['id'])
            ->execute()
            ->as_array();
        $postTags = array();
        if (!empty($tags)) {
            foreach ($tags as $t) {
                $postTags[] = $t['name'];
            }
        }
        $data['front_tags'] = $tags;
        $data['tag'] = implode(', ', $postTags);
        if (!empty($param['get_related_posts'])) {
            $data['related_posts'] = self::get_all(array(
                'limit' => 4,
                'page' => 1,
                'cate_id' => $data['cate_id'],
                'diff_id' => $data['id']
            ));
        }
        
        if (!empty($param['get_top_like_posts'])) {
            $data['top_like_posts'] = self::get_all(array(
                'limit' => 5,
                'page' => 1,
                'sort' => 'total_like-desc'
            ));
        }
        
        if (!empty($param['get_tags'])) {
            $data['top_tags'] = Model_Tag::get_all(array(
                'limit' => 10,
                'page' => 1,
                'sort' => 'total_post-desc'
            ));
        }
        
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
    
    /**
     * Get all
     *
     * @author AnhMH
     * @param array $param Input data
     * @return array|bool
     */
    public static function get_all($param)
    {
        // Init
        $adminId = !empty($param['admin_id']) ? $param['admin_id'] : '';
        
        if (!empty($param['cate_slug'])) {
            $cate = Model_Cate::find('first', array(
                'where' => array(
                    'slug' => $param['cate_slug']
                )
            ));
            if (!empty($cate['id'])) {
                $param['cate_id'] = $cate['id'];
            }
        }
        
        // Query
        $query = DB::select(
                self::$_table_name.'.*',
                array('cates.name', 'cate_name'),
                array('cates.slug', 'cate_slug')
            )
            ->from(self::$_table_name)
            ->join('cates', 'LEFT')
            ->on('cates.id', '=', self::$_table_name.'.cate_id')
            ->where(self::$_table_name.'.disable', 0)
            ->where(self::$_table_name.'.is_premium', 0)
        ;
                        
        // Filter
        if (!empty($param['name'])) {
            $query->where(self::$_table_name.'.name', 'LIKE', "%{$param['name']}%");
        }
        if (!empty($param['created'])) {
            $query->where(self::$_table_name.'.created', '>=', $param['created']);
        }
        if (!empty($param['cate_id'])) {
            if (!is_array($param['cate_id'])) {
                $param['cate_id'] = explode(',', $param['cate_id']);
            }
            $query->where(self::$_table_name.'.cate_id', 'IN', $param['cate_id']);
        }
        if (!empty($param['diff_id'])) {
            $query->where(self::$_table_name.'.id', '!=', $param['diff_id']);
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
        
        return $data;
    }
    
    /**
     * Get home data
     *
     * @author AnhMH
     * @param array $param Input data
     * @return array|bool
     */
    public static function get_home_data($param)
    {
        // Init
        $result = array();
        
        // Get home slider
        $result['sliders'] = self::get_all(array(
            'page' => 1,
            'limit' => 4,
            'is_home_slide' => 1
        ));
        
        // Get home slider
        $result['medias'] = self::get_all(array(
            'page' => 1,
            'limit' => 4,
            'type' => 2
        ));
        
        // Get posts data
        $result['posts'] = DB::select(
                self::$_table_name.'.*',
                array('cates.name', 'cate_name'),
                array('cates.slug', 'cate_slug')
            )
            ->from(DB::expr("
                (
                    SELECT
			posts.*,
			@rn :=
                            IF (@prev = cate_id, @rn + 1, 1) AS rn,
                        @prev := cate_id
                    FROM
                        posts
                    JOIN (SELECT @prev := NULL, @rn := 0) AS vars
                    WHERE
                        disable = 0
                    ORDER BY
                        cate_id
                ) AS posts
            "))
            ->join('cates', 'LEFT')
            ->on('cates.id', '=', self::$_table_name.'.cate_id')
            ->where(DB::expr("rn <= 6"))
            ->execute()
            ->as_array()
        ;
        
        // Return data
        return $result;
    }
    
    /**
     * Add view
     *
     * @author AnhMH
     * @param array $param Input data
     * @return array|bool
     */
    public static function add_view($param)
    {
        $id = !empty($param['id']) ? $param['id'] : '';
        if (!empty($id)) {
            $post = self::find($id);
            if (!empty($post)) {
                $view = $post['total_view'] + 1;
                $post->set('total_view', $view);
                $post->save();
            }
        }
        return true;
    }
    
    /**
     * Add like
     *
     * @author AnhMH
     * @param array $param Input data
     * @return array|bool
     */
    public static function add_like($param)
    {
        $id = !empty($param['id']) ? $param['id'] : '';
        if (!empty($id)) {
            $post = self::find($id);
            if (!empty($post)) {
                $view = $post['total_like'] + 1;
                $post->set('total_like', $view);
                $post->save();
                return $post;
            }
        }
        return true;
    }
    
    /**
     * Add dislike
     *
     * @author AnhMH
     * @param array $param Input data
     * @return array|bool
     */
    public static function add_dislike($param)
    {
        $id = !empty($param['id']) ? $param['id'] : '';
        if (!empty($id)) {
            $post = self::find($id);
            if (!empty($post)) {
                $view = $post['total_dislike'] + 1;
                $post->set('total_dislike', $view);
                $post->save();
                return $post;
            }
        }
        return array();
    }
}
