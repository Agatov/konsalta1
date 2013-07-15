$ ->
  $('.submit-order').bind 'click', ->
    username = $(@).parent().find('input[name=username]')
    phone = $(@).parent().find('input[name=phone]')
    email = $(@).parent().find('input[name=email]')
    if phone.val().length != 11
      phone.parent().find('.phone-error').hide(100).show(300)
      phone.attr('style', 'border: 1px solid red;')
      return false
    $.post 'orders', {'order[username]': username.val(), 'order[phone]': phone.val(), 'order[email]': email.val()}, (data) =>
      if data.status == 'ok'
        form = $(@).parent()
        form.hide 'slide', {direction: 'left'}, ->
          form.parent().find(".success").show 'slide', {direction: 'right'}, ->
            setTimeout(
              ->
                hideDialog() if form.attr('data-dialog') == 'yes'
              1000
            )
  $('input[name=phone]').bind 'keyup', ->
    number = $(@).val()
    number_arr = number.split('')
    normal_arr = []
    for symbol in number_arr
      unless isNaN(parseInt(symbol))
        normal_arr.push parseInt(symbol)
    if normal_arr[0] != 8
      normal_arr.unshift 8
    $(@).val(normal_arr.join(''))