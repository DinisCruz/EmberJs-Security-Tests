module.exports = function(config) {
    config.set({
        frameworks: ['mocha'],
        files: [
            'bower_components/jquery/dist/jquery.min.js',
            'bower_components/ember/ember.min.js',
            'node_modules/chai/chai.js',
            'src/**/*.coffee',
            'test/**/*.coffee'
        ],
        preprocessors : {
            'src/**/*.coffee': ['coffee'],
            'test/**/*.coffee': ['coffee'],
        },
        autoWatch: true,
        singleRun: true,  
        browsers: ['PhantomJS']
    });
};