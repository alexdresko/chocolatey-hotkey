'use strict';
var yeoman = require('yeoman-generator');
var chalk = require('chalk');
var yosay = require('yosay');

module.exports = yeoman.generators.Base.extend({
  prompting: function () {
    var done = this.async();

    // Have Yeoman greet the user.
    this.log(yosay(
      'Welcome to the funkadelic ' + chalk.red('Chocolateyhotkey') + ' generator!'
    ));

    var prompts = [{
      type: 'input',
      name: 'id',
      message: 'Enter a nuget compatible  id'
    }, {
    	type: 'input',
    	name: 'title',
    	message: 'What is the title of this ?'

    }, {
    	type: 'input',
    	name: 'version',
    	message: 'What is the version for this ?',
    	default: '1.0.0'
    }, { 
    	type: 'input',
    	name: 'author',
    	message: 'What is your name?'
    }
    , { 
    	type: 'input',
    	name: 'summary',
    	message: 'Enter a summary for this plugin?'
    }, { 
    	type: 'input',
    	name: 'description',
    	message: 'Enter a description for this plugin?'
    }, { 
    	type: 'input',
    	name: 'projectUrl',
    	message: 'Enter a project URL for this plugin?'
    }, { 
    	type: 'input',
    	name: 'tags',
    	message: 'Enter space-separated tags for this plugin?'
    }];

    this.prompt(prompts, function (props) {
      this.props = props;
      // To access props later use this.props.someOption;

      done();
    }.bind(this));
  },

  writing: {
    app: function () {
      this.fs.copyTpl(
        this.templatePath('TEMPLATE-NAME.nuspec'),
        this.destinationPath(this.props.id + '\\' + this.props.id + '.nuspec'),
        { props: this.props }
      );
      this.fs.copy(
        this.templatePath('*.ps1'),
        this.destinationPath(this.props.id)
      );
      this.fs.copy(
        this.templatePath('tools'),
        this.destinationPath(this.props.id + "\\tools")
      );
    }
  },

  install: function () {
    // this.installDependencies();
  }
});
