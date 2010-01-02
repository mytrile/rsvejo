RSvejo - Svejo.net API ruby wrapper
===================================

Информация
----------
RSvejo е библиотека за комуникация със http://svejo.net/.
Повече информация можете да намерите тук: http://groups.google.com/group/svejo/web/api

Инсталация
----------
    >> sudo gem install rsvejo
####  Изисквания : http://github.com/jnunemaker/httparty/


Описание на методите
--------------------


### Общи заявки:

    >> RSvejo.fresh_stories
    #  Връща последните публикации от секциятa - Свежи

    >> RSvejo.green_stories
    #  Връща последните публикации от секциятa - Нови

### Потребителски заявки

    >> RSvejo.voted_by "username"
    #  Последните статии, за които е гласувал въпросният потребител

    >> RSvejo.published_by "username"
    #  Последните статии, които е гласувал потребителят

    >> RSvejo.commented_by "username"
    #  Последните статии, които е публикувал потребителят

### Етикети/Тагове

    >> RSvejo.get_by_tag "tag_name"
    #  Най-новите публикации, които имат търсения етикет

### Сайтове

    >> RSvejo.get_by_site "domain_name"
    #  Най-новите публикации, които имат търсения етикет

### Коментари

    >> RSvejo.comments_for "publication_url"
    #  Коментарите в svejo.net относно определена публикация.
    #  Заедно с тях се връщат потребителите и линкове към техните аватари

## Относно

 * Автор  : Митко Костов <> http://mitkokostov.info
