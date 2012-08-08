#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

TestApp::Application.load_tasks

task :init_cats_photos => :environment do
  for dir in Dir.glob('public/assets/*')

    cat = Category.new()
    cat.name = dir.split("/").last
    cat.save

    Dir.glob(dir + "/*.jpg").entries.each do |file|
      photo = Photo.new()
      photo.category_id = cat.id
      photo.address = File.open(file)
      photo.save
    end

  end
end