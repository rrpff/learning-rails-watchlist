TMDB = {}

TMDB.search = (query, cb) ->
    $.getJSON "/films/search/#{query}", cb

TMDB.first = (query, cb) ->
    TMDB.search query, (data) ->
        cb.call @, data.results[0]

$ ->

    $form = $('.new_film')
    $list = $('.film-list')

    $input = $('#film_tmdb_id')

    submit = (value) ->
        $input.val value
        $form.submit()
        $input.val ''

    $form.on 'ajax:success', (ev, html) ->
        $list.append $(html)
        console.log arguments

    $form.on 'ajax:error', ->
        console.log arguments

    $form.on 'submit', (ev) ->
        ev.preventDefault()
        value = $input.val()
        TMDB.first value, (film) ->
            submit film.id if film