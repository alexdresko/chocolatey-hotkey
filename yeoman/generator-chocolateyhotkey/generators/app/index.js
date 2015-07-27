'use strict';
var yeoman = require('yeoman-generator');
var chalk = require('chalk');
var yosay = require('yosay');

module.exports = yeoman.generators.Base.extend({
  prompting: function () {
    var done = this.async();
    var log = this.log;
    // Have Yeoman greet the user.
    this.log(yosay(
      'Welcome to the funkadelic ' + chalk.red('Chocolateyhotkey') + ' generator!'
    ));

    var prompts = [{
      type: 'input',
      name: 'id',
      message: 'Enter a nuget compatible  id',
      validate: function(input) {
        if (!input || input.trim() === "")  {
          return false;
        }


        return true;

      }
    }, {
    	type: 'input',
    	name: 'title',
    	message: 'What is the title of this ?',
       validate: function(input) {
        if (!input || input.trim() === "")  {
          return false;
        }


        return true;

      }

    }, {
    	type: 'input',
    	name: 'version',
    	message: 'What is the version for this ?',
    	default: '1.0.0'
    }, { 
    	type: 'input',
    	name: 'author',
    	message: 'What is your name?',
      required: true,
      store: true,
       validate: function(input) {
        if (!input || input.trim() === "")  {
          return false;
        }


        return true;

      }
    }
    , { 
    	type: 'input',
    	name: 'summary',
    	message: 'Enter a summary for this plugin?',
       validate: function(input) {
        if (!input || input.trim() === "")  {
          return false;
        }


        return true;

      }
    }, { 
    	type: 'input',
    	name: 'description',
    	message: 'Enter a description for this plugin?',
       validate: function(input) {
        if (!input || input.trim() === "")  {
          return false;
        }


        return true;

      }
    }, { 
    	type: 'input',
    	name: 'projectUrl',
    	message: 'Enter a project URL for this plugin?',
      store: true
    }, { 
    	type: 'input',
    	name: 'tags',
    	message: 'Enter space-separated tags for this plugin?',
      store: true
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
