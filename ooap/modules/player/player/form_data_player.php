<?php
require 'components/get_listview_referrer.php';

require 'subclasses/player.php';
$dbh_player = new player;
$dbh_player->set_where("player_id='" . quote_smart($player_id) . "'");
if($result = $dbh_player->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

}

require_once 'subclasses/player_answered_question.php';
$dbh_player_answered_question = new player_answered_question;
$dbh_player_answered_question->set_fields('question');
$dbh_player_answered_question->set_where("player_id='" . quote_smart($player_id) . "'");
if($result = $dbh_player_answered_question->make_query()->result)
{
    $num_player_answered_question = $dbh_player_answered_question->num_rows;
    for($a=0; $a<$num_player_answered_question; $a++)
    {
        $data = $result->fetch_row();
        $cf_player_answered_question_question[$a] = $data[0];
    }
}

