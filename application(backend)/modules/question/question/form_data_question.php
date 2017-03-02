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

