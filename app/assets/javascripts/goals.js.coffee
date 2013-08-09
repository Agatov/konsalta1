$ ->

  scrollToMiddle = false
  scrollToBottom = false

  $('#get-call').bind 'click', ->
    reachGoal 'get_call_button_click'

  $('#video-container').bind 'click', ->
    reachGoal 'video_view'

  $(document).on 'call-me-form-invalid', ->
    reachGoal 'call_me_form_invalid'

  $(document).on 'call-me-form-valid', ->
    reachGoal 'call_me_form_valid'

  $(document).on 'first-form-invalid', ->
    reachGoal 'first_form_invalid'

  $(document).on 'first-form-valid', ->
    reachGoal 'first_form_valid'

  $(document).on 'last-form-invalid', ->
    reachGoal 'last_form_invalid'

  $(document).on 'last-form-valid', ->
    reachGoal 'last_form_valid'




  $(document).scroll ->

    if ($(window).scrollTop()) >= ($(document).height() - $(window).height()) / 2
      unless scrollToMiddle
        reachGoal 'scroll_to_middle'
        scrollToMiddle = true

    if ($(document).height() - $(window).height()) <= ($(window).scrollTop() + 25)
      unless scrollToBottom
        reachGoal 'scroll_to_bottom'
        scrollToBottom = true


reachGoal = (goal_name) ->
  yaCounter22020289.reachGoal goal_name
