$ ->

    $form = $('.new_film')
    $list = $('.film-list')

    template = """
        <li>
            <strong>#{obj.title}</strong>
        </li>
    """

    $form.on 'ajax:success', (ev, data) ->
        list.append $ template data