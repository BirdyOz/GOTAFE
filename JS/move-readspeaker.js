/*
* @Author: Greg Bird (@BirdyOz, greg.bird.oz@gmail.com)
* @Date:   2017-10-30 09:21:38
* @Last Modified by:   BirdyOz
* @Last Modified time: 2017-11-01 09:38:32
*/

$(function() {
    var RS_player = $('.block_readspeaker_embhl').detach();
    console.log("@GB: RS_player = ", RS_player);
    $('#region-main').prepend(RS_player);
});