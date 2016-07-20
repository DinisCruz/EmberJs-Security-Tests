describe 'ember | jquery | regression', ->
  payload          = null
  random_Number    = null

  beforeEach ->
    window.proof   = null
    random_Number  = Math.floor(Math.random() * 1000)    
    payload        = "<img src='' onerror='proof=#{random_Number}'/>"

  it 'sink: $(...)', (done)->
    console.log
    try
      $('#' + payload)      
    catch error 
      console.log error.message
      console.log error.stack
      done()
      
            
    

