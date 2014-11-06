DE.SessionStorage =
  set: (name, duration)->
    DE.SessionStorage.setData(name, 'true', duration)

  setData: (name, data, duration)->
    date = new Date()
    date.setSeconds(date.getSeconds() + duration)
    $.cookie(DE.SessionStorage.cookieName(name), data, expires: date)

  reset: (name)->
    $.removeCookie(DE.SessionStorage.cookieName(name))

  get: (name)->
    $.cookie(DE.SessionStorage.cookieName(name))

  has: (name)->
    DE.SessionStorage.get(name)?

  cookieName: (name)->
    "storage:#{name}"