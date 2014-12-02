DE.Home =
  execute: ->
    DE.Home.examplesLoop(0)
    DE.Home.handleNextLineClick()

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
    ['Train ticket', 'Burger and chips', 'Visit in Grand Palace', 'Trip out of town']

  prices: ->
    ['6.49', '9.95', '30', '45']

  imageClasses: ->
    ['train-ticket', 'burger-and-chips', 'visit-in-grand-palace', 'trip-out-of-town']

  removeImageClasses: (counter)->
    $('.top-slider-bg').removeClass(DE.Home.imageClasses().join(' ')).fadeOut('fast', -> DE.Home.addImageClass(counter))

  addImageClass: (counter)->
    $('.top-slider-bg').addClass(DE.Home.imageClasses()[counter]).fadeIn('fast')

  examplesLoop: (counter)->
    counter = 0 if counter > 3
    DE.Home.clearInputs()
    DE.Home.removeImageClasses(counter)

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
              , 2000)
            });
          });
        });
    , 1000

  handleNextLineClick: ->
    $('.go-to-next-line').click (e)->
      to = $(e.currentTarget).data('to')
      DE.Home.scrollToElement(to)


  scrollToElement: (el)->
    speed = 600
    $('html,body').animate
      scrollTop: $(".#{el}").offset().top - 30
    , speed