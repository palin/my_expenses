DE.Expenses =
  execute: ->
    DE.Expenses.setDefaultDateFormat()
    DE.Expenses.getLastStoredDate()
    DE.Expenses.disableSubmit()

  setDefaultDateFormat: ->
    $('#expense_payed_at').datepicker(dateFormat: "yy-mm-dd")

  disableSubmit: ->
    $('form').submit ->
      DE.Expenses.storeLastDate()
      $('input[type=submit]').attr('disabled', true).val('Saving...')

  storeLastDate: ->
    lastDate = $('#expense_payed_at').val()
    DE.SessionStorage.setData('last-expense-date', lastDate, 600)

  getLastStoredDate: ->
    lastDate = DE.SessionStorage.get('last-expense-date')
    $('#expense_payed_at').val(lastDate) if lastDate?