require 'fileutils'
require 'yaml'
@conf = YAML.load_file("config/project_settings.yml")
namespace :ios do
  task :clean do
    system("rm -rf ios 2>/dev/null")
  end
  desc "Get the BBB-ios mobile project"
  task :get_ios_project do
    system("git clone #{@conf['remote']['endpoint_download']} #{@conf['project']['src_dir']} 2>/dev/null")
  end
  desc "Sets up calabash target"
  task :generate_calabash_target do
    system("calabash-ios setup #{@conf['project']['src_dir']}/") do
    end
  end
  desc "Compile App"
  task :compile_app do
    include FileUtils
    if !Dir[@conf['project']['src_dir']].empty?
      Dir.chdir(@conf['project']['src_dir']) do
        ret = system("xcodebuild -scheme BBBApp -configuration Debug -target BBBApp-cal -sdk iphonesimulator7.1")
        if !ret
          fail "Build failed with error"
        end
        if !Dir[@conf['project']['product_dir']].empty?
          puts("Found build artifacts")
          system("ls #{@conf['project']['product_dir']}")
        else
          puts "Build artifacts not found"
        end
      end
    else
      puts "Could not find ios project directory"
    end
  end
  desc "Installs the app onto the simulator"
  task :install_app do
    if !system("ios-sim --help 2>/dev/null")
      fail "Warning ios-sim is not installed with brew. Please run 'rake calabash:environment_install'"
    end
    system("ios-sim launch #{@conf['project']['src_dir']}/#{@conf['project']['product_dir']}/blinkbox.app --tall --retina --exit")
  end
  desc "Performs download,build and installation of app onto simulator"
  task :setup do
    Rake::Task["ios:clean"].invoke
    Rake::Task["ios:get_ios_project"].invoke
    Rake::Task["ios:generate_calabash_target"].invoke
    Rake::Task["ios:compile_app"].invoke
    Rake::Task["ios:install_app"].invoke
  end
  desc "Runs all tests"
  task :run do
    system("cucumber")
  end
end

namespace :calabash do
  desc "Installs necessary tools for the development environment"
  task :environment_install do
    system("./config/dev_env_install")
  end
end

task :default do

end
