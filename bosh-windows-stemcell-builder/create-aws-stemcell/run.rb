#!/usr/bin/env ruby

require 'fileutils'

require_relative '../../../stemcell-builder/lib/exec_command'

Dir.chdir "stemcell-builder" do
  exec_command("bundle install")
  exec_command("rake package:agent")
  exec_command("rake package:psmodules")
  exec_command("rake build:aws")
  exec_command("mv bosh-windows-stemcell/*.tgz ../bosh-windows-stemcell")
  exec_command("mv bosh-windows-stemcell/*.sha ../sha")
end
