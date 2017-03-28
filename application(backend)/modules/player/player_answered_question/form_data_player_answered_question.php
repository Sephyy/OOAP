<?php
require 'components/get_listview_referrer.php';

require 'subclasses/player_answered_question.php';
$dbh_player_answered_question = new player_answered_question;
$dbh_player_answered_question->set_where("player_answered_question_id='" . quote_smart($player_answered_question_id) . "'");
if($result = $dbh_player_answered_question->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);
	debug($data);

}

