DE.Expenses =
  execute: ->
    DE.Expenses.setDefaultDateFormar()
    DE.Expenses.disableSubmit()

  setDefaultDateFormar: ->
    $('#expense_payed_at').datepicker(dateFormat: "yy-mm-dd")

  disableSubmit: ->
    $('form').submit ->
      $('input[type=submit]').attr('disabled', true).val('Saving...')
