$ ->

    $form = $('.new_film')
    $list = $('.film-list')

    $form.on 'ajax:success', (ev, html) ->
        $list.append $(html)
        console.log arguments

    $form.on 'ajax:error', ->
        console.log arguments