# rpg-maker-passive-skills
Passive skills for rpg maker VX ACE

###How to install
- install as gem with SideScriptLoader (https://github.com/godsent/rpg-maker-side-script-loader) OR
- add batch.rb to scripts of your project

###How to use
- Create effect with some features (e.g. +critical chance or acuracy)
- Create skill which will add this effect 
- Mark the skill with <passive> tag in note.
- Add the skill to actor's class or enemy's actions.
- All effect's features will work constantly as long as an actor or enemy will have the skill.
