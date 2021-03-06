<?php
class company_dd
{
    static $table_name = 'company';
    static $readable_name = 'Company';

    static function load_dictionary()
    {
        $fields = array(
                    'company_id' => array('value'=>'',
                                          'nullable'=>FALSE,
                                          'data_type'=>'integer',
                                          'length'=>20,
                                          'required'=>FALSE,
                                          'attribute'=>'primary key',
                                          'control_type'=>'none',
                                          'size'=>'60',
                                          'drop_down_has_blank'=>TRUE,
                                          'label'=>'Company ID',
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
                    'company_name' => array('value'=>'',
                                          'nullable'=>FALSE,
                                          'data_type'=>'varchar',
                                          'length'=>255,
                                          'required'=>TRUE,
                                          'attribute'=>'',
                                          'control_type'=>'textbox',
                                          'size'=>'52',
                                          'drop_down_has_blank'=>TRUE,
                                          'label'=>'Company Name',
                                          'extra'=>'',
                                          'companion'=>'',
                                          'in_listview'=>TRUE,
                                          'char_set_method'=>'generate_alphanum_set',
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
                    'company_address' => array('value'=>'',
                                          'nullable'=>FALSE,
                                          'data_type'=>'varchar',
                                          'length'=>10000,
                                          'required'=>TRUE,
                                          'attribute'=>'',
                                          'control_type'=>'textarea',
                                          'size'=>'50',
                                          'drop_down_has_blank'=>TRUE,
                                          'label'=>'Company Address',
                                          'extra'=>'',
                                          'companion'=>'',
                                          'in_listview'=>TRUE,
                                          'char_set_method'=>'generate_alphanum_set',
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
                    'company_mobile_num1' => array('value'=>'',
                                          'nullable'=>FALSE,
                                          'data_type'=>'varchar',
                                          'length'=>11,
                                          'required'=>TRUE,
                                          'attribute'=>'none',
                                          'control_type'=>'textbox',
                                          'size'=>'16',
                                          'drop_down_has_blank'=>TRUE,
                                          'label'=>'Company Mobile Number',
                                          'extra'=>'',
                                          'companion'=>'',
                                          'in_listview'=>TRUE,
                                          'char_set_method'=>'generate_num_set',
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
                    'company_mobile_num2' => array('value'=>'',
                                          'nullable'=>TRUE,
                                          'data_type'=>'varchar',
                                          'length'=>11,
                                          'required'=>TRUE,
                                          'attribute'=>'none',
                                          'control_type'=>'textbox',
                                          'size'=>'16',
                                          'drop_down_has_blank'=>TRUE,
                                          'label'=>'Other Company Mobile Number',
                                          'extra'=>'',
                                          'companion'=>'',
                                          'in_listview'=>TRUE,
                                          'char_set_method'=>'generate_num_set',
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
                    'company_tel_num' => array('value'=>'',
                                          'nullable'=>TRUE,
                                          'data_type'=>'varchar',
                                          'length'=>11,
                                          'required'=>TRUE,
                                          'attribute'=>'none',
                                          'control_type'=>'textbox',
                                          'size'=>'16',
                                          'drop_down_has_blank'=>TRUE,
                                          'label'=>'Company Telephone Number',
                                          'extra'=>'',
                                          'companion'=>'',
                                          'in_listview'=>TRUE,
                                          'char_set_method'=>'generate_num_set',
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
                                          'rpt_show_sum'=>FALSE)
                       );
        return $fields;
    }

    static function load_relationships()
    {
        $relations = array(array('type'=>'1-M',
                                 'table'=>'trivia',
                                 'link_parent'=>'company_id',
                                 'link_child'=>'company',
                                 'where_clause'=>''),
                           array('type'=>'1-M',
                                 'table'=>'company_ad',
                                 'link_parent'=>'company_id',
                                 'link_child'=>'company_id',
                                 'where_clause'=>''),
                           array('type'=>'1-M',
                                 'table'=>'advertiser',
                                 'link_parent'=>'company_id',
                                 'link_child'=>'company_id',
                                 'where_clause'=>''));

        return $relations;
    }

    static function load_subclass_info()
    {
        $subclasses = array('html_file'=>'company_html.php',
                            'html_class'=>'company_html',
                            'data_file'=>'company.php',
                            'data_class'=>'company');
        return $subclasses;
    }

}