describe 'ember | jquery | security', ->
  payload          = null
  random_Number    = null

  beforeEach ->
    window.proof   = null
    random_Number  = Math.floor(Math.random() * 1000)
    #payload        = "<svg/onload='proof=#{random_Number}'/>"                  # works in wallaby, doesn't work in Karma
    payload        = "<img src='' onerror='proof=#{random_Number}'/>"

  
  afterEach (done)->
    check_Random_Number = ->                                                    # method to check if random number was correctly assigned 
      window.proof.assert_Is random_Number                                      # window.proof should match random_Number
      done()                                                                    # call done to finish the async test
                                                                                 
    wait_For_Value = ->                                                         # method to wait for window.proof to be set
      if window.proof                                                           # when window.proof is set
        check_Random_Number()                                                   #   call check_Random_Number                       
      else                                                                      # if not
        setTimeout wait_For_Value, 0                                            #   wait for a cycle (making this 0 or 1 had similar results)
                                                                                
    wait_For_Value()                                                            # trigger loop
      

  it 'sink: $(...)', ()-> $(payload)

  it 'sink: $(...)', ()->
    console.log
    try
      $('#' + payload)
    catch message 
      console.log message      
            
    

