<?php
require 'components/get_listview_referrer.php';

require 'subclasses/question_answer.php';
$dbh_question_answer = new question_answer;
$dbh_question_answer->set_where("question_answer_id='" . quote_smart($question_answer_id) . "'");
if($result = $dbh_question_answer->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

}

