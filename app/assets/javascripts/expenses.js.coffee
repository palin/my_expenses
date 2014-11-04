# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.Expenses =
  clearInputs: ->
    $('input[type=text], input[type=number]').val('')

  friendlyDate: (daysAgo)->
    date = new Date()
    date.setDate(date.getDate() - daysAgo)
    date = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate()

  dates: ->
    twoDaysAgo = Expenses.friendlyDate(2)
    yesterday = Expenses.friendlyDate(1)
    today = Expenses.friendlyDate(0)

    [twoDaysAgo, yesterday, today]

  names: ->
    ['Gas bill', 'House cleaning', 'New TV']

  prices: ->
    ['190.75', '30', '349.99']

  examplesLoop: (counter)->
    counter = 0 if counter > 2
    Expenses.clearInputs()
    window.setTimeout ->
      $('#expense_payed_at').typetype(Expenses.dates()[counter], {
        e: 0
        t: 150
        callback: -> $('#expense_name').typetype(Expenses.names()[counter], {
          e: 0
          t: 150
          callback: -> $('#expense_price').typetype(Expenses.prices()[counter], {
            e: 0
            t: 150
            callback: ->
              window.setTimeout(->
                Expenses.clearInputs()
                Expenses.examplesLoop(counter + 1)
              , 1000)
            });
          });
        });
    , 1000

$(document).ready ->
  Expenses.examplesLoop(0)
