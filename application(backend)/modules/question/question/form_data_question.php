<?php
require 'components/get_listview_referrer.php';

require 'subclasses/question.php';
$dbh_question = new question;
$dbh_question->set_where("question_id='" . quote_smart($question_id) . "'");
if($result = $dbh_question->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

}

require_once 'subclasses/question_choices.php';
$dbh_question_choices = new question_choices;
$dbh_question_choices->set_fields('choice_number, choice, is_correct');
$dbh_question_choices->set_where("question_id='" . quote_smart($question_id) . "'");
if($result = $dbh_question_choices->make_query()->result)
{
    $num_question_choices = $dbh_question_choices->num_rows;
    for($a=0; $a<$num_question_choices; $a++)
    {
        $data = $result->fetch_row();
        $cf_question_choices_choice_number[$a] = $data[0];
        $cf_question_choices_choice[$a] = $data[1];
        $cf_question_choices_is_correct[$a] = $data[2];
    }
}

