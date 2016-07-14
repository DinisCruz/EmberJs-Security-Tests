describe 'ember | jquery | security', ->

  it 'Ember.$ exposes direcly the jQuery object', ->
    Ember.$.assert_Is $

  it 'should execute javascript via Ember.$(...)', (done)->    
    payload = 'exploit=42'
    html = "<img src=aaa onerror='#{payload}' />"           # there must be a better way to trigger js from a jQuery selector

    Ember.$(html)

    test = ()->
      exploit.assert_Is 42                                  # if exploit value is is set and is 42, means that js executed ok
      done()
    
    setTimeout test, 10                                     # wallby runs with 2 ms
