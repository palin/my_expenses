DE.DashboardExpenses =
  execute: ->
    DE.DashboardExpenses.setDefaultDateFormat()
    DE.DashboardExpenses.getLastStoredDate()
    DE.DashboardExpenses.disableSubmit()
    DE.DashboardExpenses.optionalDataToggle()

  setDefaultDateFormat: ->
    $('#expense_payed_at').datepicker(dateFormat: "yy-mm-dd")

  disableSubmit: ->
    $('form').submit ->
      DE.DashboardExpenses.storeLastDate()
      $('input[type=submit]').attr('disabled', true).val('Saving...')

  storeLastDate: ->
    lastDate = $('#expense_payed_at').val()
    DE.SessionStorage.setData('last-expense-date', lastDate, 600)

  getLastStoredDate: ->
    lastDate = DE.SessionStorage.get('last-expense-date')
    $('#expense_payed_at').val(lastDate) if lastDate?

  optionalDataToggle: ->
    $('.optional-caption a').click ->
      div = $('.optional-fields')
      div.slideToggle()
