<?php
class trivia_dd
{
    static $table_name = 'trivia';
    static $readable_name = 'Trivia';

    static function load_dictionary()
    {
        $fields = array(
                    'trivia_id' => array('value'=>'',
                                          'nullable'=>FALSE,
                                          'data_type'=>'integer',
                                          'length'=>20,
                                          'required'=>FALSE,
                                          'attribute'=>'primary key',
                                          'control_type'=>'none',
                                          'size'=>'60',
                                          'drop_down_has_blank'=>TRUE,
                                          'label'=>'Trivia ID',
                                          'extra'=>'',
                                          'companion'=>'',
                                          'in_listview'=>FALSE,
                                          'char_set_method'=>'generate_num_set',
                                          'char_set_allow_space'=>FALSE,
                                          'extra_chars_allowed'=>'-',
                                          'allow_html_tags'=>FALSE,
                                          'trim'=>'trim',
                                          'valid_set'=>array(),
                                          'date_elements'=>array('','',''),
                                          'date_default'=>'',
                                          'list_type'=>'',
                                          'list_settings'=>array(''),
                                          'rpt_in_report'=>TRUE,
                                          'rpt_column_format'=>'normal',
                                          'rpt_column_alignment'=>'center',
                                          'rpt_show_sum'=>TRUE),
                    'trivia' => array('value'=>'',
                                          'nullable'=>FALSE,
                                          'data_type'=>'varchar',
                                          'length'=>10000,
                                          'required'=>TRUE,
                                          'attribute'=>'none',
                                          'control_type'=>'textarea',
                                          'size'=>'60',
                                          'drop_down_has_blank'=>TRUE,
                                          'label'=>'Trivia',
                                          'extra'=>'',
                                          'companion'=>'',
                                          'in_listview'=>TRUE,
                                          'char_set_method'=>'',
                                          'char_set_allow_space'=>TRUE,
                                          'extra_chars_allowed'=>'',
                                          'allow_html_tags'=>FALSE,
                                          'trim'=>'trim',
                                          'valid_set'=>array(),
                                          'date_elements'=>array('','',''),
                                          'date_default'=>'',
                                          'list_type'=>'',
                                          'list_settings'=>array(''),
                                          'rpt_in_report'=>TRUE,
                                          'rpt_column_format'=>'normal',
                                          'rpt_column_alignment'=>'left',
                                          'rpt_show_sum'=>FALSE),
                    'company' => array('value'=>'',
                                          'nullable'=>FALSE,
                                          'data_type'=>'integer',
                                          'length'=>20,
                                          'required'=>TRUE,
                                          'attribute'=>'foreign key',
                                          'control_type'=>'drop-down list',
                                          'size'=>'60',
                                          'drop_down_has_blank'=>FALSE,
                                          'label'=>'Company',
                                          'extra'=>'',
                                          'companion'=>'',
                                          'in_listview'=>TRUE,
                                          'char_set_method'=>'generate_num_set',
                                          'char_set_allow_space'=>FALSE,
                                          'extra_chars_allowed'=>'-',
                                          'allow_html_tags'=>FALSE,
                                          'trim'=>'trim',
                                          'valid_set'=>array(),
                                          'date_elements'=>array('','',''),
                                          'date_default'=>'',
                                          'list_type'=>'sql generated',
                                          'list_settings'=>array('query' => "SELECT company.company_id AS `Queried_company_id`, company.company_name FROM company ORDER BY `company_name`",
                                                                     'list_value' => 'Queried_company_id',
                                                                     'list_items' => array('company_name'),
                                                                     'list_separators' => array()),
                                          'rpt_in_report'=>TRUE,
                                          'rpt_column_format'=>'number_format2',
                                          'rpt_column_alignment'=>'right',
                                          'rpt_show_sum'=>TRUE)
                       );
        return $fields;
    }

    static function load_relationships()
    {
        $relations = array(array('type'=>'1-1',
                                 'table'=>'company',
                                 'alias'=>'company',
                                 'link_parent'=>'company_id',
                                 'link_child'=>'company',
                                 'link_subtext'=>array('company_name'),
                                 'where_clause'=>''),
                           array('type'=>'M-1',
                             'table'=>'company',
                             'alias'=>'company',
                             'link_parent'=>'company_id',
                             'link_child'=>'company',
                             'minimum'=>1,
                             'where_clause'=>''));

        return $relations;
    }

    static function load_subclass_info()
    {
        $subclasses = array('html_file'=>'trivia_html.php',
                            'html_class'=>'trivia_html',
                            'data_file'=>'trivia.php',
                            'data_class'=>'trivia');
        return $subclasses;
    }

}