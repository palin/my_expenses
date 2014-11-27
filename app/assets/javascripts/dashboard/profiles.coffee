DE.DashboardProfiles =
  execute: ->
    DE.DashboardProfiles.disableSubmit()

  disableSubmit: ->
    $('form').submit ->
      $('input[type=submit]').attr('disabled', true).val('Updating...')
