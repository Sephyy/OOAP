<?php
require 'components/get_listview_referrer.php';

require 'subclasses/question_choices.php';
$dbh_question_choices = new question_choices;
$dbh_question_choices->set_where("question_choices_id='" . quote_smart($question_choices_id) . "'");
if($result = $dbh_question_choices->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

}

