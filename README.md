Sunzi Recipes
=============

[Sunzi](https://github.com/kenn/sunzi) is a server provisioning tool for minimalists.

This repository is a public source for Sunzi recipes.

Recipes in this repository can be directly retrieved by `sunzi compile`. Just point to the URL of raw files in `sunzi.yml`.

Templates
=========

Many of the recipes reference files.  I've added the templates that I use.  Note that some of these use string replacement that is only enabled in my fork of sunzi.  You can find my fork at https://github.com/mm53bar/sunzi.

Rakefile
========

While Sunzi has support for creating Linode VMs, I prefer to use EC2.  I've created a Rakefile that uses Fog to create an EC2 instance and then passes off to Sunzi to do the provisioning.  I've uploaded my Rakefile as a gist at https://gist.github.com/2427e5015487683305ed
 
