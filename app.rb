# -*- coding: utf-8 -*-
require 'fileutils'
require 'tmpdir'

ARGV.select{|x| x.downcase =~ /\.rar$/}.each do |rar|
  FileUtils.cd "/work"
  puts "Start: #{rar}"
  zip = rar.sub(/RAR$|rar/, 'zip')
  Dir.mktmpdir{|dir|
    FileUtils.cp rar, dir
    FileUtils.cd dir
    FileUtils.mv rar, "x.rar"
    system "unrar", "x", "x.rar"
    FileUtils.rm "x.rar"
    system "zip", "-r", zip, "."
    FileUtils.mv zip, '/work'
  }
end
