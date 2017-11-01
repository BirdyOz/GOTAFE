/*
* @Author: Greg Bird (@BirdyOz, greg.bird.oz@gmail.com)
* @Date:   2017-10-30 09:21:38
* @Last Modified by:   BirdyOz
* @Last Modified time: 2017-11-01 13:30:27
*/

$(function() {
    // Append stylesheet to head
    $('head').append('<link rel="stylesheet" type="text/css" href="https://rawgit.com/BirdyOz/GOTAFE/master/move-readspeaker/move-readspeaker.css">');

    // Detach the ReadSpeaker player from the Course Dashboard
    var RS_player = $('.block_readspeaker_embhl').detach();
    // Re-attach the ReadSpeaker player, above the main content
    $('#region-main').before(RS_player);
});