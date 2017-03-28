<?php
class player_answered_question_dd
{
    static $table_name = 'player_answered_question';
    static $readable_name = 'Player Answered Question';

    static function load_dictionary()
    {
        $fields = array(
                    'player_answered_question_id' => array('value'=>'',
                                          'nullable'=>FALSE,
                                          'data_type'=>'integer',
                                          'length'=>20,
                                          'required'=>FALSE,
                                          'attribute'=>'primary key',
                                          'control_type'=>'none',
                                          'size'=>'60',
                                          'drop_down_has_blank'=>TRUE,
                                          'label'=>'Player Answered Question ID',
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
                    'question' => array('value'=>'',
                                          'nullable'=>FALSE,
                                          'data_type'=>'integer',
                                          'length'=>20,
                                          'required'=>TRUE,
                                          'attribute'=>'foreign key',
                                          'control_type'=>'drop-down list',
                                          'size'=>'60',
                                          'drop_down_has_blank'=>TRUE,
                                          'label'=>'Answered Question',
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
                                          'list_settings'=>array('query' => "SELECT question.question_id AS `Queried_question_id`, question.question FROM question ORDER BY `question`",
                                                                     'list_value' => 'Queried_question_id',
                                                                     'list_items' => array('question'),
                                                                     'list_separators' => array()),
                                          'rpt_in_report'=>TRUE,
                                          'rpt_column_format'=>'number_format2',
                                          'rpt_column_alignment'=>'right',
                                          'rpt_show_sum'=>TRUE),
                    'player_id' => array('value'=>'',
                                          'nullable'=>FALSE,
                                          'data_type'=>'integer',
                                          'length'=>20,
                                          'required'=>TRUE,
                                          'attribute'=>'foreign key',
                                          'control_type'=>'drop-down list',
                                          'size'=>'60',
                                          'drop_down_has_blank'=>TRUE,
                                          'label'=>'Player Name',
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
                                          'list_settings'=>array('query' => "SELECT player.player_id AS `Queried_player_id`, player.person_id, `person`.`first_name`, `last_name` FROM player LEFT JOIN person ON `person`.`person_id` = `player`.`person_id` ORDER BY `person_id`",
                                                                     'list_value' => 'Queried_player_id',
                                                                     'list_items' => array('first_name','last_name'),
                                                                     'list_separators' => array()),
                                          'rpt_in_report'=>TRUE,
                                          'rpt_column_format'=>'normal',
                                          'rpt_column_alignment'=>'center',
                                          'rpt_show_sum'=>TRUE)
                       );
        return $fields;
    }

    static function load_relationships()
    {
        $relations = array(array('type'=>'1-1',
                                 'table'=>'question',
                                 'alias'=>'question',
                                 'link_parent'=>'question_id',
                                 'link_child'=>'question',
                                 'link_subtext'=>array('question'),
                                 'where_clause'=>''),
                           array('type'=>'1-1',
                                 'table'=>'player',
                                 'alias'=>'',
                                 'link_parent'=>'player_id',
                                 'link_child'=>'player_id',
                                 'link_subtext'=>array('person_id'),
                                 'where_clause'=>''),
                           array('type'=>'M-1',
                             'table'=>'player',
                             'alias'=>'',
                             'link_parent'=>'player_id',
                             'link_child'=>'player_id',
                             'minimum'=>1,
                             'where_clause'=>''));

        return $relations;
    }

    static function load_subclass_info()
    {
        $subclasses = array('html_file'=>'player_answered_question_html.php',
                            'html_class'=>'player_answered_question_html',
                            'data_file'=>'player_answered_question.php',
                            'data_class'=>'player_answered_question');
        return $subclasses;
    }

}