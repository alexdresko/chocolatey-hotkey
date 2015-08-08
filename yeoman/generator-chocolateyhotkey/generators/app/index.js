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
             'Welcome to the funkadelic ' + chalk.red('Chocolateyhotkey') + ' generator, son!'
             ));

    var prompts = [ { 
      type: 'list',
      name: 'type',
      choices: [
      { name: 'Plugin', value: 'plugin'},
      { name: 'Library', value: "lib"},
      { name: 'Host', value: "host"}
      ],
      message: 'What type of chocolatey hotkey thing do you want to create?',
      store: true
    }, {
      type: "confirm",
      name: "defaultHost",
      message: "Do you want to run in the default host?",
      default: true,
      when: function (answers) {
        return answers.type == "plugin";
      }
    },
    {
      type: 'input',
      name: 'host',
      message: 'What is the name of the host?',
      when: function (answers) {
        return !answers.defaultHost && answers.type === "plugin";
      },
      filter: function(input) {
        return input.toLowerCase();
      }
    },
    {
      type: 'input',
      name: 'id',
      message: 'Enter a nuget compatible  id',
      validate: function(input) {
        if (!input || input.trim() === "")  {
          return "id is required";
        }

        if (input.toLowerCase().indexOf("chk-") === 0)
        {

          return "No need to start with 'chk-'";
        }

        if (input.indexOf(" ") > -1) {
          return "Id cannot contain spaces.";
        }

        var r = /[ "]/;
        if (r.test(input)) {
          return "Id contains invalid characters.";
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
        default: function(answers) {
            return answers.id;
        },
     validate: function(input) {
      if (!input || input.trim() === "")  {
        return "This field is required.";
      }


      return true;

    }

  }
, { 
 type: 'input',
 name: 'summary',
 message: 'Enter a summary for this thing?',
 default: function(answers) {
            return answers.title;
        },
 validate: function(input) {
  if (!input || input.trim() === "")  {
    return "This field is required.";
  }


  return true;

}
}, { 
 type: 'input',
 name: 'description',
 message: 'Enter a description for this thing?',
 default: function(answers) {
            return answers.summary;
        },
        validate: function(input) {
  if (!input || input.trim() === "")  {
    return "This field is required.";
  }


  return true;

}
}
, {
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
      return "This field is required.";
    }


    return true;

  }
}
, { 
 type: 'input',
 name: 'projectUrl',
 message: 'Enter a project URL for this thing?',
 store: true
}, { 
 type: 'input',
 name: 'tags',
 message: 'Enter space-separated tags for this thing?',
}];

this.prompt(prompts, function (props) {
  this.props = props;



  if (this.props.defaultHost) {
    this.props.host = "default";
  }

    if (this.props.type === "plugin") {
      this.props.dependency = "chk-host-" + this.props.host;
  } else  {
    this.props.dependency = "chk";
  }

  done();
}.bind(this));



},

writing: {
  app: function () {
    this.props.prefix = this.props.host + "-";
    if (this.props.type === "host") {
      this.props.prefix = "host-"
    } else if (this.props.type === "lib") {
      this.props.prefix = "lib-"
    }

    this.fs.copyTpl(
                    this.templatePath('TEMPLATE-NAME.nuspec'),
                    this.destinationPath("chk-" + this.props.prefix  + this.props.id + '\\chk-' + this.props.prefix + this.props.id + '.nuspec'),
                    { props: this.props }
                    );
    this.fs.copy(
                 this.templatePath('*.ps1'),
                 this.destinationPath("chk-"+ this.props.prefix  + this.props.id)
                 );

    if (this.props.type === "plugin") {
      var files = [ "chk-plugin-HOST-1-init-environment.ahk",
      "chk-plugin-HOST-2-init-variables.ahk",
      "chk-plugin-HOST-3-init-gui.ahk",
      "chk-plugin-HOST-4-hotkeys.ahk",
      "chk-plugin-HOST-5-subroutines.ahk",
      "chk-plugin-HOST-6-subroutines-gui.ahk",
      "chk-plugin-HOST-7-functions.ahk" ];

      for (var i = 0; i < files.length; i++ ) {
        var file = files[i];
        this.fs.copy(
                     this.templatePath('plugin\\' + file),
                     this.destinationPath("chk-"+ this.props.prefix  + this.props.id + "\\tools\\" + file.replace("HOST", this.props.host))
                     );
      }

      this.fs.copy(
                   this.templatePath('plugin\\*.ps1'),
                   this.destinationPath("chk-" + this.props.prefix  + this.props.id + "\\tools" )
                   );
    } else if (this.props.type === "lib") { 
      this.fs.copy(
                   this.templatePath('lib\\chk-lib.ahk'),
                   this.destinationPath("chk-lib-"  + this.props.id + "\\tools\\chk-lib-" + this.props.id + ".ahk" )
                   );
    } else if (this.props.type === "host") { 

     this.fs.copy(
                  this.templatePath('host\\_chk-host.ahk'),
                  this.destinationPath("chk-host-"  + this.props.id + "\\tools\\chk-host-" + this.props.id + ".ahk")       
                  );
     this.fs.copy(
                  this.templatePath('host\\uninstall.ahk'),
                  this.destinationPath("chk-host-"  + this.props.id + "\\tools\\uninstall.ahk")       
                  );
     this.fs.copy(
                  this.templatePath('host\\*.ps1'),
                  this.destinationPath("chk-host-"  + this.props.id + "\\tools" )
                  );
   } 

 }
},

install: function () {
    // this.installDependencies();
  }
});
