<?php
require_once 'question_choices_dd.php';
class question_choices extends data_abstraction
{
    var $fields = array();


    function __construct()
    {
        $this->fields     = question_choices_dd::load_dictionary();
        $this->relations  = question_choices_dd::load_relationships();
        $this->subclasses = question_choices_dd::load_subclass_info();
        $this->table_name = question_choices_dd::$table_name;
        $this->tables     = question_choices_dd::$table_name;
    }

    function add($param)
    {
        $this->set_parameters($param);

        if($this->stmt_template=='')
        {
            $this->set_query_type('INSERT');
            $this->set_fields('question_choices_id, question_id, choice_number, choice, is_correct');
            $this->set_values("?,?,?,?,?");

            $bind_params = array('iiiss',
                                 &$this->fields['question_choices_id']['value'],
                                 &$this->fields['question_id']['value'],
                                 &$this->fields['choice_number']['value'],
                                 &$this->fields['choice']['value'],
                                 &$this->fields['is_correct']['value']);

            $this->stmt_prepare($bind_params);
        }

        $this->stmt_execute();
        return $this;
    }

    function edit($param)
    {
        $this->set_parameters($param);

        if($this->stmt_template=='')
        {
            $this->set_query_type('UPDATE');
            $this->set_update("question_id = ?, choice_number = ?, choice = ?, is_correct = ?");
            $this->set_where("question_choices_id = ?");

            $bind_params = array('iissi',
                                 &$this->fields['question_id']['value'],
                                 &$this->fields['choice_number']['value'],
                                 &$this->fields['choice']['value'],
                                 &$this->fields['is_correct']['value'],
                                 &$this->fields['question_choices_id']['value']);

            $this->stmt_prepare($bind_params);
        }
        $this->stmt_execute();

        return $this;
    }

    function delete($param)
    {
        $this->set_parameters($param);
        $this->set_query_type('DELETE');
        $this->set_where("question_choices_id = ?");

        $bind_params = array('i',
                             &$this->fields['question_choices_id']['value']);

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        return $this;
    }

    function delete_many($param)
    {
        $this->set_parameters($param);
        $this->set_query_type('DELETE');
        $this->set_where("question_id = ?");

        $bind_params = array('i',
                             &$this->fields['question_id']['value']);

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        return $this;
    }

    function select()
    {
        $this->set_query_type('SELECT');
        $this->exec_fetch('array');
        return $this;
    }

    function check_uniqueness($param)
    {
        $this->set_parameters($param);
        $this->set_query_type('SELECT');
        $this->set_where("question_choices_id = ?");

        $bind_params = array('i',
                             &$this->fields['question_choices_id']['value']);

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        if($this->num_rows > 0) $this->is_unique = FALSE;
        else $this->is_unique = TRUE;

        return $this;
    }

    function check_uniqueness_for_editing($param)
    {
        $this->set_parameters($param);


        $this->set_query_type('SELECT');
        $this->set_where("question_choices_id = ? AND (question_choices_id != ?)");

        $bind_params = array('ii',
                             &$this->fields['question_choices_id']['value'],
                             &$this->fields['question_choices_id']['value']);

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        if($this->num_rows > 0) $this->is_unique = FALSE;
        else $this->is_unique = TRUE;

        return $this;
    }
}
