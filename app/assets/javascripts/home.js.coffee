DE.Home =
  execute: ->
    DE.Home.examplesLoop(0)

  clearInputs: ->
    $('input[type=text], input[type=number]').val('')

  friendlyDate: (daysAgo)->
    date = new Date()
    date.setDate(date.getDate() - daysAgo)
    date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate()

  dates: ->
    oneMonthAgo = DE.Home.friendlyDate(30)
    twoDaysAgo = DE.Home.friendlyDate(2)
    yesterday = DE.Home.friendlyDate(1)
    today = DE.Home.friendlyDate(0)

    [oneMonthAgo, twoDaysAgo, yesterday, today]

  names: ->
    ['Trip to Thailand', 'Gas bill', 'House cleaning', 'New TV']

  prices: ->
    ['1300', '190.75', '30', '349.99']

  examplesLoop: (counter)->
    counter = 0 if counter > 2
    DE.Home.clearInputs()
    window.setTimeout ->
      $('#expense_payed_at').typetype(DE.Home.dates()[counter], {
        e: 0
        t: 100
        callback: -> $('#expense_name').typetype(DE.Home.names()[counter], {
          e: 0
          t: 100
          callback: -> $('#expense_price').typetype(DE.Home.prices()[counter], {
            e: 0
            t: 100
            callback: ->
              window.setTimeout(->
                DE.Home.clearInputs()
                DE.Home.examplesLoop(counter + 1)
              , 1000)
            });
          });
        });
    , 1000
