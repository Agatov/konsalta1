$ ->
  params = {allowfullscreen: 'true', allowscriptaccess: 'always', wmode: 'opaque'}
  video_id = 'V7teS1yV2UA'
  videoContainer = $('#videoContainer')

  flashvars = {enablejsapi: '1', playerapiid: "video-#{video_id}"}
  videoContainer.append($('<div/>').addClass('video-wrapper').append($('<div/>').attr('id', "video-#{video_id}")))
  swfobject.embedSWF('http://www.youtube.com/v/' + video_id, "video-#{video_id}", '960', '540', '9.0.0', false, flashvars, params);

#  videoContainer.cycle({fx:'scrollDown'})

  onYouTubePlayerReady "video-#{video_id}"


onYouTubePlayerReady = (id) ->
  player = $('#' + id)[0]
  if player.addEventListener
    console.log '1-1-1'
    player.addEventListener('onStateChange', 'handlePlayerStateChange')
  else
    console.log '2-2-2'
    player.attachEvent('onStateChange', 'handlePlayerStateChange')

handlePlayerStateChange = (state) ->
  console.log 'asd'