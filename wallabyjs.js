module.exports = function ( ) {
    return {
        files: [
            { pattern: 'bower_components/jquery/dist/jquery.js', instrument: false, load: true, ignore: false },
            { pattern: 'bower_components/ember/ember.min.js'       , instrument: false, load: true, ignore: false },
            { pattern: 'node_modules/chai/chai.js'                 , instrument: false, load: true, ignore: false },
            { pattern: 'src/**/*.coffee'                                                                          },
        ],

        tests: [
            'test/**/*.coffee'
        ],

        testFramework: 'mocha',

//        env: {
//            type: 'node'
//        },
        workers: {
            recycle: true
        },
        bootstrap: function() {
            window.expect = chai.expect;
        }
    };
};