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

        if (input.toLowerCase().indexOf("chk-") === 0)
        {
          log(yosay("No need to start with 'chk-'"));
          return false;
        }

        if (input.indexOf(" ") > -1) {
          log(yosay("Id cannot contain spaces."));
          return false;
        }

        var r = /[ "]/;
        if (r.test(input)) {
          log(yosay("Id contains invalid characters."));
        }

        return true;

      },
      filter: function(input) {
        return input.toLowerCase();
      }
    }, {
    	type: 'input',
    	name: 'title',
    	message: 'What is the title of this thing?',
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
    	message: 'Enter a summary for this thing?',
       validate: function(input) {
        if (!input || input.trim() === "")  {
          return false;
        }


        return true;

      }
    }, { 
    	type: 'input',
    	name: 'description',
    	message: 'Enter a description for this thing?',
       validate: function(input) {
        if (!input || input.trim() === "")  {
          return false;
        }


        return true;

      }
    }, { 
    	type: 'input',
    	name: 'projectUrl',
    	message: 'Enter a project URL for this thing?',
      store: true
    }, { 
    	type: 'input',
    	name: 'tags',
    	message: 'Enter space-separated tags for this thing?',
      store: true
    }, { 
      type: 'list',
      name: 'type',
      choices: [
        { name: 'Plugin', value: 'chocolateyhotkey-plugin'},
        { name: 'Library', value: "chocolateyhotkey-lib"},
        { name: 'Self-contained', value: "chocolateyhotkey-self"}
      ],
      message: 'What type of chocolatey hotkey thing is this?',
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
        this.destinationPath("chk-" + this.props.id + '\\chk-' + this.props.id + '.nuspec'),
        { props: this.props }
      );
      this.fs.copy(
        this.templatePath('*.ps1'),
        this.destinationPath("chk-" + this.props.id)
      );

      if (this.props.type === "chocolateyhotkey-plugin") {
          this.fs.copy(
          this.templatePath('plugin'),
          this.destinationPath("chk-" + this.props.id + "\\tools")
        );
      } else if (this.props.type === "chocolateyhotkey-lib") { 
          this.fs.copy(
          this.templatePath('library'),
          this.destinationPath("chk-" + this.props.id + "\\tools")
          );
      } else {
        
      }

    }
  },

  install: function () {
    // this.installDependencies();
  }
});
