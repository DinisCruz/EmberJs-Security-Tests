describe 'ember | check main object', ->
  it 'should have access to jQuery object', ->        
    $.fn.jquery.assert_Is '2.2.4'
    $          .assert_Is jQuery

  it 'should have access to Ember object', ->
    (typeof Ember).assert_Is 'object'
    Ember.__loader.require.has('ember-application/index').assert_Is_True()    
    Ember.$.fn.jquery.assert_Is '2.2.4'

  it 'Ember.$ is jQuery', ->
    Ember.$.assert_Is $