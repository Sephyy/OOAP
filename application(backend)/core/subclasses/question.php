<?php
require_once 'question_dd.php';
class question extends data_abstraction
{
    var $fields = array();


    function __construct()
    {
        $this->fields     = question_dd::load_dictionary();
        $this->relations  = question_dd::load_relationships();
        $this->subclasses = question_dd::load_subclass_info();
        $this->table_name = question_dd::$table_name;
        $this->tables     = question_dd::$table_name;
    }

    function add($param)
    {
        $this->set_parameters($param);

        if($this->stmt_template=='')
        {
            $this->set_query_type('INSERT');
            $this->set_fields('question_id, question, answer, points, time_limit, company_ad');
            $this->set_values("?,?,?,?,?,?");

            $bind_params = array('issiii',
                                 &$this->fields['question_id']['value'],
                                 &$this->fields['question']['value'],
                                 &$this->fields['answer']['value'],
                                 &$this->fields['points']['value'],
                                 &$this->fields['time_limit']['value'],
                                 &$this->fields['company_ad']['value']);

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
            $this->set_update("question = ?, answer = ?, points = ?, time_limit = ?, company_ad = ?");
            $this->set_where("question_id = ?");

            $bind_params = array('ssiiii',
                                 &$this->fields['question']['value'],
                                 &$this->fields['answer']['value'],
                                 &$this->fields['points']['value'],
                                 &$this->fields['time_limit']['value'],
                                 &$this->fields['company_ad']['value'],
                                 &$this->fields['question_id']['value']);

            $this->stmt_prepare($bind_params);
        }
        $this->stmt_execute();

        return $this;
    }

    function delete($param)
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

    function delete_many($param)
    {
        $this->set_parameters($param);
        $this->set_query_type('DELETE');
        $this->set_where("");

        $bind_params = array('',
                             );

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
        $this->set_where("question_id = ?");

        $bind_params = array('i',
                             &$this->fields['question_id']['value']);

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
        $this->set_where("question_id = ? AND (question_id != ?)");

        $bind_params = array('ii',
                             &$this->fields['question_id']['value'],
                             &$this->fields['question_id']['value']);

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        if($this->num_rows > 0) $this->is_unique = FALSE;
        else $this->is_unique = TRUE;

        return $this;
    }
}
