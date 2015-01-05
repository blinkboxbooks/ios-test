require 'calabash-cucumber/launcher'
require 'calabash-cucumber/failure_helpers'

#APP_BUNDLE_PATH="build/blinkbox.app"
#APP_BUNDLE_PATH="build/blinkbox-prod.app"

Before do |scenario|
  @calabash_launcher = Calabash::Cucumber::Launcher.new
  scenario_tags = scenario.source_tag_names
  if scenario_tags.include?('@reinstall')
    @calabash_launcher.reset_app_jail
  end
  unless @calabash_launcher.calabash_no_launch?
    @calabash_launcher.relaunch({:timeout => 120})
    @calabash_launcher.calabash_notify(self)
  end
end

After do |scenario|
  if scenario.failed?
    screenshot_embed(:prefix => conf_data['project']['log_screenshot_folder'])
  end
  unless @calabash_launcher.calabash_no_stop?
    calabash_exit
    if @calabash_launcher.active?
      @calabash_launcher.stop
    end
  end
end

at_exit do
  launcher = Calabash::Cucumber::Launcher.new
  if launcher.simulator_target?
    launcher.simulator_launcher.stop unless launcher.calabash_no_stop?
  end
end
